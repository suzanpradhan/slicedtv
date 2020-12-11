import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slicedtv/models/subscription_detail.dart';
import 'package:slicedtv/utils/conts/colors.dart';

class CardFormPayment extends StatefulWidget {
  final SubscriptionDetail subscriptionDetail;
  CardFormPayment({this.subscriptionDetail});
  @override
  _CardFormPaymentState createState() => _CardFormPaymentState();
}

class _CardFormPaymentState extends State<CardFormPayment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Set up your credit or debit card.",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SF-PRO-DISPLAY-BOLD",
                      fontSize: 32)),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 380,
                height: 60,
                decoration: BoxDecoration(
                  color: ColorPalette.blackDark,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "\$" +
                                (widget.subscriptionDetail
                                            .amountPerMonthInCents /
                                        100)
                                    .toString() +
                                " /month",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "SF-PRO-DISPLAY",
                                fontSize: 18),
                          ),
                          Text(
                            widget.subscriptionDetail.subscriptionName,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: ColorPalette.greyLight,
                                fontFamily: "SF-PRO-DISPLAY-BOLD",
                                fontSize: 18),
                          )
                        ],
                      ),
                      Text(
                        "Change",
                        style: TextStyle(
                            color: ColorPalette.yellowMedium,
                            fontFamily: "SF-PRO-DISPLAY",
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: ColorPalette.blackDark, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "SF-PRO-TEXT",
                          fontSize: 16),
                      cursorColor: ColorPalette.purpleMedium,
                      decoration: InputDecoration(
                          hintText: "First Name",
                          hintStyle: TextStyle(
                              color: ColorPalette.greyLight,
                              fontFamily: "SF-PRO-TEXT",
                              fontSize: 16),
                          border: InputBorder.none,
                          isDense: true),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: 380,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: ColorPalette.blackDark, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "SF-PRO-TEXT",
                          fontSize: 16),
                      cursorColor: ColorPalette.purpleMedium,
                      decoration: InputDecoration(
                          hintText: "Last Name",
                          hintStyle: TextStyle(
                              color: ColorPalette.greyLight,
                              fontFamily: "SF-PRO-TEXT",
                              fontSize: 16),
                          border: InputBorder.none,
                          isDense: true),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: 380,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: ColorPalette.blackDark, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "SF-PRO-TEXT",
                          fontSize: 16),
                      cursorColor: ColorPalette.purpleMedium,
                      decoration: InputDecoration(
                          hintText: "Card Number",
                          hintStyle: TextStyle(
                              color: ColorPalette.greyLight,
                              fontFamily: "SF-PRO-TEXT",
                              fontSize: 16),
                          border: InputBorder.none,
                          isDense: true),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: 380,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: ColorPalette.blackDark, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "SF-PRO-TEXT",
                          fontSize: 16),
                      cursorColor: ColorPalette.purpleMedium,
                      decoration: InputDecoration(
                          hintText: "Expiration Date",
                          hintStyle: TextStyle(
                              color: ColorPalette.greyLight,
                              fontFamily: "SF-PRO-TEXT",
                              fontSize: 16),
                          border: InputBorder.none,
                          isDense: true),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: 380,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: ColorPalette.blackDark, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "SF-PRO-TEXT",
                          fontSize: 16),
                      cursorColor: ColorPalette.purpleMedium,
                      decoration: InputDecoration(
                          hintText: "Security Number (CVC)",
                          hintStyle: TextStyle(
                              color: ColorPalette.greyLight,
                              fontFamily: "SF-PRO-TEXT",
                              fontSize: 16),
                          border: InputBorder.none,
                          isDense: true),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: 380,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: ColorPalette.blackLightDark, width: 1)),
                      child: Checkbox(
                        activeColor: Colors.black,
                        value: true,
                        onChanged: (boolean) {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        "By checking the checkbox below, you agree to our Terms of Use, Privacy Statement, and that you are over 18.",
                        style: TextStyle(
                            color: ColorPalette.greyLight,
                            fontFamily: "SF-PRO-TEXT",
                            fontStyle: FontStyle.italic,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                    color: ColorPalette.purpleMedium,
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text(
                    "START MEMBERSHIP",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontFamily: "SF-PRO-DISPLAY-BOLD"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
