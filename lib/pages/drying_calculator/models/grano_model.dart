class Grano {
  int id;
  double humedadDeComercializacion;
  double humedadSegura;
  String nombre;
  double porcentajeMermaPorManipuleo;
  double porcentajeMermaPorZarandeo;
  String zarandeoMalezaNombre;
  int toleranciaSemillasMalezaPermitidas;
  double porcentajeMermaVolatil;

  Grano({
    required this.id,
    required this.humedadDeComercializacion,
    required this.humedadSegura,
    required this.nombre,
    required this.porcentajeMermaPorManipuleo,
    required this.porcentajeMermaPorZarandeo,
    required this.zarandeoMalezaNombre,
    required this.toleranciaSemillasMalezaPermitidas,
    required this.porcentajeMermaVolatil,
  });
}
