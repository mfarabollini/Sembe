class Trabajos {
  String idCultivo;
  String tipo;
  String realizador;
  DateTime fecha;
  String observ;

  Trabajos(this.idCultivo, this.tipo, this.realizador, this.fecha, this.observ);

  factory Trabajos.fromJson(Map<String, dynamic> json) {
    return Trabajos(
      '1',
      json["tipo"],
      json["realizador"],
      json["fecha"],
      json["observ"],
    );
  }
}
