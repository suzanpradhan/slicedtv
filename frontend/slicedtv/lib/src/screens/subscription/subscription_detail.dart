import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicedtv/blocs/subscription_navigator/subscription_navigator_bloc.dart';
import 'package:slicedtv/models/subscription_detail.dart';
import 'package:slicedtv/src/screens/subscription/payment_selection.dart';
import 'package:slicedtv/src/widgets/subscription/benefit_listing.dart';
import 'package:slicedtv/utils/conts/colors.dart';
import 'package:slicedtv/utils/screen_config.dart';

class SubscriptionDetail extends StatefulWidget {
  @override
  _SubscriptionDetailState createState() => _SubscriptionDetailState();
}

class _SubscriptionDetailState extends State<SubscriptionDetail> {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Container(
      height: ScreenConfig.screenHeight,
      width: ScreenConfig.screenWidth,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Choose Your Plan.",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SF-PRO-DISPLAY-BOLD",
                  fontSize: 32),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 340,
                  height: 400,
                  decoration: BoxDecoration(
                      color: ColorPalette.blackDark,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Basic",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF-PRO-DISPLAY-BOLD",
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "\$7.99",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "SF-PRO-TEXT",
                                    fontSize: 38)),
                            TextSpan(
                                text: " / month",
                                style: TextStyle(
                                    color: ColorPalette.greyLight,
                                    fontFamily: "SF-PRO-TEXT",
                                    fontSize: 24))
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            BenefitListing(
                              listingValue: "Ad free.",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            BenefitListing(
                              listingValue: "Unlimited Movies and TV Shows.",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            BenefitListing(
                              listingValue: "Browse and join a Watch Party.",
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RaisedButton(
                              elevation: 5,
                              color: ColorPalette.greyMedium,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () {
                                BlocProvider.of<SubscriptionNavigatorBloc>(
                                        context)
                                    .add(NavigateToPaymentMethodSelection(
                                        subscriptionDetail:
                                            subscriptionDetailBasic));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 10),
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "SF-PRO-DISPLAY",
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                Container(
                    width: 340,
                    height: 400,
                    decoration: BoxDecoration(
                        color: ColorPalette.blackLightDark,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Premium",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "SF-PRO-DISPLAY-BOLD",
                                fontSize: 24),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "\$11.99",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "SF-PRO-TEXT",
                                      fontSize: 38)),
                              TextSpan(
                                  text: " / month",
                                  style: TextStyle(
                                      color: ColorPalette.greyLight,
                                      fontFamily: "SF-PRO-TEXT",
                                      fontSize: 24))
                            ]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              BenefitListing(
                                listingValue: "Best Video Quality.",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              BenefitListing(
                                listingValue:
                                    "Uninterrupted, ad-free Watch parties.",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              BenefitListing(
                                listingValue:
                                    "Host a Watch Party and Invite friends.",
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RaisedButton(
                                elevation: 5,
                                color: ColorPalette.greyMedium,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onPressed: () {
                                  BlocProvider.of<SubscriptionNavigatorBloc>(
                                      context)
                                    ..add(NavigateToPaymentMethodSelection(
                                        subscriptionDetail:
                                            subscriptionDetailPremium));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 10),
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "SF-PRO-DISPLAY",
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
