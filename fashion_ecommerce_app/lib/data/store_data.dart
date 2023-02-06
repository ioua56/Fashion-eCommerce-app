import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final double price;
  final String image;
  final double rating;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
  });

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
      name: snap['name'],
      price: snap['price'],
      image: snap['imageURL'],
      rating: snap['star'],
    );
  }
}

class ProductService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Product>> get products {
    return _db.collection('BaseModel').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList());
  }
}
