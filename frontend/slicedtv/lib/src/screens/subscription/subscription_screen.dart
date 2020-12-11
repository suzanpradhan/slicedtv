import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicedtv/blocs/subscription_navigator/subscription_navigator_bloc.dart';
import 'package:slicedtv/src/screens/subscription/card_form_payment.dart';
import 'package:slicedtv/src/screens/subscription/payment_selection.dart';
import 'package:slicedtv/src/screens/subscription/subscription_detail.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SubscriptionNavigatorBloc>(
        create: (context) =>
            SubscriptionNavigatorBloc()..add(NavigateToSubscriptionSelection()),
      )
    ], child: SubscriptionScreenState());
  }
}

class SubscriptionScreenState extends StatefulWidget {
  @override
  _SubscriptionScreenStateState createState() =>
      _SubscriptionScreenStateState();
}

class _SubscriptionScreenStateState extends State<SubscriptionScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: Text("sliced.tv"),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              color: Colors.red,
              onPressed: () {},
              child: Text(
                "Sign Out",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "SF-PRO-DISPLAY-BOLD",
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SubscriptionNavigatorBloc, SubscriptionNavigatorState>(
            listener: (context, state) {},
          ),
        ],
        child:
            BlocBuilder<SubscriptionNavigatorBloc, SubscriptionNavigatorState>(
          builder: (context, state) {
            if (state is SubscriptionDetailState) {
              return SubscriptionDetail();
            } else if (state is PaymentMethodPageState) {
              return PaymentSelection(
                subscriptionDetail: state.subscriptionDetail,
              );
            } else if (state is CardFormState) {
              return CardFormPayment(
                  subscriptionDetail: state.subscriptionDetail);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
