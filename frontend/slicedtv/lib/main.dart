import 'package:flutter/material.dart';
import 'package:slicedtv/src/screens/landing_page.dart';
import 'package:slicedtv/src/screens/subscription/subscription_detail.dart';

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
        home: SubscriptionDetail());
  }
}
