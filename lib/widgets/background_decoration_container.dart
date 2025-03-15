import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BackgroundDecoration extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,  // Il punto centrale del gradiente
          radius: 1.0,  // Definisce l'intensità del gradiente
          colors: [
            Color(int.parse(dotenv.env['GRADIENT_START'] ?? '0xFF14D928')), // Blu chiaro
            Color(int.parse(dotenv.env['GRADIENT_MIDDLE'] ?? '0xFF66BB6A')), // Verde acqua
            Color(int.parse(dotenv.env['GRADIENT_END'] ?? '0xFF388E3C')),   // Blu intenso
          ],
          stops: [0.0, 0.7, 1.0],  // Controlla dove si distribuiscono i colori nel gradiente
        ),

      ),
    );
  }
}