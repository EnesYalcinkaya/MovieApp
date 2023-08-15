import 'dart:ffi';

import 'package:flutter/material.dart';

class CardDetailPage extends StatelessWidget {
  final String movieName;
  final String posterPath;
  final String overview;

  CardDetailPage(
      {required this.movieName,
      required this.posterPath,
      required this.overview});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 7,
                  blurRadius: 25,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/$posterPath',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            movieName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInfoBox('Duration', 'no data'),
              _buildInfoBox('Release', 'no data'),
              _buildInfoBox('Rating', 'no data'),
              _buildInfoBox('Quality', 'no data'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            overview,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String title, String value) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
