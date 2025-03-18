import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:terra_galery/pages/shrinkage_calculator/providers/grano_provider.dart';
import 'package:terra_galery/pages/tas_calculator/models/grano_model.dart';
import 'package:terra_galery/pages/tas_calculator/widgets/bag_result_widget.dart';

import '../../components/dropdown.dart';

import '../../components/helper.dart';
import 'services/tas_service.dart';
import 'widgets/capacity_result_widget.dart';
import 'widgets/explanation_widget.dart';
import 'widgets/bag_result_widget.dart';

class TasCalculatorWidget extends StatefulWidget {
  @override
  State<TasCalculatorWidget> createState() => _TasCalculatorWidgetState();
}

class _TasCalculatorWidgetState extends State<TasCalculatorWidget> {
  final tasService = TasService();
  String humedadInicial = '24';
  String humedadInicialBolsa = '14%';
  String temperaturaActual = '40';
  OverlayEntry? _overlayEntry;

  late Grano granoSelectedEstructura;
  late Grano granoSelectedBolsa;

  @override
  void initState() {
    super.initState();
    granoSelectedEstructura = tasService.granosTas[0];
    granoSelectedBolsa = tasService.granosBolsa[0];
  }

  void calcularEstructura() {
    final hum = double.parse(humedadInicial);
    final temp = int.parse(temperaturaActual);

    try {
      final kilosEvaporados = tasService.calcularResultadoEstructura(
        grano: granoSelectedEstructura,
        humedadInicial: hum,
        temperaturaActual: temp,
      );
      showCustomMenu(
        'Resultados',
        SafeTimeResultWidget(
          name: granoSelectedEstructura.nombre,
          initialHumidity: humedadInicial.toString(),
          temperature: temp.toString(),
          result: kilosEvaporados,
        ),
      );
    } catch (e) {
      Helper.showErrorSnackBar(context, e.toString());
    }
  }

  void calcularResultadoBolsa() {
    final capacidadReal = tasService.calcularResultadoBolsa(
      grano: granoSelectedBolsa,
      humedadInicial: humedadInicialBolsa,
    );
    showCustomMenu(
      'Resultados',
      BagResultWidget(
        name: granoSelectedBolsa.nombre,
        initialHumidity: humedadInicial,
        result: capacidadReal,
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
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Consumer<GranoProvider>(
      builder: (context, granoProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            title: Text(
              "CALCULADORA DE TIEMPO DE ALMACENAMIENTO SEGURO",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xff3b7d24),
              ),
              maxLines: 2,
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
          body: Container(
            height: MediaQuery.of(context).size.height -
                kToolbarHeight -
                MediaQuery.of(context).padding.top,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: DefaultTabController(
              length: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: 280 * ffem,
                    height: 55 * ffem,
                    decoration: BoxDecoration(
                      color: Color(0xffefefef),
                      borderRadius: BorderRadius.circular(35),
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
                        borderRadius: BorderRadius.circular(35),
                      ),
                      tabs: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Tab(
                            child: Text(
                              "Estructuras",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Tab(
                            child: Text(
                              "Silos bolsa",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                      dividerColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            DropdownWidget<String>(
                              header: 'Grano',
                              value: granoSelectedEstructura.nombre,
                              items: tasService.granosTas.map((grano) {
                                return grano.nombre;
                              }).toList(),
                              itemBuilder: (String item) {
                                return item;
                              },
                              onChanged: (String? value) {
                                setState(() {
                                  granoSelectedEstructura = tasService.granosTas
                                      .firstWhere(
                                          (grano) => grano.nombre == value);
                                  humedadInicial =
                                      tasService.propiedadesPorGrano[
                                              granoSelectedEstructura.nombre]
                                          ['humedadesIniciales'][0];
                                  temperaturaActual =
                                      tasService.propiedadesPorGrano[
                                              granoSelectedEstructura.nombre]
                                          ['temp'][0];
                                });
                              },
                              width: MediaQuery.of(context).size.width,
                            ),
                            const SizedBox(height: 10),
                            DropdownWidget<String>(
                              header: 'Humedad inicial (%)',
                              value: humedadInicial,
                              items: tasService.propiedadesPorGrano[
                                      granoSelectedEstructura.nombre]
                                  ['humedadesIniciales'],
                              itemBuilder: (String item) {
                                return item;
                              },
                              onChanged: (String? value) {
                                setState(() {
                                  humedadInicial = value!;
                                });
                              },
                              width: MediaQuery.of(context).size.width,
                            ),
                            const SizedBox(height: 10),
                            DropdownWidget<String>(
                              header:
                                  'Temperatura de almacenamiento actual (°C)',
                              value: temperaturaActual,
                              items: tasService.propiedadesPorGrano[
                                  granoSelectedEstructura.nombre]['temp'],
                              itemBuilder: (String item) {
                                return item;
                              },
                              onChanged: (String? value) {
                                setState(() {
                                  temperaturaActual = value!;
                                });
                              },
                              width: MediaQuery.of(context).size.width,
                            ),
                            const SizedBox(height: 25),
                            GestureDetector(
                              onTap: () {
                                calcularEstructura();
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            DropdownWidget<String>(
                              header: 'Grano',
                              value: granoSelectedBolsa.nombre,
                              items: tasService.granosBolsa.map((grano) {
                                return grano.nombre;
                              }).toList(),
                              itemBuilder: (String item) {
                                return item;
                              },
                              onChanged: (String? value) {
                                setState(() {
                                  granoSelectedBolsa = tasService.granosTas
                                      .firstWhere(
                                          (grano) => grano.nombre == value);
                                  humedadInicialBolsa =
                                      tasService.humedadesPorGranoBolsa[
                                          granoSelectedBolsa.nombre][0];
                                });
                              },
                              width: MediaQuery.of(context).size.width,
                            ),
                            const SizedBox(height: 10),
                            DropdownWidget<String>(
                              header: 'Humedad inicial (%)',
                              value: humedadInicialBolsa,
                              items: tasService.humedadesPorGranoBolsa[
                                  granoSelectedBolsa.nombre],
                              itemBuilder: (String item) {
                                return item;
                              },
                              onChanged: (String? value) {
                                setState(() {
                                  humedadInicialBolsa = value!;
                                });
                              },
                              width: MediaQuery.of(context).size.width,
                            ),
                            const SizedBox(height: 25),
                            GestureDetector(
                              onTap: () {
                                calcularResultadoBolsa();
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
