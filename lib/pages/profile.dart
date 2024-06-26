import 'package:flutter/material.dart';

/*
* This is for the Activity 1 making a user profile ui fo the user.
* i would like to thank our i
* */
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int year = 1;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CircleAvatar(
                    radius: 100.0,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profile1.jpg',
                        fit: BoxFit.cover,
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white54,
                    height: 20.0,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.person_2,
                        color: Color.fromARGB(255, 255, 163, 26),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        'NAME',
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 14.0,
                            letterSpacing: 2.0),
                      ),
                    ],
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
                  const Row(
                    children: [
                      Icon(
                        Icons.school,
                        color: Color.fromARGB(255, 255, 163, 26),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        'YEAR',
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 14.0,
                            letterSpacing: 2.0),
                      ),
                    ],
                  ),
                   Text(
                    '$year Year',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 255, 163, 26),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        'EMAIL',
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 14.0,
                            letterSpacing: 2.0),
                      ),
                    ],
                  ),
                  const Text(
                    '21-16807@g.batstate-u-edu.ph',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            year += 1;
                          });
                        },
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(255, 255, 163, 26))),
                        child: const Text(
                          "ADD YEAR",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
