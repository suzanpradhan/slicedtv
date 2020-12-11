import 'package:flutter/material.dart';
import 'package:slicedtv/models/movie_model.dart';
import 'package:slicedtv/utils/conts/colors.dart';

class MovieCardWidget extends StatefulWidget {
  final MovieModel movieModel;
  MovieCardWidget({this.movieModel});
  @override
  _MovieCardWidgetState createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: 160,
            height: 220,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.movieModel.moviePosterLink)),
                borderRadius: BorderRadius.circular(12),
                color: ColorPalette.blackDark),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 160,
            child: Text(
              widget.movieModel.movieName,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SF-PRO-DISPLAY",
                  fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
