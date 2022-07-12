import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isEmpty
                  ? 'Vazio!'
                  : isFull
                      ? 'Lotado!'
                      : 'Pode Entrar!',
              style: TextStyle(
                fontSize: 30,
                color: isFull ? Colors.redAccent[700] : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 90,
                  color: isFull ? Colors.redAccent[700] : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.red.withOpacity(0.2) : Colors.red[200],
                    fixedSize: const Size(100, 100),
                    // padding: const EdgeInsets.all(32),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(color: Colors.green, width: 3,),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Sair',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull
                        ? Colors.blueAccent.withOpacity(0.2)
                        : Colors.blueAccent[100],
                    fixedSize: const Size(100, 100),
                    // padding: const EdgeInsets.all(32),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(color: Colors.green, width: 3,),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
