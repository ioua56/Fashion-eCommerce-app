import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_ecommerce_app/model/product_model.dart';

import '../model/categories_model.dart';

class ProductsData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _productsCollectionName = 'BaseModel';
  final String _popularProductsCollectionNam = 'PopularProducts';

  Stream<List<Product>> get products {
    return _firestore.collection(_productsCollectionName).snapshots().map(
        (snapshot) => snapshot.docs
            .map((document) => Product(
                imageUrl: document['imageUrl'],
                name: document['name'],
                price: double.parse(document['price'].toString()),
                review: double.parse(document['review']!.toString()),
                star: double.parse(document['star']!.toString()),
                value: int.parse(document['value']!.toString()),
                category: document['category'],
                id: document.id,
                discount: 0))
            .toList());
  }

  Stream<List<Product>> get popularProducts async* {
    final snapshots = _firestore.collection("PopularProducts").snapshots();
    await for (var snapshot in snapshots) {
      final docs = snapshot.docs;
      List<Product> products = [];
      for (var doc in docs) {
        DocumentSnapshot productSnapshot = await doc.data()['Product'].get();
        products.add(Product(
            id: productSnapshot.id,
            imageUrl: productSnapshot['imageUrl'],
            name: productSnapshot['name'],
            price: double.parse(productSnapshot['price']!.toString()),
            review: double.parse(productSnapshot['review']!.toString()),
            star: double.parse(productSnapshot['star']!.toString()),
            category: productSnapshot['category'],
            value: int.parse(productSnapshot['value']!.toString()),
            discount: 10));
      }
      yield products;
    }
  }

  Stream<List<Product>> getProductsByCategory(String categoryId) {
    return _firestore
        .collection("BaseModel")
        .where("category", isEqualTo: _firestore.doc("categories/$categoryId"))
        .snapshots()
        .map((snapshot) {
      List<Product> products = [];
      snapshot.docs.forEach((productSnapshot) {
        products.add(Product(
            id: productSnapshot.id,
            imageUrl: productSnapshot['imageUrl'],
            name: productSnapshot['name'],
            price: double.parse(productSnapshot['price']!.toString()),
            review: double.parse(productSnapshot['review']!.toString()),
            star: double.parse(productSnapshot['star']!.toString()),
            category: productSnapshot['category'],
            value: int.parse(productSnapshot['value']!.toString()),
            discount: 0));
      });
      print("length of prodcuts");
      print(products.length);
      return products;
    });
  }

  Future<List<Product>> getProductsByCategory2(String categoryId) async {
    List<Product> products = [];
    QuerySnapshot querySnapshot = await _firestore
        .collection("BaseModel")
        .where("category", isEqualTo: _firestore.doc("categories/$categoryId"))
        .get();

    querySnapshot.docs.forEach((productSnapshot) {
      products.add(Product(
        id: productSnapshot.id,
        imageUrl: productSnapshot['imageUrl'],
        name: productSnapshot['name'],
        price: double.parse(productSnapshot['price']!.toString()),
        review: double.parse(productSnapshot['review']!.toString()),
        star: double.parse(productSnapshot['star']!.toString()),
        category: productSnapshot['category'],
        value: int.parse(productSnapshot['value']!.toString()),
        discount: 0,
      ));
    });

    return products;
  }

  Stream<List<Product>> getProductsByCategoryStream(String categoryId) {
    return Stream.fromFuture(getProductsByCategory2(categoryId));
  }
}
