import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Product {
  final String id;
  final String imageUrl;
  final String name;
  final double price;
  final double review;
  final double star;
  final DocumentReference category;
  int value;

  Product(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.review,
      required this.star,
      required this.value,
      required this.category});
}
