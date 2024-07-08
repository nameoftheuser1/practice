import 'package:flutter/material.dart';
import 'package:practice/services/product.dart';

class SelectedProduct extends StatefulWidget {
  final Product product;

  const SelectedProduct({super.key, required this.product});

  @override
  State<SelectedProduct> createState() => _SelectedProductState(product: product);
}

class _SelectedProductState extends State<SelectedProduct> {
  final Product product;
  late double totalAmount = 0.00;
  int numberOfOrder = 1;

  _SelectedProductState({required this.product});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalAmount = product.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),body: Padding(padding: const EdgeInsets.all(16.0), child: Column(children: [Text(widget.product.product_name, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900, letterSpacing: 1.5),), Text(widget.product.product_description, style: TextStyle(color: Colors.white)), Expanded(child: Align(alignment: Alignment.bottomLeft,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('₱ ${totalAmount.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 18)),Container(child: Row(children: [IconButton(onPressed: (){setState(() { if (numberOfOrder > 1){numberOfOrder -= 1; totalAmount = product.price * numberOfOrder;}});}, icon: Icon(Icons.remove)),Text(numberOfOrder.toString(), style: TextStyle(color: Colors.white, fontSize: 18)),IconButton(onPressed: (){setState(() {numberOfOrder += 1; totalAmount = product.price * numberOfOrder;});}, icon: Icon(Icons.add)),],))],),))],),),
    );
  }
}
