import 'dart:convert';

import 'Package:flutter/material.dart';
import 'package:practice/pages/selected_product.dart';
import 'package:practice/services/product.dart';
import 'package:practice/services/menuCard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/product/all'));

    final data = jsonDecode(response.body);
    // print(data);
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
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: products,
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitSpinningLines(
                    color: Colors.amber,
                    size: 100.0,
                  ),
                );
              }
              if (snapshots.hasData) {
                List products = snapshots.data!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  SelectedProduct(
                                        product: products[index]),
                                  ));
                            },
                            title: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      products[index].product_name,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '(₱${products[index].price})',
                                      style: const TextStyle(
                                          color: Colors.white24),
                                    ),
                                  ],
                                ),
                                Text(
                                  products[index].generic_name,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  products[index].product_description,
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
              return const Center(
                child: Text(
                  " Unable to load data",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
      ),
    );

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
  }
}
