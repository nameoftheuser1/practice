import 'package:flutter/material.dart';
import 'package:practice/pages/create_account.dart';
import 'package:practice/pages/dashboard.dart';
import 'package:practice/pages/home.dart';
import 'package:practice/pages/login.dart';
import 'package:practice/pages/menu.dart';
import 'package:practice/pages/profile.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 255, 163, 26),
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        scaffoldBackgroundColor: const Color.fromARGB(90, 90, 90, 100),
        cardTheme: const CardTheme(color: Color.fromARGB(90, 77, 76, 70)),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/': (context) => const Dashboard(),
        '/menu': (context) => const Menu(),
        '/profile': (context) => const Profile(),
        '/create' : (context) => const CreateAccount(),
        '/login' : (context) => const Login(),
      },
    ));

//this is not used
class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(90, 90, 90, 100),
        appBar: AppBar(
          title: const Text(
            'Flutter App',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'This is Child',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text('This is Child',
                  style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.amber),
                shape: WidgetStateProperty.all(LinearBorder.none),
              ),
              child: const Text(
                'Add to inventory',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Icon(Icons.delete_forever_outlined),
            )
          ],
        ));
  }
}
