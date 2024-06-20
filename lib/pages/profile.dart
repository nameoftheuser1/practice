import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* This is for the Activity 1 making a user profile ui fo the user.
* i would like to thank our i
* */
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(90, 90, 90, 100),
        appBar: AppBar(
          title: const Text(
            'User Profile',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 163, 26),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 10.0,
                color:Color ,
                padding: const EdgeInsets.all(20),
              ),
              const Text(
                'NAME',
                style: TextStyle(
                    color: Colors.white, fontSize: 19.0, letterSpacing: 2.0),
              ),
              const Text(
                'Angelo Posadas',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'YEAR',
                style: TextStyle(
                    color: Colors.white, fontSize: 19.0, letterSpacing: 2.0),
              ),
              const Text(
                '3rd Year',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'EMAIL',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '21-16807@g.batstate-u-edu.ph',
                style: TextStyle(
                    color: Colors.white, fontSize: 19.0, letterSpacing: 2.0),
              ),
            ],
          ),
        ));
  }
}
