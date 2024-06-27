import 'Package:flutter/material.dart';
import 'package:practice/services/product.dart';

class Menucard extends StatelessWidget {
  final Product product;

  Menucard({required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 100,
      child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  "${product.price}",
                  style: const TextStyle(color: Colors.white38),
                ),
              ],
            ),
          )
      ),
    );
  }
}
