import 'package:flutter/material.dart';
//import 'package:lottie/lottie.dart';
import 'package:movie_app/home.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MovieApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFD8D9DA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.asset(
            //   'images/1.json',
            //   animate: true,
            // ),
            const Text(
              "Mey Studio",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieAppState extends StatefulWidget {
  @override
  State<_MovieAppState> createState() => __MovieAppState();
}

class __MovieAppState extends State<_MovieAppState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
      ),
      body: const Center(
        child: Text("Welcome to Movie App!"),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: splashscreen()));
}
