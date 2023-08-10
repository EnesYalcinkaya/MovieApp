import 'package:flutter/material.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Popular Movies",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5 / 8,
          mainAxisSpacing: 11,
          crossAxisSpacing: 15,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24)),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Column(
                children: [
                  Spacer(),
                  Text(
                    "   Movie Name",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MovieApp(),
  ));
}
