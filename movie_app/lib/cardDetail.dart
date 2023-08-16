import 'package:flutter/material.dart';

class CardDetailPage extends StatefulWidget {
  final String movieName;
  final String posterPath;
  final String overview;
  final double rating;
  final double popularity;
  final String language;
  final int index;

  const CardDetailPage({
    Key? key,
    required this.movieName,
    required this.posterPath,
    required this.overview,
    required this.rating,
    required this.popularity,
    required this.language,
    required this.index,
  }) : super(key: key);

  @override
  _CardDetailPageState createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  bool _isMoreExpanded = false;

  void _toggleMore() {
    setState(() {
      _isMoreExpanded = !_isMoreExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color ratingBoxColor = widget.rating < 7.0 ? Colors.orange : Colors.green;

    return Scaffold(
      backgroundColor: Color(0xFFD8D9DA),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFD8D9DA),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.61,
                  width: double.infinity,
                  child: Hero(
                    tag: "hero-${widget.index}",
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${widget.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.61,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        const Color(0xffD8D9DA).withOpacity(.1),
                        const Color(0xffD8D9DA).withOpacity(.2),
                        Color(0xffD8D9DA)
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildRatingBox(ratingBoxColor),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    widget.movieName,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF272829),
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.overview,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (_isMoreExpanded) _buildInfoBox('Quality', '4K'),
                if (_isMoreExpanded)
                  _buildInfoBox('Popularity', widget.popularity.toString()),
                if (_isMoreExpanded) _buildInfoBox('Language', widget.language),
              ],
            ),
            GestureDetector(
              onTap: _toggleMore,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: Text(
                  _isMoreExpanded ? 'Less' : 'More',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFF6000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBox(Color boxColor) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: boxColor,
      ),
      child: Column(
        children: [
          const Text(
            'Rating',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const SizedBox(
            width: 12,
          ),
          Text(
            widget.rating.toString(),
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
