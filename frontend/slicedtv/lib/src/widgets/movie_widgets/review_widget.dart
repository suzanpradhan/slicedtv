import 'dart:html';

import 'package:flutter/material.dart';
import 'package:slicedtv/models/review_model.dart';
import 'package:slicedtv/utils/conts/colors.dart';

class ReviewWidget extends StatefulWidget {
  final ReviewModel reviewModel;
  ReviewWidget({this.reviewModel});
  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 14,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Icon(
                Icons.star,
                color: ColorPalette.yellowMedium,
                size: 12,
              );
            },
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.reviewModel.review,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
          style: TextStyle(
              fontFamily: "SF=PRO-TEXT",
              fontSize: 14,
              color: ColorPalette.greyLight),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "- " + widget.reviewModel.author,
              style: TextStyle(
                  fontFamily: "SF-PRO-TEXT", fontSize: 14, color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
