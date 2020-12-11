import 'dart:html';

import 'package:flutter/material.dart';
import 'package:slicedtv/utils/conts/colors.dart';

class TopScreenBar extends StatefulWidget {
  @override
  _TopScreenBarState createState() => _TopScreenBarState();
}

class _TopScreenBarState extends State<TopScreenBar> {
  TextEditingController _searchEditingController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "sliced.tv",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "SF-PRO-DISPLAY-BOLD",
                fontSize: 20),
          ),
        ),
        Container(
          height: 32,
          width: 320,
          decoration: BoxDecoration(
              color: ColorPalette.blackLightDark,
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "SF-PRO-TEXT"),
                      controller: _searchEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: "Search",
                        hintStyle: TextStyle(
                            color: ColorPalette.greyLight,
                            fontFamily: "SF-PRO-DISPLAY",
                            fontSize: 16),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.search,
                  size: 20,
                  color: ColorPalette.greyLight,
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.ac_unit,
              size: 24,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.ac_unit,
              size: 24,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.ac_unit,
              size: 24,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.ac_unit,
              size: 24,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.ac_unit,
              size: 24,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        )
      ],
    );
  }
}
