import 'package:flutter/material.dart';

import '../../../components/helper.dart';

class ExplanationWidget extends StatelessWidget {
  const ExplanationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Color.fromARGB(255, 120, 188, 103),
            width: 4.0,
          ),
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      child: RichText(
        text: Helper.buildRichText(
          "Esta calculadora permite realizar dos tipos de cálculos clave en el manejo postcosecha de granos. Primero, *ofrece una estimación de la pérdida de peso de los granos debido al proceso de secado*, calculando la merma (evaporación) en función de la humedad inicial y final. Este cálculo es útil para planificar el almacenamiento y la comercialización de los granos de manera más precisa. Segundo, la herramienta permite *calcular la capacidad real de secado de la secadora*, proporcionando una referencia sobre el rendimiento en función de las condiciones de operación actuales. Al ingresar los datos correspondientes, *la calculadora ofrece resultados estimados* que no contemplan factores externos como manipulaciones adicionales y pérdidas durante el transporte.",
        ),
      ),
    );
  }
}
