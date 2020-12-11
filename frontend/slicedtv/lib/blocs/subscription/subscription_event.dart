part of 'subscription_bloc.dart';

abstract class SubscriptionEvent extends Equatable {
  const SubscriptionEvent();

  @override
  List<Object> get props => [];
}

class SubscriptionPlanSelected extends SubscriptionEvent {
  final SubscriptionDetail subscriptionDetail;
  const SubscriptionPlanSelected({this.subscriptionDetail});

  @override
  List<Object> get props => [subscriptionDetail];
}

class PayementMethodSelected extends SubscriptionEvent {
  final SubscriptionDetail subscriptionDetail;
  final String paymentMethod;
  const PayementMethodSelected({this.subscriptionDetail, this.paymentMethod});

  @override
  List<Object> get props => [subscriptionDetail, paymentMethod];
}

class PaymentFromCard extends SubscriptionEvent {
  final SubscriptionDetail subscriptionDetail;
  final CardDetails cardDetails;
  const PaymentFromCard({this.cardDetails, this.subscriptionDetail});

  @override
  // TODO: implement props
  List<Object> get props => [subscriptionDetail, cardDetails];
}
