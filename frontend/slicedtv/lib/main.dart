import 'package:flutter/material.dart';
import 'package:slicedtv/src/screens/homepage.dart';
import 'package:slicedtv/src/screens/landing_page.dart';
import 'package:slicedtv/src/screens/subscription/card_form_payment.dart';
import 'package:slicedtv/src/screens/subscription/payment_selection.dart';
import 'package:slicedtv/src/screens/subscription/subscription_detail.dart';
import 'package:slicedtv/src/screens/subscription/subscription_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sliced TV',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}
