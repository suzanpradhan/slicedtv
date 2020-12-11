import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slicedtv/models/subscription_detail.dart';

part 'subscription_navigator_event.dart';
part 'subscription_navigator_state.dart';

class SubscriptionNavigatorBloc
    extends Bloc<SubscriptionNavigatorEvent, SubscriptionNavigatorState> {
  SubscriptionNavigatorBloc() : super(SubscriptionNavigatorInitial());

  @override
  Stream<SubscriptionNavigatorState> mapEventToState(
    SubscriptionNavigatorEvent event,
  ) async* {
    if (event is NavigateToSubscriptionSelection) {
      yield SubscriptionDetailState();
    } else if (event is NavigateToPaymentMethodSelection) {
      yield PaymentMethodPageState(
          subscriptionDetail: event.subscriptionDetail);
    } else if (event is NavigateToCardForm) {
      yield CardFormState(subscriptionDetail: event.subscriptionDetail);
    }
  }
}
