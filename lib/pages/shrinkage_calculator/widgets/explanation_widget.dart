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
            'Esta herramienta permite *estimar la reduccion en peso de los granos* debido a factores de secado, manipulación y limpieza, así como por la presencia de semillas de maleza y pérdidas volátiles. Esta herramienta es útil para evaluar el peso neto luego de descontar mermas, ayudando en la planificación de almacenamiento y comercialización de granos. Al ingresar el peso inicial, la cantidad de semillas de maleza encontradas y la opción de aplicar merma volátil, la calculadora proporcionará una estimacion de las mermas en peso. *Los resultados son referenciales y no incluyen factores externos* que puedan influir en el peso final del producto.'),
      ),
    );
  }
}
