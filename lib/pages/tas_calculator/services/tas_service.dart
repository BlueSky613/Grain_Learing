import '../models/tiempo_almacenamiento_en_estructura.dart';
import '../models/tiempo_almacenamiento_en_bolsa.dart';
import '../models/grano_model.dart';

const List<String> HUMEDADES_GENERALES = ['24', '22', '20', '18', '16', '14'];
const List<String> TEMPERATURAS_GENERALES = [
  '40',
  '35',
  '30',
  '25',
  '20',
  '15',
  '10',
  '5'
];
const List<String> HUMEDADES_COLZA = [
  '17',
  '15.6',
  '13.7',
  '12.3',
  '10.6',
  '8.9',
  '6.7'
];
const List<String> TEMPERATURAS_COLZA = ['25', '20', '15', '10', '5'];
const List<String> HUMEDADES_GR1 = ['11%', 'Entre 11 y 14%', 'Mayor a 14%'];
const List<String> HUMEDADES_GR2 = ['14%', 'Entre 14 y 16%', 'Mayor a 16%'];

class TasService {
  Map<String, dynamic> propiedadesPorGrano = {
    "Maíz": {
      "humedadesIniciales": HUMEDADES_GENERALES,
      "temp": TEMPERATURAS_GENERALES
    },
    "Soja": {
      "humedadesIniciales": HUMEDADES_GENERALES,
      "temp": TEMPERATURAS_GENERALES
    },
    "Avena": {
      "humedadesIniciales": HUMEDADES_GENERALES,
      "temp": TEMPERATURAS_GENERALES
    },
    "Trigo": {
      "humedadesIniciales": HUMEDADES_GENERALES,
      "temp": TEMPERATURAS_GENERALES
    },
    "Colza": {
      "humedadesIniciales": HUMEDADES_COLZA,
      "temp": TEMPERATURAS_COLZA
    },
    "Girasol": {
      "humedadesIniciales": HUMEDADES_COLZA,
      "temp": TEMPERATURAS_COLZA
    },
    "Centeno": {
      "humedadesIniciales": HUMEDADES_GENERALES,
      "temp": TEMPERATURAS_GENERALES
    },
    "Cebada": {
      "humedadesIniciales": HUMEDADES_GENERALES,
      "temp": TEMPERATURAS_GENERALES
    },
  };

  Map<String, dynamic> humedadesPorGranoBolsa = {
    "Girasol": HUMEDADES_GR1,
    "Maíz": HUMEDADES_GR2,
    "Soja": HUMEDADES_GR2,
    "Trigo": HUMEDADES_GR2,
  };

  List<Grano> granosTas = [
    Grano(1, "Maíz"),
    Grano(5, "Soja"),
    Grano(6, "Avena"),
    Grano(7, "Trigo"),
    Grano(8, "Colza"),
    Grano(9, "Girasol"),
    Grano(12, "Centeno"),
    Grano(14, "Cebada")
  ];

  List<Grano> granosBolsa = [
    Grano(1, "Maíz"),
    Grano(5, "Soja"),
    Grano(7, "Trigo"),
    Grano(9, "Girasol"),
  ];

