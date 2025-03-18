import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:terra_galery/flutter_flow/flutter_flow_util.dart';
import 'package:terra_galery/pages/shrinkage_calculator/providers/grano_provider.dart';

import '../../components/dropdown.dart';
import '../../components/helper.dart';
import 'models/grano_model.dart';
import 'widgets/explanation_widget.dart';

class MermasScreen extends StatefulWidget {
  @override
  State<MermasScreen> createState() => _MermasScreenState();
}

class _MermasScreenState extends State<MermasScreen> {
  OverlayEntry? _overlayEntry;
  final FocusNode _focusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  void _showResultsModal(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child:
              Consumer<GranoProvider>(builder: (context, granoProvider, child) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Resultados",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3b7d24),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     IconButton(
                          //       icon: Icon(
                          //         Icons.close,
                          //         size: 32,
                          //         color: Color(0xff144C27),
                          //       ),
                          //       onPressed: () {
                          //         Navigator.of(context).pop();
                          //       },
                          //     ),
                          //   ],
                          // ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            width: 250 * ffem,
                            height: 35 * ffem,
                            decoration: BoxDecoration(
                              color: Color(0xffefefef),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelStyle: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              unselectedLabelStyle: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff3b7d24),
                              ),
                              indicator: BoxDecoration(
                                color: Color(0xff57af37),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              tabs: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Tab(
                                    text: "Resumido",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Tab(text: "Detallado"),
                                ),
                              ],
                              dividerColor: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: DataTable(
                                      headingRowHeight: 0,
                                      dataRowHeight: 100,
                                      border: TableBorder.all(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      columns: [
                                        DataColumn(label: const SizedBox()),
                                        DataColumn(label: const SizedBox()),
                                      ],
                                      rows: [
                                        DataRow(
                                          cells: [
                                            boldDataCell("Kg. Brutos"),
                                            boldDataCell(
                                                "${granoProvider.kilogramosIniciales?.toStringAsFixed(0) ?? 0} Kgs."),
                                          ],
                                        ),
                                        DataRow(
                                          cells: [
                                            regularDataCell("Secado"),
                                            regularDataCell(
                                                "${granoProvider.mermaPorSecadoResult}"),
                                          ],
                                        ),
                                        DataRow(
                                          cells: [
                                            regularDataCell("Zarandeo"),
                                            regularDataCell(
                                                "${granoProvider.mermaPorZarandeoResult}"),
                                          ],
                                        ),
                                        DataRow(
                                          cells: [
                                            regularDataCell("Volátil"),
                                            regularDataCell(
                                                "${granoProvider.mermaVolatilResult}"),
                                          ],
                                        ),
                                        DataRow(
                                          cells: [
                                            boldDataCell("Kg. Netos"),
                                            boldDataCell(
                                                "${granoProvider.kilosDespuesMermaVolatil.toStringAsFixed(0)} Kgs."),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: granoProvider
                                            .resultadoDetallado.isNotEmpty
                                        ? Text(
                                            granoProvider.resultadoDetallado,
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          )
                                        : Text(
                                            "No hay resultados detallados.",
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xff3b7d24),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Volver",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }

  void showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Ingrese todos los valores necesarios',
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

  void showCustomMenu(String title, Widget body) {
    _overlayEntry?.remove();
    _overlayEntry = Helper.createOverlayEntry(
      context,
      title,
      body,
      () {
        _overlayEntry?.remove();
        _overlayEntry = null;
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GranoProvider>(
      builder: (context, granoProvider, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              title: Text(
                "CALCULADORA DE MERMAS",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3b7d24),
                ),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: Color(0xff144C27),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.info_outline,
                    size: 32,
                    color: Color(0xff144C27),
                  ),
                  onPressed: () {
                    showCustomMenu('Explicación', ExplanationWidget());
                  },
                ),
              ],
            ),
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    MediaQuery.of(context).padding.top,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      DropdownWidget<String>(
                        header: 'Selecciona un grano',
                        value: granoProvider.granoActual.nombre,
                        items: granoProvider.listaGranos.map((Grano grano) {
                          return grano.nombre;
                        }).toList(),
                        itemBuilder: (String item) {
                          return item;
                        },
                        onChanged: (String? value) {
                          granoProvider.setGranoActual(value);
                        },
                        width: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                          label: Text(
                            "Kilogramos iniciales",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                            maxLines: 3,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff3b7d24), width: 2),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff3b7d24), width: 2),
                          ),
                        ),
                        cursorColor: Color(0xff3b7d24),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          granoProvider.kilogramosIniciales =
                              double.tryParse(value);
                        },
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        onSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_secondFocusNode);
                        },
                      ),
                      const SizedBox(height: 10),
                      if (granoProvider.granoActual.humedadDeComercializacion !=
                          0)
                        TextField(
                          focusNode: _secondFocusNode,
                          decoration: InputDecoration(
                            label: Text(
                              "Humedad inicial (%)",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                              maxLines: 3,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff3b7d24), width: 2),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff3b7d24), width: 2),
                            ),
                          ),
                          cursorColor: Color(0xff3b7d24),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d*')),
                          ],
                          onChanged: (value) {
                            granoProvider.humedadInicial =
                                double.tryParse(value);
                          },
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      const SizedBox(height: 10),
                      if (granoProvider
                          .granoActual.zarandeoMalezaNombre.isNotEmpty)
                        TextField(
                          focusNode: _secondFocusNode,
                          decoration: InputDecoration(
                            label: Text(
                              "Semillas de ${granoProvider.granoActual.zarandeoMalezaNombre}",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                              maxLines: 3,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff3b7d24), width: 2),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff3b7d24), width: 2),
                            ),
                          ),
                          cursorColor: Color(0xff3b7d24),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            granoProvider.cantidadSemillasMaleza =
                                int.parse(value);
                          },
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      const SizedBox(height: 10),
                      if (granoProvider
                                  .granoActual.porcentajeMermaPorZarandeo ==
                              -1 &&
                          granoProvider.cantidadSemillasMaleza! >
                              granoProvider.granoActual
                                  .toleranciaSemillasMalezaPermitidas)
                        TextField(
                          focusNode: _secondFocusNode,
                          decoration: InputDecoration(
                            label: Text(
                              "Porcentaje de merma por zarandeo",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                              maxLines: 3,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff3b7d24), width: 2),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff3b7d24), width: 2),
                            ),
                          ),
                          cursorColor: Color(0xff3b7d24),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d*')),
                          ],
                          onChanged: (value) {
                            granoProvider.porcentajeMermaPorZarandeo =
                                double.tryParse(value);
                          },
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Calcular merma volátil",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                              maxLines: 3,
                            ),
                          ),
                          Checkbox(
                            value: granoProvider.calcularMermaVolatil,
                            onChanged: (bool? value) {
                              granoProvider
                                  .setCalcularMermaVolatil(value ?? false);
                            },
                            fillColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return const Color(0xff3b7d24);
                                }
                                return Colors.white;
                              },
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          final result = granoProvider.calcularMermas();
                          if (result) {
                            _showResultsModal(context);
                          } else
                            showErrorSnackBar(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color(0xff3b7d24),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "Calcular",
                            style: GoogleFonts.poppins(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  DataCell regularDataCell(String text) {
    return DataCell(
      Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  DataCell boldDataCell(String text) {
    return DataCell(
      Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
