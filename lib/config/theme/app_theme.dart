import 'package:flutter/material.dart';

const Color _primaryColor = Color(0xff293643);
const Color _secondaryColor = Color(0xff5e1f20);

class AppTheme {
  static Color colorCard = Colors.white;
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: _primaryColor,
          onPrimary: Colors.white,
          secondary: _secondaryColor,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground:
              Colors.grey, // Color de las lineas de contorno de componentes
          surface:
              Colors.white, // Color de de fondo por defecto en los componentes
          onSurface: _primaryColor), //Color de letras e iconos por defecto
    );
  }
}
