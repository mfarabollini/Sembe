import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sembe/models/cultivos.dart';

class CultivoService {
  FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

  // Stream<Cultivo> getLote(String ref) {
  //   return _fireStoreDataBase.collection('cultivos').doc(ref).snapshots().map((snapShot) =>
  //       Cultivo.fromJson(snapShot);
  //       // snapShot.docs
  //       //     .map((document) => Cultivo.fromJson(document.data()))
  //       //     .toList());
  // }

  Stream<List<Cultivo>> getCultivosLote(String idLote) {
    return _fireStoreDataBase
        .collection('cultivos')
        .where('lote', isEqualTo: idLote)
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => Cultivo.fromJson(document.data()))
            .toList());
  }
}
