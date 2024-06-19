import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: const Center(
          child: Text('ProneHub', style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 163, 26),
      ),
      body: const Center(
        child: Text( 'Hello Mom', style: TextStyle( fontSize: 16.0, color: Colors.white )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 163, 26),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    )
  ));
}

