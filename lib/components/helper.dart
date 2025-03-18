import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Helper {
  const Helper._();

  static TextSpan buildRichText(String text) {
    final List<InlineSpan> spans = [];
    final RegExp exp = RegExp(r'(\*.*?\*)|([^*]+)');
    final matches = exp.allMatches(text);

    for (final match in matches) {
      final group = match.group(0)!;

      if (group.startsWith('*') && group.endsWith('*')) {
        spans.add(
          TextSpan(
            text:
                group.substring(1, group.length - 1), // Remueve los asteriscos.
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      } else {
        spans.add(
          TextSpan(text: group),
        );
      }
    }

    return TextSpan(
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18,
          color: Colors.black,
        ),
        children: spans);
  }

  static void showErrorSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xffffffff),
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: Color(0xffff0e0e),
      ),
    );
  }

  static OverlayEntry createOverlayEntry(
    BuildContext context,
    String title,
    Widget body,
    VoidCallback onClose,
  ) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: onClose,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Container(
              width: size.width - 25,
              child: Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 5.0,
                shadowColor: Colors.black.withOpacity(0.8),
                color: const Color.fromARGB(255, 213, 211, 211),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(5, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: onClose,
                            child: Icon(
                              Icons.close,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // Body
                      body,
                      const SizedBox(height: 25),
                      // Footer
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: onClose,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xff3b7d24),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "Cerrar",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