  List<TiempoAlmacenamientoEnEstructura> tabla1 = [
    TiempoAlmacenamientoEnEstructura(25, 17, "4"),
    TiempoAlmacenamientoEnEstructura(25, 15.6, "4"),
    TiempoAlmacenamientoEnEstructura(25, 13.7, "4"),
    TiempoAlmacenamientoEnEstructura(25, 12.3, "8"),
    TiempoAlmacenamientoEnEstructura(25, 10.6, "11"),
    TiempoAlmacenamientoEnEstructura(25, 8.9, "23"),
    TiempoAlmacenamientoEnEstructura(25, 6.7, "29"),
    TiempoAlmacenamientoEnEstructura(20, 17, "4"),
    TiempoAlmacenamientoEnEstructura(20, 15.6, "6"),
    TiempoAlmacenamientoEnEstructura(20, 13.7, "6"),
    TiempoAlmacenamientoEnEstructura(20, 12.3, "6"),
    TiempoAlmacenamientoEnEstructura(20, 10.6, "18"),
    TiempoAlmacenamientoEnEstructura(20, 8.9, "48"),
    TiempoAlmacenamientoEnEstructura(20, 6.7, "180"),
    TiempoAlmacenamientoEnEstructura(15, 17, "6"),
    TiempoAlmacenamientoEnEstructura(15, 15.6, "6"),
    TiempoAlmacenamientoEnEstructura(15, 13.7, "11"),
    TiempoAlmacenamientoEnEstructura(15, 12.3, "18"),
    TiempoAlmacenamientoEnEstructura(15, 10.6, "42"),
    TiempoAlmacenamientoEnEstructura(15, 8.9, "116"),
    TiempoAlmacenamientoEnEstructura(15, 6.7, "+ de 300"),
    TiempoAlmacenamientoEnEstructura(10, 17, "11"),
    TiempoAlmacenamientoEnEstructura(10, 15.6, "11"),
    TiempoAlmacenamientoEnEstructura(10, 13.7, "20"),
    TiempoAlmacenamientoEnEstructura(10, 12.3, "25"),
    TiempoAlmacenamientoEnEstructura(10, 10.6, "42"),
    TiempoAlmacenamientoEnEstructura(10, 8.9, "279"),
    TiempoAlmacenamientoEnEstructura(10, 6.7, "+ de 300"),
    TiempoAlmacenamientoEnEstructura(5, 17, "20"),
    TiempoAlmacenamientoEnEstructura(5, 15.6, "28"),
    TiempoAlmacenamientoEnEstructura(5, 13.7, "46"),
    TiempoAlmacenamientoEnEstructura(5, 12.3, "109"),
    TiempoAlmacenamientoEnEstructura(5, 10.6, "238"),
    TiempoAlmacenamientoEnEstructura(5, 8.9, "Más de 300"),
    TiempoAlmacenamientoEnEstructura(5, 6.7, "Más de 300")
  ];

