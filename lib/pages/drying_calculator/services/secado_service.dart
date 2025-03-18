import 'package:flutter/material.dart';
import 'package:terra_galery/components/helper.dart';

import '../models/coeficiente_humedad.dart';
import '../models/coeficiente_temperatura.dart';

class SecadoService {
  List<CoeficienteTemperatura> getCoeficientesTemperatura() {
    return [
      CoeficienteTemperatura(90, 1.0),
      CoeficienteTemperatura(43, 0.37),
      CoeficienteTemperatura(104, 1.2),
    ];
  }

  List<CoeficienteHumedad> getCoeficientesHumedad() {
    return [
      CoeficienteHumedad(16, 12, 0.87),
      CoeficienteHumedad(16, 13, 1.04),
      CoeficienteHumedad(16, 14, 1.3),
      CoeficienteHumedad(16, 15, -1),
      CoeficienteHumedad(16, 16, -1),
      CoeficienteHumedad(17, 12, 0.77),
      CoeficienteHumedad(17, 13, 0.93),
      CoeficienteHumedad(17, 14, 1.12),
      CoeficienteHumedad(17, 15, 1.4),
      CoeficienteHumedad(17, 16, 1.8),
      CoeficienteHumedad(18, 12, 0.7),
      CoeficienteHumedad(18, 13, 0.83),
      CoeficienteHumedad(18, 14, 1),
      CoeficienteHumedad(18, 15, 1.22),
      CoeficienteHumedad(18, 16, 1.45),
      CoeficienteHumedad(19, 12, 0.63),
      CoeficienteHumedad(19, 13, 0.75),
      CoeficienteHumedad(19, 14, 0.9),
      CoeficienteHumedad(19, 15, 1.1),
      CoeficienteHumedad(19, 16, 1.28),
      CoeficienteHumedad(20, 12, 0.57),
      CoeficienteHumedad(20, 13, 0.69),
      CoeficienteHumedad(20, 14, 0.83),
      CoeficienteHumedad(20, 15, 1),
      CoeficienteHumedad(20, 16, 1.21),
      CoeficienteHumedad(21, 12, 0.53),
      CoeficienteHumedad(21, 13, 0.63),
      CoeficienteHumedad(21, 14, 0.75),
      CoeficienteHumedad(21, 15, 0.9),
      CoeficienteHumedad(21, 16, 1.08),
      CoeficienteHumedad(22, 12, 0.49),
      CoeficienteHumedad(22, 13, 0.58),
      CoeficienteHumedad(22, 14, 0.69),
      CoeficienteHumedad(22, 15, 0.83),
      CoeficienteHumedad(22, 16, 0.98),
      CoeficienteHumedad(23, 12, 0.45),
      CoeficienteHumedad(23, 13, 0.53),
      CoeficienteHumedad(23, 14, 0.64),
      CoeficienteHumedad(23, 15, 0.75),
      CoeficienteHumedad(23, 16, 0.9),
      CoeficienteHumedad(24, 12, 0.42),
      CoeficienteHumedad(24, 13, 0.5),
      CoeficienteHumedad(24, 14, 0.59),
      CoeficienteHumedad(24, 15, 0.7),
      CoeficienteHumedad(24, 16, 0.83),
      CoeficienteHumedad(25, 12, 0.4),
      CoeficienteHumedad(25, 13, 0.47),
      CoeficienteHumedad(25, 14, 0.55),
      CoeficienteHumedad(25, 15, 0.54),
      CoeficienteHumedad(25, 16, 0.76),
      CoeficienteHumedad(26, 12, 0.37),
      CoeficienteHumedad(26, 13, 0.44),
      CoeficienteHumedad(26, 14, 0.52),
      CoeficienteHumedad(26, 15, 0.58),
      CoeficienteHumedad(26, 16, 0.7)
    ];
  }

  String calcularCapacidadReal(double capacidadBasica, double humedadInicial,
      double humedadFinal, double temperatura) {
    final coeficientesHumedad = getCoeficientesHumedad();
    final coeficientesTemperatura = getCoeficientesTemperatura();

    final coefHumedad = coeficientesHumedad
        .firstWhere(
          (c) =>
              c.humedadInicial == humedadInicial &&
              c.humedadFinal == humedadFinal,
          orElse: () => CoeficienteHumedad(0, 0, 1),
        )
        .coeficiente;

    final coefTemperatura = coeficientesTemperatura
        .firstWhere(
          (c) => c.temperatura == temperatura,
          orElse: () => CoeficienteTemperatura(0, 1),
        )
        .coeficiente;

    return (capacidadBasica * coefHumedad * coefTemperatura).toStringAsFixed(2);
  }

  String calcularKilosEvaporados(
      double kilosIniciales, double humedadInicial, double humedadFinal, BuildContext context) {
    if (humedadInicial <= humedadFinal) {
      Helper.showErrorSnackBar(context, "La humedad inicial debe ser mayor a la final.");
    }

    final kilosEvaporados = kilosIniciales *
        ((humedadInicial - humedadFinal) / (100 - humedadFinal));
    return kilosEvaporados.toStringAsFixed(2);
  }
}
