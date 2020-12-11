import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicedtv/blocs/subscription_navigator/subscription_navigator_bloc.dart';
import 'package:slicedtv/models/subscription_detail.dart';
import 'package:slicedtv/utils/conts/colors.dart';
import 'package:slicedtv/utils/screen_config.dart';

// class PaymentSelectionRoute extends CupertinoPageRoute {
//   final SubscriptionDetail subscriptionDetail;
//   PaymentSelectionRoute({this.subscriptionDetail})
//       : super(
//             builder: (BuildContext context) => new PaymentSelection(
//                   subscriptionDetail: subscriptionDetail,
//                 ));

//   // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation) {
//     return new ScaleTransition(
//       scale: animation,
//       alignment: Alignment.center,
//       child: new PaymentSelection(
//         subscriptionDetail: subscriptionDetail,
//       ),
//     );
//   }
// }

class PaymentSelection extends StatefulWidget {
  final SubscriptionDetail subscriptionDetail;
  PaymentSelection({this.subscriptionDetail});
  @override
  _PaymentSelectionState createState() => _PaymentSelectionState();
}

class _PaymentSelectionState extends State<PaymentSelection> {
  bool isHoveredCard;
  bool isHoveredKhalti;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHoveredCard = false;
    isHoveredKhalti = false;
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Container(
      width: ScreenConfig.screenWidth,
      height: ScreenConfig.screenHeight,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Set up your payment.",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SF-PRO-DISPLAY-BOLD",
                    fontSize: 32),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                "Pay with",
                style: TextStyle(
                    color: ColorPalette.greyLight,
                    fontSize: 16,
                    fontFamily: "SF-PRO-TEXT"),
              ),
              SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      BlocProvider.of<SubscriptionNavigatorBloc>(context)
                        ..add(NavigateToCardForm(
                            subscriptionDetail: widget.subscriptionDetail));
                    },
                    onHover: (isHover) {
                      setState(() {
                        isHoveredCard = isHover;
                      });
                    },
                    child: Container(
                      width: 380,
                      height: 60,
                      decoration: BoxDecoration(
                          color: isHoveredCard == true
                              ? ColorPalette.blackDark
                              : Colors.black,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: ColorPalette.blackLightDark, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Credit or Debit Card",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "SF-PRO-TEXT"),
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 14,
                                color: ColorPalette.greyLight,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  InkWell(
                    onTap: () {},
                    onHover: (isHover) {
                      setState(() {
                        isHoveredKhalti = isHover;
                      });
                    },
                    child: Container(
                      width: 380,
                      height: 60,
                      decoration: BoxDecoration(
                          color: isHoveredKhalti == true
                              ? ColorPalette.blackDark
                              : Colors.black,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: ColorPalette.blackLightDark, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Khalti",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "SF-PRO-TEXT"),
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 14,
                                color: ColorPalette.greyLight,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