  List<TiempoAlmacenamientoEnEstructura> tabla2 = [
    TiempoAlmacenamientoEnEstructura(40, 24, "1"),
    TiempoAlmacenamientoEnEstructura(40, 22, "1"),
    TiempoAlmacenamientoEnEstructura(40, 20, "2"),
    TiempoAlmacenamientoEnEstructura(40, 18, "2"),
    TiempoAlmacenamientoEnEstructura(40, 16, "3"),
    TiempoAlmacenamientoEnEstructura(40, 14, "4"),
    TiempoAlmacenamientoEnEstructura(35, 24, "1"),
    TiempoAlmacenamientoEnEstructura(35, 22, "4"),
    TiempoAlmacenamientoEnEstructura(35, 20, "10"),
    TiempoAlmacenamientoEnEstructura(35, 18, "13"),
    TiempoAlmacenamientoEnEstructura(35, 16, "17"),
    TiempoAlmacenamientoEnEstructura(35, 14, "25"),
    TiempoAlmacenamientoEnEstructura(30, 24, "1"),
    TiempoAlmacenamientoEnEstructura(30, 22, "5"),
    TiempoAlmacenamientoEnEstructura(30, 20, "11"),
    TiempoAlmacenamientoEnEstructura(30, 18, "15"),
    TiempoAlmacenamientoEnEstructura(30, 16, "21"),
    TiempoAlmacenamientoEnEstructura(30, 14, "30"),
    TiempoAlmacenamientoEnEstructura(25, 24, "1"),
    TiempoAlmacenamientoEnEstructura(25, 22, "7"),
    TiempoAlmacenamientoEnEstructura(25, 20, "12"),
    TiempoAlmacenamientoEnEstructura(25, 18, "18"),
    TiempoAlmacenamientoEnEstructura(25, 16, "36"),
    TiempoAlmacenamientoEnEstructura(25, 14, "40"),
    TiempoAlmacenamientoEnEstructura(20, 24, "3"),
    TiempoAlmacenamientoEnEstructura(20, 22, "8"),
    TiempoAlmacenamientoEnEstructura(20, 20, "13"),
    TiempoAlmacenamientoEnEstructura(20, 18, "30"),
    TiempoAlmacenamientoEnEstructura(20, 16, "54"),
    TiempoAlmacenamientoEnEstructura(20, 14, "80"),
    TiempoAlmacenamientoEnEstructura(15, 24, "8"),
    TiempoAlmacenamientoEnEstructura(15, 22, "10"),
    TiempoAlmacenamientoEnEstructura(15, 20, "20"),
    TiempoAlmacenamientoEnEstructura(15, 18, "41"),
    TiempoAlmacenamientoEnEstructura(15, 16, "56"),
    TiempoAlmacenamientoEnEstructura(15, 14, "105"),
    TiempoAlmacenamientoEnEstructura(10, 24, "10"),
    TiempoAlmacenamientoEnEstructura(10, 22, "15"),
    TiempoAlmacenamientoEnEstructura(10, 20, "29"),
    TiempoAlmacenamientoEnEstructura(10, 18, "50"),
    TiempoAlmacenamientoEnEstructura(10, 16, "100"),
    TiempoAlmacenamientoEnEstructura(10, 14, "200"),
    TiempoAlmacenamientoEnEstructura(5, 24, "13"),
    TiempoAlmacenamientoEnEstructura(5, 22, "20"),
    TiempoAlmacenamientoEnEstructura(5, 20, "36"),
    TiempoAlmacenamientoEnEstructura(5, 18, "73"),
    TiempoAlmacenamientoEnEstructura(5, 16, "180"),
    TiempoAlmacenamientoEnEstructura(5, 14, "250")
  ];

  List<TiempoAlmacenamientoEnEstructura> tabla3 = [
    TiempoAlmacenamientoEnEstructura(40, 24, "1"),
    TiempoAlmacenamientoEnEstructura(40, 22, "3"),
    TiempoAlmacenamientoEnEstructura(40, 20, "4"),
    TiempoAlmacenamientoEnEstructura(40, 18, "9"),
    TiempoAlmacenamientoEnEstructura(40, 16, "17"),
    TiempoAlmacenamientoEnEstructura(40, 14, "27"),
    TiempoAlmacenamientoEnEstructura(35, 24, "2"),
    TiempoAlmacenamientoEnEstructura(35, 22, "3"),
    TiempoAlmacenamientoEnEstructura(35, 20, "5"),
    TiempoAlmacenamientoEnEstructura(35, 18, "11"),
    TiempoAlmacenamientoEnEstructura(35, 16, "17"),
    TiempoAlmacenamientoEnEstructura(35, 14, "31"),
    TiempoAlmacenamientoEnEstructura(30, 24, "2"),
    TiempoAlmacenamientoEnEstructura(30, 22, "4"),
    TiempoAlmacenamientoEnEstructura(30, 20, "7"),
    TiempoAlmacenamientoEnEstructura(30, 18, "15"),
    TiempoAlmacenamientoEnEstructura(30, 16, "23"),
    TiempoAlmacenamientoEnEstructura(30, 14, "48"),
    TiempoAlmacenamientoEnEstructura(25, 24, "4"),
    TiempoAlmacenamientoEnEstructura(25, 22, "7"),
    TiempoAlmacenamientoEnEstructura(25, 20, "12"),
    TiempoAlmacenamientoEnEstructura(25, 18, "28"),
    TiempoAlmacenamientoEnEstructura(25, 16, "45"),
    TiempoAlmacenamientoEnEstructura(25, 14, "90"),
    TiempoAlmacenamientoEnEstructura(20, 24, "8"),
    TiempoAlmacenamientoEnEstructura(20, 22, "12"),
    TiempoAlmacenamientoEnEstructura(20, 20, "22"),
    TiempoAlmacenamientoEnEstructura(20, 18, "49"),
    TiempoAlmacenamientoEnEstructura(20, 16, "80"),
    TiempoAlmacenamientoEnEstructura(20, 14, "170"),
    TiempoAlmacenamientoEnEstructura(15, 24, "16"),
    TiempoAlmacenamientoEnEstructura(15, 22, "22"),
    TiempoAlmacenamientoEnEstructura(15, 20, "39"),
    TiempoAlmacenamientoEnEstructura(15, 18, "85"),
    TiempoAlmacenamientoEnEstructura(15, 16, "160"),
    TiempoAlmacenamientoEnEstructura(15, 14, "320"),
    TiempoAlmacenamientoEnEstructura(10, 24, "26"),
    TiempoAlmacenamientoEnEstructura(10, 22, "35"),
    TiempoAlmacenamientoEnEstructura(10, 20, "60"),
    TiempoAlmacenamientoEnEstructura(10, 18, "140"),
    TiempoAlmacenamientoEnEstructura(10, 16, "265"),
    TiempoAlmacenamientoEnEstructura(10, 14, "500"),
    TiempoAlmacenamientoEnEstructura(5, 24, "50"),
    TiempoAlmacenamientoEnEstructura(5, 22, "90"),
    TiempoAlmacenamientoEnEstructura(5, 20, "150"),
    TiempoAlmacenamientoEnEstructura(5, 18, "350"),
    TiempoAlmacenamientoEnEstructura(5, 16, "650"),
    TiempoAlmacenamientoEnEstructura(5, 14, "1000")
  ];

