part of 'subscription_navigator_bloc.dart';

abstract class SubscriptionNavigatorState extends Equatable {
  const SubscriptionNavigatorState();

  @override
  List<Object> get props => [];
}

class SubscriptionNavigatorInitial extends SubscriptionNavigatorState {}

class SubscriptionDetailState extends SubscriptionNavigatorState {}

class PaymentMethodPageState extends SubscriptionNavigatorState {
  final SubscriptionDetail subscriptionDetail;
  const PaymentMethodPageState({this.subscriptionDetail});

  @override
  List<Object> get props => [subscriptionDetail];
}

class CardFormState extends SubscriptionNavigatorState {
  final SubscriptionDetail subscriptionDetail;
  const CardFormState({this.subscriptionDetail});

  @override
  List<Object> get props => [subscriptionDetail];
}
