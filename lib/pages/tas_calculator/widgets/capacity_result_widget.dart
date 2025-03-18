import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SafeTimeResultWidget extends StatelessWidget {
  const SafeTimeResultWidget({
    super.key,
    required this.name,
    required this.initialHumidity,
    required this.temperature,
    required this.result,
  });

  final String name;
  final String initialHumidity;
  final String temperature;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        inputParameters('Grano: ', '${name.toUpperCase()}'),
        inputParameters('Humedad inicial: ', '$initialHumidity%'),
        inputParameters('Temperatura: ', '$initialHumidity°C'),
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
              Text(
                'Temperatura de almacenamiento seguro',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff212529),
                ),
              ),
              Text(
                '$result',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                '* Los resultados generados por la Calculadora de TAS son estimaciones basadas en parámetros estándar de humedad. Factores adicionales como fluctuaciones ambientales y condiciones específicas del grano pueden influir en el TAS. Esta herramienta debe utilizarse solo como referencia orientativa. Para un almacenamiento seguro, se recomienda consultar con un profesional en manejo poscosecha.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
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
