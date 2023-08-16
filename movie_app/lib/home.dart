import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'cardDetail.dart';

const apiKey = 'e7240cc3ba10b382efe00b0c7dc5608f';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  List<Map<String, dynamic>> _movies = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _movies = List<Map<String, dynamic>>.from(data['results']);
      });
    } else {
      throw Exception('Veri çekme başarısız: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFD8D9DA),
      appBar: AppBar(
        backgroundColor: Color(0xFF272829),
        centerTitle: true,
        title: const Text(
          "Popular Movies",
          style: TextStyle(
            color: Color(0xFFFF6000),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5 / 8,
          mainAxisSpacing: 11,
          crossAxisSpacing: 15,
        ),
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = _movies[index];
          final movieName = movie['title'];
          final posterPath = movie['poster_path'];
          final overview = movie['overview'];
          final rating = movie['vote_average'];
          final popularity = movie['popularity'];
          final language = movie['original_language'];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardDetailPage(
                    movieName: movieName,
                    posterPath: posterPath,
                    overview: overview,
                    rating: double.parse(rating.toString()),
                    popularity: popularity,
                    language: language,
                    index: index,
                  ),
                ),
              );
            },
            child: Stack(
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
                          child: Hero(
                            tag: "hero-$index",
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500/$posterPath',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Column(
                  children: [
                    Spacer(),
                  ],
                )
              ],
            ),
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
