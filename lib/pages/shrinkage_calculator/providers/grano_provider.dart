import 'package:flutter/material.dart';

import '../models/grano_model.dart';

class GranoProvider extends ChangeNotifier {
  List<Grano> listaGranos = [
    Grano(
      id: 1,
      humedadDeComercializacion: 14.5,
      humedadSegura: 13.5,
      nombre: "Maíz",
      porcentajeMermaPorManipuleo: 0.25,
      porcentajeMermaPorZarandeo: 1.3,
      zarandeoMalezaNombre: "chamico (cada 100 gr.)",
      toleranciaSemillasMalezaPermitidas: 2,
      porcentajeMermaVolatil: 0.3,
    ),
    Grano(
      id: 2,
      humedadDeComercializacion: 15,
      humedadSegura: 13.5,
      nombre: "Sorgo",
      porcentajeMermaPorManipuleo: 0.25,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.5,
    ),
    Grano(
      id: 3,
      humedadDeComercializacion: 10,
      humedadSegura: 9.5,
      nombre: "Lino",
      porcentajeMermaPorManipuleo: 0.1,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.5,
    ),
    Grano(
      id: 4,
      humedadDeComercializacion: 10,
      humedadSegura: 9.5,
      nombre: "Cártamo",
      porcentajeMermaPorManipuleo: 0.2,
      porcentajeMermaPorZarandeo: 1.3,
      zarandeoMalezaNombre: "chamico (cada 100 gr.)",
      toleranciaSemillasMalezaPermitidas: 2,
      porcentajeMermaVolatil: 0.5,
    ),
    Grano(
      id: 5,
      humedadDeComercializacion: 13.5,
      humedadSegura: 13,
      nombre: "Soja",
      porcentajeMermaPorManipuleo: 0.25,
      porcentajeMermaPorZarandeo: -1,
      zarandeoMalezaNombre: "chamico (cada 1 kg.)",
      toleranciaSemillasMalezaPermitidas: 5,
      porcentajeMermaVolatil: 0.5,
    ),
    Grano(
      id: 6,
      humedadDeComercializacion: 14,
      humedadSegura: 13.5,
      nombre: "Avena",
      porcentajeMermaPorManipuleo: 0.2,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.3,
    ),
    Grano(
      id: 7,
      humedadDeComercializacion: 14,
      humedadSegura: 13.5,
      nombre: "Trigo Pan",
      porcentajeMermaPorManipuleo: 0.1,
      porcentajeMermaPorZarandeo: 2,
      zarandeoMalezaNombre: "trebol de olor (cada 100 gr.)",
      toleranciaSemillasMalezaPermitidas: 8,
      porcentajeMermaVolatil: 0.3,
    ),
    Grano(
      id: 8,
      humedadDeComercializacion: 8,
      humedadSegura: 7.5,
      nombre: "Colza",
      porcentajeMermaPorManipuleo: 0.1,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.5,
    ),
    Grano(
      id: 9,
      humedadDeComercializacion: 11,
      humedadSegura: 10.5,
      nombre: "Girasol",
      porcentajeMermaPorManipuleo: 0.2,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.5,
    ),
    Grano(
      id: 10,
      humedadDeComercializacion: 8.5,
      humedadSegura: 8,
      nombre: "Canola",
      porcentajeMermaPorManipuleo: 0.1,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.5,
    ),
    Grano(
      id: 11,
      humedadDeComercializacion: 14,
      humedadSegura: 13.5,
      nombre: "Trigo Fideo",
      porcentajeMermaPorManipuleo: 0.1,
      porcentajeMermaPorZarandeo: 2,
      zarandeoMalezaNombre: "trebol de olor (cada 100 gr.)",
      toleranciaSemillasMalezaPermitidas: 8,
      porcentajeMermaVolatil: 0.3,
    ),
    Grano(
      id: 12,
      humedadDeComercializacion: 14,
      humedadSegura: 13.5,
      nombre: "Centeno",
      porcentajeMermaPorManipuleo: 0.2,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.3,
    ),
    Grano(
      id: 13,
      humedadDeComercializacion: 15,
      humedadSegura: 14.5,
      nombre: "Mijo",
      porcentajeMermaPorManipuleo: 0.25,
      porcentajeMermaPorZarandeo: 1.3,
      zarandeoMalezaNombre: "chamico (cada 100 gr.)",
      toleranciaSemillasMalezaPermitidas: 2,
      porcentajeMermaVolatil: 0.3,
    ),
    Grano(
      id: 14,
      humedadDeComercializacion: 14,
      humedadSegura: 13.5,
      nombre: "Cebada Forrajera",
      porcentajeMermaPorManipuleo: 0.2,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.3,
    ),
    Grano(
      id: 15,
      humedadDeComercializacion: 9,
      humedadSegura: 8.5,
      nombre: "Maní",
      porcentajeMermaPorManipuleo: 0.25,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.5,
    ),
    Grano(
      id: 16,
      humedadDeComercializacion: 12.5,
      humedadSegura: 12,
      nombre: "Cebada Cervecera",
      porcentajeMermaPorManipuleo: 0.2,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.3,
    ),
    Grano(
      id: 17,
      humedadDeComercializacion: 14,
      humedadSegura: 13.5,
      nombre: "Arroz",
      porcentajeMermaPorManipuleo: 0.125,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.3,
    ),
    Grano(
      id: 18,
      humedadDeComercializacion: 0,
      humedadSegura: 0,
      nombre: "Alpiste",
      porcentajeMermaPorManipuleo: 0,
      porcentajeMermaPorZarandeo: 1.3,
      zarandeoMalezaNombre: "chamico (cada 100 gr.)",
      toleranciaSemillasMalezaPermitidas: 2,
      porcentajeMermaVolatil: 0.3,
    ),
    Grano(
      id: 19,
      humedadDeComercializacion: 15,
      humedadSegura: 15,
      nombre: "Poroto",
      porcentajeMermaPorManipuleo: 0,
      porcentajeMermaPorZarandeo: 0,
      zarandeoMalezaNombre: "",
      toleranciaSemillasMalezaPermitidas: 0,
      porcentajeMermaVolatil: 0.5,
    ),
  ];

