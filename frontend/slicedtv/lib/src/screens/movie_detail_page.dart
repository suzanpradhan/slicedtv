import 'dart:html';

import 'package:flutter/material.dart';
import 'package:slicedtv/models/cast_model.dart';
import 'package:slicedtv/models/review_model.dart';
import 'package:slicedtv/src/widgets/movie_card_widget.dart';
import 'package:slicedtv/src/widgets/movie_widgets/cast_card_widget.dart';
import 'package:slicedtv/src/widgets/movie_widgets/review_widget.dart';
import 'package:slicedtv/utils/conts/colors.dart';
import 'package:slicedtv/utils/screen_config.dart';

class MovieDetailPage extends StatefulWidget {
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet leo et eros blandit pulvinar ut nec odio. Mauris vitae dolor non felis gravida rhoncus nec sit amet mauris. Suspendisse eros diam, porta in egestas ac, feugiat iaculis dui. Aenean risus arcu, dapibus laoreet consectetur convallis, ultrices nec libero. Donec a lectus nec dolor mollis ultrices at sit amet elit. Fusce sed sagittis mi, ut vulputate risus. Aliquam vestibulum faucibus nibh ac faucibus. Integer sed convallis eros. Vestibulum risus tortor, tristique at eros in, rhoncus pulvinar magna. In hac habitasse platea dictumst. Aliquam efficitur semper velit, non consectetur ex maximus quis. In ligula nisl, auctor nec velit et, sollicitudin fermentum ligula. Curabitur mi velit, tempor eget posuere et, vehicula nec dolor. Donec sed faucibus dui. Fusce aliquam velit non faucibus placerat.";
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/82/f1/de/82f1de90166da0f88de8eabc1d1896ad.jpg"),
                  fit: BoxFit.cover)),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0.8)
              ])),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 24, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Joker",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SF-PRO-DISPLAY-BOLD",
                      fontSize: 62),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 400,
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                          color: ColorPalette.greyLight,
                          fontFamily: "SF-PRO-TEXT",
                          fontSize: 16),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      color: ColorPalette.blackLightDark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Watch Trailer",
                          style: TextStyle(
                              fontFamily: "SF-PRO-TEXT",
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: ColorPalette.yellowMedium,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Watch Now",
                          style: TextStyle(
                              fontFamily: "SF-PRO-TEXT",
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: ColorPalette.purpleMedium,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Watch Party",
                          style: TextStyle(
                              fontFamily: "SF-PRO-TEXT",
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Cast",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SF-PRO-DISPLAY",
                      fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return CastCardWidget(
                        castModel: testCastDataList[index],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 600,
                      child: IgnorePointer(
                        child: GridView.count(
                          shrinkWrap: true,
                          primary: true,
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          children: testReviewDataList
                              .map((items) => Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ReviewWidget(
                                      reviewModel: items,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
