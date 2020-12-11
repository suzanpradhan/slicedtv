import 'package:flutter/material.dart';
import 'package:slicedtv/models/cast_model.dart';
import 'package:slicedtv/utils/conts/colors.dart';

class CastCardWidget extends StatefulWidget {
  final CastModel castModel;
  CastCardWidget({this.castModel});
  @override
  _CastCardWidgetState createState() => _CastCardWidgetState();
}

class _CastCardWidgetState extends State<CastCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.castModel.castProfilePic))),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 80,
            child: Text(
              widget.castModel.castName,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SF-PRO-DISPLAY",
                  fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
