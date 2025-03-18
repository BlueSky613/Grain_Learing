import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LostResultWidget extends StatelessWidget {
  const LostResultWidget({
    super.key,
    required this.initialWeight,
    required this.initialHumidity,
    required this.finalHumidity,
    required this.result,
  });

  final String initialWeight;
  final String initialHumidity;
  final String finalHumidity;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        inputParameters('Kilogramos iniciales: ', '$initialWeight kgs.'),
        inputParameters('Humedad inicial: ', '$initialHumidity%.'),
        inputParameters('Humedad final: ', '$finalHumidity%.'),
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
                'Peso perdido durante el secado (evaporación):',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff212529),
                ),
              ),
              Text(
                '$result kgs.',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                '* Sin tener en cuenta la merma por manipuleo.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff212529),
                ),
              ),
              Text(
                '** El presente cálculo de pérdida de peso en secado es una estimación orientativa y no contempla todos los factores de campo o planta que pueden incidir en el resultado final, como variaciones en temperatura, flujo de aire, calidad inicial del grano, entre otros. Este resultado no debe ser considerado como dato definitivo para fines comerciales.',
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
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff212529),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
