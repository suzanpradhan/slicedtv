import 'package:flutter/material.dart';
import 'package:slicedtv/utils/conts/colors.dart';

class BenefitListing extends StatefulWidget {
  final String listingValue;
  BenefitListing({this.listingValue});
  @override
  _BenefitListingState createState() => _BenefitListingState();
}

class _BenefitListingState extends State<BenefitListing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ColorPalette.greyMedium),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            widget.listingValue,
            style: TextStyle(color: ColorPalette.greyLight),
          )
        ],
      ),
    );
  }
}