  List<TiempoAlmacenamientoEnEstructura> tabla4 = [
    TiempoAlmacenamientoEnEstructura(40, 24, "1"),
    TiempoAlmacenamientoEnEstructura(40, 22, "1"),
    TiempoAlmacenamientoEnEstructura(40, 20, "2"),
    TiempoAlmacenamientoEnEstructura(40, 18, "2"),
    TiempoAlmacenamientoEnEstructura(40, 16, "3"),
    TiempoAlmacenamientoEnEstructura(40, 14, "4"),
    TiempoAlmacenamientoEnEstructura(35, 24, "1"),
    TiempoAlmacenamientoEnEstructura(35, 22, "4"),
    TiempoAlmacenamientoEnEstructura(35, 20, "10"),
    TiempoAlmacenamientoEnEstructura(35, 18, "13"),
    TiempoAlmacenamientoEnEstructura(35, 16, "17"),
    TiempoAlmacenamientoEnEstructura(35, 14, "25"),
    TiempoAlmacenamientoEnEstructura(30, 24, "1"),
    TiempoAlmacenamientoEnEstructura(30, 22, "5"),
    TiempoAlmacenamientoEnEstructura(30, 20, "11"),
    TiempoAlmacenamientoEnEstructura(30, 18, "15"),
    TiempoAlmacenamientoEnEstructura(30, 16, "21"),
    TiempoAlmacenamientoEnEstructura(30, 14, "30"),
    TiempoAlmacenamientoEnEstructura(25, 24, "1"),
    TiempoAlmacenamientoEnEstructura(25, 22, "7"),
    TiempoAlmacenamientoEnEstructura(25, 20, "12"),
    TiempoAlmacenamientoEnEstructura(25, 18, "18"),
    TiempoAlmacenamientoEnEstructura(25, 16, "36"),
    TiempoAlmacenamientoEnEstructura(25, 14, "40"),
    TiempoAlmacenamientoEnEstructura(20, 24, "3"),
    TiempoAlmacenamientoEnEstructura(20, 22, "8"),
    TiempoAlmacenamientoEnEstructura(20, 20, "13"),
    TiempoAlmacenamientoEnEstructura(20, 18, "30"),
    TiempoAlmacenamientoEnEstructura(20, 16, "54"),
    TiempoAlmacenamientoEnEstructura(20, 14, "80"),
    TiempoAlmacenamientoEnEstructura(15, 24, "8"),
    TiempoAlmacenamientoEnEstructura(15, 22, "10"),
    TiempoAlmacenamientoEnEstructura(15, 20, "20"),
    TiempoAlmacenamientoEnEstructura(15, 18, "41"),
    TiempoAlmacenamientoEnEstructura(15, 16, "56"),
    TiempoAlmacenamientoEnEstructura(15, 14, "105"),
    TiempoAlmacenamientoEnEstructura(10, 24, "10"),
    TiempoAlmacenamientoEnEstructura(10, 22, "15"),
    TiempoAlmacenamientoEnEstructura(10, 20, "29"),
    TiempoAlmacenamientoEnEstructura(10, 18, "50"),
    TiempoAlmacenamientoEnEstructura(10, 16, "100"),
    TiempoAlmacenamientoEnEstructura(10, 14, "200"),
    TiempoAlmacenamientoEnEstructura(5, 24, "13"),
    TiempoAlmacenamientoEnEstructura(5, 22, "20"),
    TiempoAlmacenamientoEnEstructura(5, 20, "36"),
    TiempoAlmacenamientoEnEstructura(5, 18, "73"),
    TiempoAlmacenamientoEnEstructura(5, 16, "180"),
    TiempoAlmacenamientoEnEstructura(5, 14, "250")
  ];

