import 'package:animate_do/animate_do.dart';
import 'package:fashion_ecommerce_app/screens/category.dart';
import 'package:fashion_ecommerce_app/widget/reusable_card.dart';
import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../data/categories_data.dart';
import '../data/products_data.dart';
import '../screens/details.dart';
import '../model/categories_model.dart';
import '../utils/constants.dart';
import '../model/product_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  final int _currentIndex = 2;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: _currentIndex, viewportFraction: 0.7);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var customSize = Size(size.height * 0.34, size.height * 0.75);
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Text
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Find your",
                          style: textTheme.headline1,
                          children: [
                            TextSpan(
                              text: " Style",
                              style: textTheme.headline1?.copyWith(
                                color: Colors.orange,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: "Be more ugly with islam",
                          style: TextStyle(
                            color: Color.fromARGB(186, 0, 0, 0),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: "suggestions :)",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Categories
              FadeInUp(
                delay: const Duration(milliseconds: 450),
                child: StreamBuilder<List<CategoriesModel>>(
                    stream: CategoriesData().categories,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.only(top: 7),
                          width: size.width,
                          height: size.height * 0.14,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (ctx, index) {
                                CategoriesModel current = snapshot.data![index];
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => Category(
                                            category: current,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 35,
                                          backgroundImage:
                                              NetworkImage(current.imageUrl),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.002,
                                        ),
                                        Text(
                                          current.title,
                                          style: textTheme.subtitle1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ),

              /// Popular Products Body Slider
              FadeInUp(
                delay: const Duration(milliseconds: 550),
                child: StreamBuilder<List<Product>>(
                    stream: ProductsData().popularProducts,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: size.width,
                          height: size.height * 0.45,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: snapshot.data!.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Details(
                                          data: snapshot.data![index],
                                          isCameFromMostPopularPart: false,
                                        ),
                                      ),
                                    );
                                  },
                                  child: view(snapshot.data![index], index,
                                      textTheme, size));
                            },
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ),

              /// New Products Text
              FadeInUp(
                delay: const Duration(milliseconds: 650),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("New Products", style: textTheme.headline3),
                      Text("See all", style: textTheme.headline4),
                    ],
                  ),
                ),
              ),

              /// New Products Content
              FadeInUp(
                delay: const Duration(milliseconds: 750),
                child: StreamBuilder<List<Product>>(
                    stream: ProductsData().products,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          width: size.width,
                          height: size.height * 0.44,
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.63),
                              itemBuilder: (context, index) {
                                Product current = snapshot.data![index];
                                return GestureDetector(
                                    onTap: (() => Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            return Details(
                                              data: current,
                                              isCameFromMostPopularPart: true,
                                            );
                                          }),
                                        )),
                                    child: ProductCard(
                                        size: customSize,
                                        theme: textTheme,
                                        data: current));
                              }),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Page View
  Widget view(Product data, int index, TextTheme theme, Size size) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0.0;
          if (_pageController.position.haveDimensions) {
            value = index.toDouble() - (_pageController.page ?? 0);
            value = (value * 0.04).clamp(-1, 1);
          }
          return Transform.rotate(
            angle: 3.14 * value,
            child: ProductCard(
              data: data,
              theme: theme,
              size: size,
            ),
          );
        });
  }
}
