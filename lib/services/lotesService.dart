import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sembe/models/lote.dart';

class LotesService {
  FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

  Stream<List<Lote>> getLotesList() {
    return _fireStoreDataBase.collection('lotes').snapshots().map((snapShot) =>
        snapShot.docs
            .map((document) =>
                Lote.fromJson(document.reference.id, document.data()))
            .toList());
  }
}
