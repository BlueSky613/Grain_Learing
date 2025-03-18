import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:terra_galery/pages/tas_calculator/models/tiempo_almacenamiento_en_bolsa.dart';

class BagResultWidget extends StatelessWidget {
  const BagResultWidget({
    super.key,
    required this.name,
    required this.initialHumidity,
    required this.result,
  });

  final String name;
  final String initialHumidity;
  final TiempoAlmacenamientoEnBolsa result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        inputParameters('Grano: ', '$name'),
        inputParameters('Humedad: ', '$initialHumidity%'),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Color.fromARGB(255, 120, 188, 103),
                width: 4.0,
              ),
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              table(result),
              const SizedBox(height: 10),
              Text(
                '* Los resultados generados por la Calculadora de TAS son estimaciones basadas en parámetros estándar de humedad. Factores adicionales como fluctuaciones ambientales y condiciones específicas del grano pueden influir en el TAS. Esta herramienta debe utilizarse solo como referencia orientativa. Para un almacenamiento seguro, se recomienda consultar con un profesional en manejo poscosecha.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff212529),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '** Cuanto más alto sea el riesgo; se recomienda un mayor control sobre los granos almacenados.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff212529),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget inputParameters(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff212529),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

Widget table(TiempoAlmacenamientoEnBolsa result) {
  return Column(
    children: [
      Table(
        border: TableBorder(
          top: BorderSide(color: Color(0xffdddddd)),
          bottom: BorderSide(color: Color(0xffdddddd)),
          right: BorderSide(color: Color(0xffdddddd)),
          left: BorderSide(color: Color(0xffdddddd)),
          horizontalInside: BorderSide(color: Color(0xffdddddd)),
        ),
        children: [
          _buildRow(['Tiempo', 'Riesgo'], Colors.white, true),
          _buildRow([result.bajo, 'Bajo'], Color(0xffD9ECD9), false),
          _buildRow([result.bajoMedio, 'Bajo-Medio'], Color(0xffFFFFAA), false),
          _buildRow([result.medioAlto, 'Medio-Alto'], Color(0xffFFAAAA), false),
        ],
      ),
    ],
  );
}

TableRow _buildRow(List<String> cells, Color rowColor, bool isTitle) {
  return TableRow(
    children: cells.asMap().entries.map((entry) {
      int index = entry.key;
      String cell = entry.value;
      return Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: isTitle
                  ? Color(0xffdddddd)
                  : index == 0
                      ? rowColor
                      : Colors.transparent,
              width: isTitle ? 1 : 2.5,
            ),
            left: BorderSide(
              color: index == 1 ? rowColor : Colors.transparent,
              width: 2.5,
            ),
          ),
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(
          textAlign: TextAlign.center,
          cell,
          style: TextStyle(
              fontSize: 16, fontWeight: isTitle ? FontWeight.bold : null),
        ),
      );
    }).toList(),
  );
}
