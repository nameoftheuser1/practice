import 'Package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String user = "Drug Lord";
  String benta = "5";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(90, 90, 90, 100),
      appBar: AppBar(
        title: const Text(
          'Welcome To Dashboard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 163, 26),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 400,
          height: 800,
          child: Card(
            color: Colors.white12,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello $user! ang mga nasira mong buhay",
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Card(
                      child: Center(
                        child: Text(
                          "$benta",
                          style: const TextStyle(fontWeight: FontWeight.w900,
                          fontSize:40),
                        ),
                      ),
                    ),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.amber)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/menu');
                          },
                          child: const Text(
                            "Go To Menu",
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(width: 10,),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.amber)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                          child: const Text(
                            "Go To Profile",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
