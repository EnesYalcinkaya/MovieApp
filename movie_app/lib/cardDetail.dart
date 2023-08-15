import 'package:flutter/material.dart';

class CardDetailPage extends StatelessWidget {
  final String movieName;
  final String posterPath;

  CardDetailPage({required this.movieName, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '               Movie Details',
          style: TextStyle(color: Colors.red),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500/$posterPath',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              movieName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'More details about the movie can be shown here.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
