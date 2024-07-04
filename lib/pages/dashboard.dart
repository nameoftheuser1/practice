import 'Package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String user = "Angelo";
  String benta = "5";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome To Dashboard',
        ),
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
                    "Hello $user! ",
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Card(
                      child: Center(
                        child: Text(
                          "$benta",
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                              color: Colors.white70),
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
                      const SizedBox(
                        width: 10,
                      ),
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
                          )),
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
