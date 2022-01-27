import 'package:flutter/material.dart';

class MyColors {
  static const Color Maiz = Colors.amber;
  static const Color Soja = Colors.green;
  static const Color Trigo = Colors.yellow;
  static const Color Pastura = Colors.greenAccent;

  Color getColorCultivo(String cultivo) {
    switch (cultivo) {
      case 'Maiz':
        return Maiz;
      case 'Soja':
        return Soja;
      case 'Trigo':
        return Trigo;
      case 'Pastura':
        return Pastura;
    }
    return Soja;
  }
}
