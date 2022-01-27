import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sembe/models/cultivos.dart';

class Lote {
  String id;
  String campo;
  String nombre;
  LatLng coord;
  List<LatLng> poligono = [];
  double hectareas;
  Cultivo cultivo;

  Lote(this.id, this.campo, this.nombre, this.coord, this.poligono,
      this.hectareas, this.cultivo);

  factory Lote.fromJson(String id, Map<String, dynamic> json) {
    GeoPoint _coord = json["coord"];
    List<LatLng> _poli = [];
    List<dynamic> _poligon = json["poligono"];
    for (var item in _poligon) {
      _poli.add(LatLng(item.latitude, item.longitude));
    }

    Cultivo _cultivo = Cultivo.fromJson(json['cultivo']);
    return Lote(
        id,
        json["campo"],
        json["nombre"],
        LatLng(_coord.latitude, _coord.longitude),
        _poli,
        json["hectareas"],
        _cultivo);
  }
}
