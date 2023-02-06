import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/categories_model.dart';

class CategoriesData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'categories';

  Stream<List<CategoriesModel>> get categories {
    return _firestore
        .collection(_collectionName)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => CategoriesModel(
                  imageUrl: document['imageURL'],
                  title: document['title'],
                  id: document.id,
                ))
            .toList());
  }
}