  late Grano granoActual;
  double? kilogramosIniciales;
  double? humedadInicial;
  int cantidadSemillasMaleza = 0;
  double? porcentajeMermaPorSecado;
  double? porcentajeMermaPorZarandeo;
  bool calcularMermaVolatil = false;
  String resultadoDetallado = "";
  bool showResultadoResumido = false;
  double kilosDespuesMermaSecado = 0;
  double kilosDespuesMermaZarandeo = 0;
  double kilosDespuesMermaVolatil = 0;
  String mermaPorZarandeoResult = '';
  String mermaPorSecadoResult = '';
  String mermaVolatilResult = '';
  GranoProvider() {
    listaGranos.sort((a, b) => a.nombre.compareTo(b.nombre));
    granoActual = listaGranos.first;
  }
  void setGranoActual(String? value) {
    granoActual = listaGranos.firstWhere((grano) => grano.nombre == value);
    notifyListeners();
  }

  void setCalcularMermaVolatil(bool value) {
    calcularMermaVolatil = value;
    notifyListeners();
  }

  double calcularPorcentajeMermaPorSecado(
      double? humedadInicial, Grano granoActual) {
    if (humedadInicial == null) return -1;
    if (humedadInicial <= granoActual.humedadDeComercializacion ||
        granoActual.humedadDeComercializacion == 0) {
      return -1;
    }

    double numberToRound =
        ((humedadInicial - granoActual.humedadSegura) * 100) /
            (100 - granoActual.humedadSegura);

    String rounded = numberToRound.toStringAsFixed(2);
    return double.parse(rounded);
  }

  double calcularMermaPorZarandeo(
    int cantidadSemillas,
    double kilogramosIniciales,
    int toleranciaSemillasMalezaPermitidas,
    double porcentajeMermaPorZarandeo,
  ) {
    if (cantidadSemillas == 0) {
      return 0;
    }

    if (cantidadSemillas > toleranciaSemillasMalezaPermitidas) {
      return double.parse(
        ((kilogramosIniciales * porcentajeMermaPorZarandeo) / 100)
            .toStringAsFixed(0),
      );
    } else {
      return kilogramosIniciales;
    }
  }

