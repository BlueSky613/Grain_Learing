import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:terra_galery/pages/drying_calculator/widgets/capacity_result_widget.dart';
import 'package:terra_galery/pages/drying_calculator/widgets/explanation_widget.dart';
import 'package:terra_galery/pages/drying_calculator/widgets/result_widget.dart';
import 'package:terra_galery/pages/shrinkage_calculator/providers/grano_provider.dart';

import '../../components/dropdown.dart';
import '../../components/helper.dart';
import '../../components/i_field_big.dart';
import 'services/secado_service.dart';

class DryingCalculatorWidget extends StatefulWidget {
  @override
  State<DryingCalculatorWidget> createState() => _DryingCalculatorWidgetState();
}

class _DryingCalculatorWidgetState extends State<DryingCalculatorWidget> {
  OverlayEntry? _overlayEntry;
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _kilosController = TextEditingController();
  final _humedadInicialController = TextEditingController();
  final _humedadFinalController = TextEditingController();
  final _capacidadBasicaController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();
  final FocusNode _thirdFocusNode = FocusNode();

  String humedadInicialReal = '16%';
  String humedadFinalReal = '12%';
  String temperatura = '90 °C';

  final _secadoService = SecadoService();

  void showResultSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xffffffff),
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: Color.fromARGB(255, 2, 68, 30),
      ),
    );
  }

  void calcularPerdida() {
    if (_formKey.currentState!.validate()) {
      final kilosIniciales = double.parse(_kilosController.text);
      final humedadInicial = double.parse(_humedadInicialController.text);
      final humedadFinal = double.parse(_humedadFinalController.text);

      try {
        String result = _secadoService.calcularKilosEvaporados(
            kilosIniciales, humedadInicial, humedadFinal, context);
        showCustomMenu(
          'Resultados',
          LostResultWidget(
              initialWeight: kilosIniciales.toString(),
              initialHumidity: humedadInicial.toString(),
              finalHumidity: humedadFinal.toString(),
              result: result),
        );
      } catch (e) {
        Helper.showErrorSnackBar(context, e.toString());
      }
    }
  }

  void calcularCapacidad() {
    if (_formKey2.currentState!.validate()) {
      final capacidadBasica = double.parse(_capacidadBasicaController.text);
      final humedadInicial =
          double.parse(humedadInicialReal.replaceAll('%', ''));
      final humedadFinal = double.parse(humedadFinalReal.replaceAll('%', ''));
      final temperature = temperatura.replaceAll(' °C', '');

      final capacidadReal = _secadoService.calcularCapacidadReal(
          capacidadBasica,
          humedadInicial,
          humedadFinal,
          double.parse(temperature));
      showCustomMenu(
        'Resultados',
        CapacityResultWidget(
            capacity: capacidadBasica.toString(),
            initialHumidity: humedadInicial.toString(),
            finalHumidity: humedadFinal.toString(),
            temperature: temperature,
            result: capacidadReal),
      );
    }
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
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
                "CALCULADORA DE SECADO",
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          MediaQuery.of(context).padding.top,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
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
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12.0,
                                    ),
                                    child: Tab(
                                      child: Text(
                                        "Perdida de peso",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12.0,
                                    ),
                                    child: Tab(
                                      child: Text(
                                        "Capacidad real",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
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
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        iFieldBig(context, _kilosController,
                                            _focusNode, "Kilogramos",
                                            keybType: TextInputType.number,
                                            nextfocusNode: _secondFocusNode),
                                        const SizedBox(height: 10),
                                        iFieldBig(
                                            context,
                                            _humedadInicialController,
                                            _secondFocusNode,
                                            "Humedad inicial (%)",
                                            keybType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            nextfocusNode: _thirdFocusNode),
                                        const SizedBox(height: 10),
                                        iFieldBig(
                                          context,
                                          _humedadFinalController,
                                          _thirdFocusNode,
                                          "Humedad final (%)",
                                          keybType:
                                              TextInputType.numberWithOptions(
                                            decimal: true,
                                          ),
                                        ),
                                        const SizedBox(height: 25),
                                        GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            calcularPerdida();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: Color(0xff3b7d24),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
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
                                          height: 55,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Form(
                                    key: _formKey2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        iFieldBig(
                                          context,
                                          _capacidadBasicaController,
                                          _focusNode,
                                          "Capacidad básica de secado (Tn/Hs)",
                                          keybType: TextInputType.number,
                                        ),
                                        const SizedBox(height: 10),
                                        DropdownWidget<String>(
                                          header: 'Humedad inicial (%)',
                                          value: humedadInicialReal,
                                          items: [
                                            '16%',
                                            '17%',
                                            '18%',
                                            '19%',
                                            '20%',
                                            '21%',
                                            '22%',
                                            '23%',
                                            '24%',
                                            '25%',
                                            '26%',
                                          ],
                                          itemBuilder: (String item) {
                                            return item;
                                          },
                                          onChanged: (String? value) {
                                            setState(() {
                                              humedadInicialReal = value!;
                                            });
                                          },
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        const SizedBox(height: 10),
                                        DropdownWidget<String>(
                                          header: 'Humedad final (%)',
                                          value: humedadFinalReal,
                                          items: [
                                            '12%',
                                            '13%',
                                            '14%',
                                            '15%',
                                            '16%',
                                          ],
                                          itemBuilder: (String item) {
                                            return item;
                                          },
                                          onChanged: (String? value) {
                                            setState(() {
                                              humedadFinalReal = value!;
                                            });
                                          },
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        const SizedBox(height: 10),
                                        DropdownWidget<String>(
                                          header: "Temperatura de secado (°C)",
                                          value: temperatura,
                                          items: [
                                            '43 °C',
                                            '90 °C',
                                            '104 °C',
                                          ],
                                          itemBuilder: (String item) {
                                            return item;
                                          },
                                          onChanged: (String? value) {
                                            setState(() {
                                              temperatura = value!;
                                            });
                                          },
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        const SizedBox(height: 25),
                                        GestureDetector(
                                          onTap: () {
                                            calcularCapacidad();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: Color(0xff3b7d24),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
