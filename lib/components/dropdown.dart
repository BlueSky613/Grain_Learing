import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

GlobalKey _compositedTransformKey = GlobalKey();

class DropdownWidget<T> extends StatefulWidget {
  const DropdownWidget({
    Key? key,
    required this.items,
    required this.itemBuilder,
    required this.onChanged,
    required this.value,
    this.header,
    this.unselectedItemColor,
    this.width = 80,
  }) : super(key: key);
  final List<T> items;
  final String? header;
  final void Function(T value) onChanged;
  final String Function(T item) itemBuilder;
  final T value;
  final double width;
  final Color? unselectedItemColor;

  @override
  State<DropdownWidget<T>> createState() => _DropdownWidgetState<T>();
}

class _DropdownWidgetState<T> extends State<DropdownWidget<T>>
    with SingleTickerProviderStateMixin {
  var _expanded = false;
  OverlayEntry? overlay;
  late AnimationController controller;
  late Animation<double> arrowAngle;
  final key = GlobalKey();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
    );
    controller.addListener(() {
      setState(() {});
    });
    arrowAngle = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(controller);

    super.initState();
  }

  void _changeExpansionStatus() {
    if (_expanded) {
      removeOverlay();
    } else {
      insertOverlay(context);
    }

    setState(() {
      _expanded = !_expanded;
      _expanded ? controller.forward() : controller.reverse();
    });
  }

  @override
  void dispose() {
    if (_expanded && overlay != null) overlay?.remove();
    super.dispose();
  }

  void removeOverlay() {
    overlay?.remove();
  }

  final layerLink = LayerLink();

  void insertOverlay(BuildContext context) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final widgetWidth = renderBox.size.width;

      overlay = OverlayEntry(
        maintainState: true,
        builder: (context) => Positioned(
          top: key.currentContext!.position.dy,
          left: key.currentContext!.position.dx,
          child: CompositedTransformFollower(
            showWhenUnlinked: false,
            offset: const Offset(
              0,
              42,
            ),
            link: layerLink,
            child: _OverlayDropdown<T>(
              width: widgetWidth,
              selectedValue: widget.value,
              values: widget.items,
              color: widget.unselectedItemColor,
              onSelectedItem: (val) {
                _changeExpansionStatus();
                widget.onChanged.call(val);
              },
              textBuilder: widget.itemBuilder,
            ),
          ),
        ),
      );

      Overlay.of(context)?.insert(overlay!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.header != null) ...[
          Text(
            widget.header!,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
        ],
        CompositedTransformTarget(
          link: layerLink,
          child: GestureDetector(
            onTap: _changeExpansionStatus,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFE8E9EA),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              key: key,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              width: widget.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.itemBuilder.call(widget.value).toUpperCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3b7d24),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 24,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _OverlayDropdown<T> extends StatelessWidget {
  const _OverlayDropdown({
    Key? key,
    required this.values,
    required this.textBuilder,
    required this.selectedValue,
    required this.onSelectedItem,
    required this.width,
    this.color = Colors.transparent,
  }) : super(key: key);
  final List<T> values;
  final Color? color;
  final double width;
  final T selectedValue;
  final String Function(T item) textBuilder;
  final void Function(T value) onSelectedItem;
  @override
  Widget build(BuildContext context) {
    print(width);
    return Material(
      color: color ?? Colors.transparent,
      child: Container(
        width: width,
        height: null,
        constraints: const BoxConstraints(maxHeight: 220),
        decoration: BoxDecoration(
          color: const Color(0xFFE8E9EA),
          border: Border.all(
            color: const Color.fromARGB(255, 181, 181, 182),
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: values
                .map<_OverlayDropdownItem<T>>(
                  (e) => _OverlayDropdownItem<T>(
                    value: e,
                    textBuilder: textBuilder,
                    onTap: onSelectedItem,
                    isSelected: e == selectedValue,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _OverlayDropdownItem<T> extends StatelessWidget {
  const _OverlayDropdownItem({
    Key? key,
    required this.value,
    required this.textBuilder,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final T value;
  final bool isSelected;
  final String Function(T item) textBuilder;
  final void Function(T value) onTap;
  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).textScaleFactor;
    return GestureDetector(
      onTap: () => onTap.call(value),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 12,
        ),
        height: 40 * scale,
        color: Colors.transparent,
        child: Text(
          textBuilder.call(value),
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Color(0xff3b7d24) : Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

extension _BuildContextExtension on BuildContext {
  RenderBox get renderBox => findRenderObject() as RenderBox;
  Offset get position {
    final render = renderBox.localToGlobal(Offset.zero);
    return render;
  }
}