  List<TiempoAlmacenamientoEnBolsa> tabla5 = [
    TiempoAlmacenamientoEnBolsa("11%", "6 meses", "12 meses", "18 meses"),
    TiempoAlmacenamientoEnBolsa(
        "Entre 11 y 14%", "2 meses", "6 meses", "12 meses"),
    TiempoAlmacenamientoEnBolsa("Mayor a 14%", "1 mes", "2 meses", "3 meses")
  ];

  List<TiempoAlmacenamientoEnBolsa> tabla6 = [
    TiempoAlmacenamientoEnBolsa("14%", "6 meses", "12 meses", "18 meses"),
    TiempoAlmacenamientoEnBolsa(
        "Entre 14 y 16%", "2 meses", "6 meses", "12 meses"),
    TiempoAlmacenamientoEnBolsa("Mayor a 16%", "1 mes", "2 meses", "3 meses")
  ];

  String calcularResultadoEstructura({
    required Grano grano,
    required double humedadInicial,
    required int temperaturaActual,
  }) {
    List<TiempoAlmacenamientoEnEstructura> tabla;

    switch (grano.id) {
      case 8:
      case 9:
        tabla = tabla1;
        break;
      case 6:
      case 7:
      case 12:
      case 14:
        tabla = tabla2;
        break;
      case 1:
        tabla = tabla3;
        break;
      case 5:
        tabla = tabla4;
        break;
      default:
        return "Grano no válido.";
    }
    final resultado = tabla.firstWhere(
      (t) =>
          t.humedadInicial == humedadInicial &&
          t.temperaturaActual == temperaturaActual,
      orElse: () => TiempoAlmacenamientoEnEstructura(0, 0.0, "N/A"),
    );

    String result = resultado.cantidadDias;

    return '$result ${result == "1" ? 'día' : 'días'}';
  }

  TiempoAlmacenamientoEnBolsa calcularResultadoBolsa({
    required Grano grano,
    required String humedadInicial,
  }) {
    List<TiempoAlmacenamientoEnBolsa> tabla;

    switch (grano.id) {
      case 9:
        tabla = tabla5;
        break;
      case 1:
      case 5:
      case 7:
        tabla = tabla6;
        break;
      default:
        return TiempoAlmacenamientoEnBolsa('0', "N/A", "N/A", "N/A");
    }
    final resultado = tabla.firstWhere(
      (t) => t.humedadInicial == humedadInicial,
      orElse: () => TiempoAlmacenamientoEnBolsa('0', "N/A", "N/A", "N/A"),
    );

    return resultado;
  }
}
