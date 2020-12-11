import 'dart:html';

import 'package:flutter/material.dart';
import 'package:slicedtv/models/movie_model.dart';
import 'package:slicedtv/src/widgets/movie_card_widget.dart';
import 'package:slicedtv/utils/screen_config.dart';

class ExploreScreen extends StatefulWidget {
  final List<MovieModel> testDataMovieList;
  ExploreScreen({this.testDataMovieList});
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Trending",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "SF-PRO-DISPLAY-BOLD",
                        fontSize: 28),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 280,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: widget.testDataMovieList.length,
                      padding: EdgeInsets.only(left: 24),
                      itemBuilder: (BuildContext context, int index) {
                        return MovieCardWidget(
                          movieModel: widget.testDataMovieList[index],
                        );
                      },
                    ),
                  ),
                )
              ],
            )),
          ),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "Recommended",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SF-PRO-DISPLAY-BOLD",
                      fontSize: 28),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 280,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: widget.testDataMovieList.length,
                    padding: EdgeInsets.only(left: 24),
                    itemBuilder: (BuildContext context, int index) {
                      return MovieCardWidget(
                        movieModel: widget.testDataMovieList[index],
                      );
                    },
                  ),
                ),
              )
            ],
          )),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "Trending",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SF-PRO-DISPLAY-BOLD",
                      fontSize: 28),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 280,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: widget.testDataMovieList.length,
                    padding: const EdgeInsets.only(left: 24),
                    itemBuilder: (BuildContext context, int index) {
                      return MovieCardWidget(
                        movieModel: widget.testDataMovieList[index],
                      );
                    },
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
