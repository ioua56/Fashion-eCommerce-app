import 'package:fashion_ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ProductCard extends StatelessWidget {
  final Product data;
  final TextTheme theme;
  final Size size;

  const ProductCard(
      {Key? key, required this.size, required this.theme, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Container(
            width: size.width * 0.6,
            height: size.height * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              image: DecorationImage(
                image: NetworkImage(data.imageUrl),
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Color.fromARGB(61, 0, 0, 0))
              ],
            ),
            child: Stack(
              children: [
                //Discount badge
                (data.discount != 0)
                    ? Positioned(
                        top: 4,
                        left: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                            ),
                          ),
                          child: Text(
                            "${data.discount.floor()}% Off",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                //New product Badge
                DateTime.now().difference(DateTime.now()).inDays < 3
                    ? Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            "New",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              data.name,
              style: theme.headline2,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                if (data.discount != 0)
                  TextSpan(
                    text: "${data.price + (data.price * data.discount) / 100}",
                    style: theme.subtitle2?.copyWith(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                TextSpan(
                  text: data.price.toString(),
                  style: theme.subtitle2?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                TextSpan(
                    text: "DA",
                    style: theme.subtitle2?.copyWith(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
