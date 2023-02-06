import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product_model.dart';
import '../model/categories_model.dart';

/*
List<CategoriesModel> categories = [
  CategoriesModel(
    imageUrl: "assets/images/kids.jpg",
    title: "Kids",
  ),
  CategoriesModel(
    imageUrl: "assets/images/mens.jpg",
    title: "Men",
  ),
  CategoriesModel(
    imageUrl: "assets/images/women.jpg",
    title: "Women",
  ),
  CategoriesModel(
    imageUrl: "assets/images/shoes.jpg",
    title: "Shoes",
  ),
  CategoriesModel(
    imageUrl: "assets/images/bags.jpg",
    title: "Bag",
  ),
  CategoriesModel(
    imageUrl: "assets/images/glass.jpg",
    title: "Glass",
  ),
  CategoriesModel(
    imageUrl: "assets/images/hat.jpg",
    title: "Hat",
  ),
];
*/
class ImageTest {
  final String imageUrl;

  ImageTest({
    required this.imageUrl,
  });
}

class ProductTest {
  final List<ImageTest> images;

  ProductTest({
    required this.images,
  });
}

ProductTest TestPorduct = ProductTest(images: [
  ImageTest(imageUrl: "assets/Image/dress1.jpg"),
  ImageTest(imageUrl: "assets/Image/dress1.jpg"),
  ImageTest(imageUrl: "assets/Image/dress1.jpg")
]);

List<Product> mainList = [
/*  Product(

    imageUrl: "assets/Image/dress5.jpg",
    name: "",
    price: 2000.00,
    review: 3.6,
    star: 4.8,
    id: '1qdsmfljqlsdjkf',
    value: 1,
    category: DocumentReference
  ),
  Product(
    imageUrl: "assets/Image/dress6.png",
    name: "blue Coat",
    price: 1700.00,
    review: 5.6,
    star: 5.0,
    id: 'qmlsdjkfmqlsdjf2',
    value: 1,
  ),
  Product(
    imageUrl: "assets/Image/dress1.jpg",
    name: "Deep Green Jacket",
    price: 2500.00,
    review: 2.6,
    star: 3.7,
    id: '3eraemljkfqdf',
    value: 1,
  ),
  Product(
    imageUrl: "assets/Image/dress2.jpg",
    name: "Orange Shirt",
    price: 2500.00,
    review: 1.4,
    star: 2.4,
    id: '4emralkejrare',
    value: 1,
  ),
  Product(
    imageUrl: "assets/Image/dress3.jpg",
    name: "Grey Pullover",
    price: 1650.00,
    review: 4.2,
    star: 1.8,
    id: '5qmsdlfjiefn',
    value: 1,
  ),
  Product(
    imageUrl: "assets/Image/dress4.jpg",
    name: "Pullover Sleeveless",
    price: 2200.00,
    review: 2.1,
    star: 3.1,
    id: '6',
    value: 1,
  ),
  Product(
    imageUrl: "assets/Image/dress5.jpg",
    name: "Black Coat",
    price: 2000.00,
    review: 3.1,
    star: 4.8,
    id: '7qmdlsfjkaoeijf',
    value: 1,
  ),
  Product(
    imageUrl: "assets/Image/dress7.jpg",
    name: "White Shirt",
    price: 1700.00,
    review: 2.6,
    star: 4.8,
    id: '8emlfkjazepo',
    value: 1,
  ),*/
];

List<Product> itemsOnCart = [];
List<Product> itemsOnSearch = [];
