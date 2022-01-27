import 'package:sembe/models/trabajos.dart';

class Cultivo {
  String idLote;
  String cultivo;
  String variedad;
  String camp;
  String status;
  List<Trabajos> trabajos;

  Cultivo(this.idLote, this.cultivo, this.variedad, this.camp, this.status,
      this.trabajos);

  factory Cultivo.fromJson(Map<String, dynamic> json) {
    return Cultivo(
      json["lote"],
      json["cultivo"],
      json["variedad"],
      json["camp"],
      json["status"],
      [],
    );
  }
}
