import 'dart:convert';

import 'Package:flutter/material.dart';
import 'package:practice/services/product.dart';
import 'package:practice/services/menuCard.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/products'));

    final data = jsonDecode(response.body);
    List products = <Product>[];

    for (var product in data) {
      products.add(Product.fromJson(product));
    }
    return products;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    products = fetchData();
  }

  // List products = <Product>[
  //   Product(productName: "Shaba", price: 99.99),
  //   Product(productName: "Shabe", price: 10.99),
  //   Product(productName: "Shabi", price: 2.99),
  // ];
  //
  // Widget cardTemplate(product) {
  //   return Menucard(product: product);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
            // children: products.map((product) => cardTemplate(product)).toList(),
            ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu")
      //   ],
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white.withOpacity(0.32),
      //   backgroundColor: const Color.fromARGB(90, 80, 100, 100),
      //   selectedLabelStyle: TextStyle(color: Colors.white.withOpacity(0.32)),
      //   unselectedLabelStyle: const TextStyle(color: Colors.white),
      // ),
    );
  }
}