  bool calcularMermas() {
    print(kilogramosIniciales);
    print(humedadInicial);
    if (kilogramosIniciales == null) {
      return false;
    }
    resultadoDetallado = '';
    porcentajeMermaPorSecado =
        calcularPorcentajeMermaPorSecado(humedadInicial, granoActual);

    if (porcentajeMermaPorSecado == -1) {
      kilosDespuesMermaSecado = kilogramosIniciales!;
      String msg = '';
      if (granoActual.humedadDeComercializacion == 0) {
        msg = "No aplica rebaja por humedad para este grano.";
      } else {
        msg = "Valor de humedad dentro de la tolerancia admitida.";
      }
      mermaPorSecadoResult = msg;
      resultadoDetallado = "$msg \n";
    } else {
      resultadoDetallado += "Humedad inicial: $humedadInicial%. \n";
      resultadoDetallado +=
          "Humedad segura de almacenamiento: ${granoActual.humedadSegura}%. \n";
      resultadoDetallado +=
          "Humedad de comercialización: ${granoActual.humedadDeComercializacion}%. \n";
      resultadoDetallado +=
          "Porcentaje de merma por secado: ${porcentajeMermaPorSecado}%. \n";
      resultadoDetallado +=
          "Porcentaje de merma por manipuleo: ${granoActual.porcentajeMermaPorManipuleo}%. \n";
      double porcentajeMermaSecadoManipuleo = double.parse(
        (porcentajeMermaPorSecado! + granoActual.porcentajeMermaPorManipuleo)
            .toStringAsFixed(2),
      );
      double kilogramosMermaTotal =
          (kilogramosIniciales! * porcentajeMermaSecadoManipuleo) / 100;
      kilosDespuesMermaSecado = kilogramosIniciales! - kilogramosMermaTotal;
      resultadoDetallado +=
          "Porcentaje de merma por secado más manipuleo: $porcentajeMermaSecadoManipuleo% \n";
      resultadoDetallado +=
          "Merma por secado más manipuleo: ${kilogramosMermaTotal.toStringAsFixed(0)} Kgs. \n";
      resultadoDetallado +=
          "Después de la merma de secado más manipuleo: ${kilosDespuesMermaSecado.toStringAsFixed(0)} Kgs. \n";
      mermaPorSecadoResult =
          "${kilogramosMermaTotal.toStringAsFixed(0)} Kgs\n ($porcentajeMermaPorSecado%)";
    }

    kilosDespuesMermaZarandeo = kilosDespuesMermaSecado;
    if (granoActual.porcentajeMermaPorZarandeo != 0) {
      if (cantidadSemillasMaleza >
          granoActual.toleranciaSemillasMalezaPermitidas) {
        double porAux = 0;
        if (granoActual.porcentajeMermaPorZarandeo == -1) {
          porAux = porcentajeMermaPorZarandeo ?? 0;
        } else {
          porAux = granoActual.porcentajeMermaPorZarandeo;
        }
        resultadoDetallado += "Porcentaje de merma por zarandeo: $porAux%. \n";
        double kilogramosMermaPorZarandeo = calcularMermaPorZarandeo(
          cantidadSemillasMaleza,
          kilosDespuesMermaSecado,
          granoActual.toleranciaSemillasMalezaPermitidas,
          porAux,
        );
        kilosDespuesMermaZarandeo =
            kilosDespuesMermaSecado - kilogramosMermaPorZarandeo;
        resultadoDetallado +=
            "Merma por zarandeo: ${kilogramosMermaPorZarandeo.toStringAsFixed(0)} Kgs.\n";
        resultadoDetallado +=
            "Después de la merma por zarandeo: ${kilosDespuesMermaZarandeo.toStringAsFixed(0)} Kgs.\n";
        mermaPorZarandeoResult =
            "${kilogramosMermaPorZarandeo.toStringAsFixed(0)}  Kgs\n ($porAux%)";
      } else {
        String msg =
            "Cantidad de semillas de ${granoActual.zarandeoMalezaNombre} dentro de la tolerancia admitida.";
        resultadoDetallado += "$msg \n";
        mermaPorZarandeoResult = msg;
      }
    } else {
      String msg = "No aplica merma por zarandeo para este grano.";
      resultadoDetallado += "$msg \n";
      mermaPorZarandeoResult = msg;
    }

    kilosDespuesMermaVolatil = kilosDespuesMermaZarandeo;
    if (calcularMermaVolatil) {
      resultadoDetallado +=
          "Porcentaje de merma volátil: ${granoActual.porcentajeMermaVolatil}%.\n";
      double kilogramosMermaVolatil =
          (kilosDespuesMermaZarandeo * granoActual.porcentajeMermaVolatil) /
              100;
      mermaVolatilResult =
          '${kilogramosMermaVolatil.toStringAsFixed(0)} Kgs\n (${granoActual.porcentajeMermaVolatil}%)';
      kilosDespuesMermaVolatil =
          kilosDespuesMermaZarandeo - kilogramosMermaVolatil;
      resultadoDetallado +=
          "Merma volátil: ${kilogramosMermaVolatil.toStringAsFixed(0)} Kgs.\n";
      resultadoDetallado +=
          "Después de la merma volátil: ${kilosDespuesMermaVolatil.toStringAsFixed(0)} Kgs.\n";
    } else {
      resultadoDetallado += "No se aplica merma volátil.\n";
      mermaVolatilResult = 'No se aplica';
    }
    showResultadoResumido = true;

    notifyListeners();
    return true;
  }
}
