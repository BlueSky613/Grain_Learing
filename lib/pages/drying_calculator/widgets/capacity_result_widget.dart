import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CapacityResultWidget extends StatelessWidget {
  const CapacityResultWidget({
    super.key,
    required this.capacity,
    required this.initialHumidity,
    required this.finalHumidity,
    required this.temperature,
    required this.result,
  });

  final String capacity;
  final String initialHumidity;
  final String finalHumidity;
  final String temperature;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        inputParameters('Capacidad básica de la secadora: ', '$capacity Tn/Hs'),
        inputParameters('Humedad inicial: ', '$initialHumidity%'),
        inputParameters('Humedad final: ', '$finalHumidity%'),
        inputParameters('Temperatura de secado: ', '$temperature°C'),
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
                'Capacidad real de secado:',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff212529),
                ),
                maxLines: 2,
              ),
              Text(
                '$result Tn/Hs',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                '* La capacidad real de secado calculada es un valor estimado basado en condiciones estándar. Factores como la variabilidad de la humedad, temperatura ambiente, tipo de grano y eficiencia del equipo pueden afectar el rendimiento real. Este cálculo es de carácter informativo y no representa un valor exacto en condiciones operativas específicas.',
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
