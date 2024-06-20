import 'Package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(90, 90, 90, 100),
      appBar: AppBar(
        title: const Center(
          child: Text('Flutter App', style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 163, 26),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start ,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Container(
            color: Colors.grey[400],
            padding: const EdgeInsets.all(10),
            child: const Text('I like children'),
          ),
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.all(10),
            child: const Text('this is my child'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 163, 26),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
