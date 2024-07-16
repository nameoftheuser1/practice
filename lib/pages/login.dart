import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice/services/user.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  Widget buttonContent = Text(
    'Login',
    style: TextStyle(color: Colors.white),
  );

  Widget loadingDisplay = CircularProgressIndicator();

  login(User user) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'usernameOrEmail': user.email,
        'password': user.password
      }),
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 5),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        label: const Text(
                          'Email',
                          style: TextStyle(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                        label: const Text(
                          'Password',
                          style: TextStyle(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password length should be 8';
                      }
                      if (value.length > 20) {
                        return 'Password must be 20 characters long only';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                      User user = User(
                          username: '', email: _email, password: _password);
                      /*if(login(user)){
                        Navigator.pushNamed(context, '/');
                      }*/
                      setState(() {
                          FutureBuilder(
                            future: login(user),
                            builder: (context, snapshots) {
                              if (snapshots.connectionState ==
                                  ConnectionState.waiting) {
                                return loadingDisplay;
                              }
                              if (snapshots.hasData) {
                              }
                              return Text("loginedn");
                            });
                      });
                      Navigator.pushNamed(context, '/');

                    },
                    style: const ButtonStyle(
                        elevation: WidgetStatePropertyAll(0.5),
                        padding: WidgetStatePropertyAll(EdgeInsets.all(5.0)),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 255, 163, 26))),
                    child: buttonContent,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.white70,
                          height: 50,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "or login with",
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white70,
                          height: 50,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.catching_pokemon,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Login with GitHub',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(200, 224, 54, 88),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.alternate_email,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Login with Google',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't you have a account?",
                        style: TextStyle(color: Colors.white70),
                      ),
                      InkWell(
                        child: const Text(
                          " Create Here",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue),
                        ),
                        onTap: () => Navigator.pushNamed(context, '/create'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
