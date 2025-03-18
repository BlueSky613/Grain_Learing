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
          "La presente herramienta está diseñada para ayudar a estimar el tiempo de almacenamiento seguro, *tanto en silos de chapa sin sistema de aireación, como en silos bolsa*, en función de las condiciones de humedad y temperatura actuales. Esta estimación es útil para planificar el almacenamiento y reducir las pérdidas en la poscosecha. Recuerda que *los valores proporcionados son referenciales y pueden variar* según factores específicos del entorno de almacenamiento.",
        ),
      ),
    );
  }
}
