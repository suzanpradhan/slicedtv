part of 'subscription_navigator_bloc.dart';

abstract class SubscriptionNavigatorEvent extends Equatable {
  const SubscriptionNavigatorEvent();

  @override
  List<Object> get props => [];
}

class NavigateToSubscriptionSelection extends SubscriptionNavigatorEvent {}

class NavigateToPaymentMethodSelection extends SubscriptionNavigatorEvent {
  final SubscriptionDetail subscriptionDetail;
  const NavigateToPaymentMethodSelection({this.subscriptionDetail});

  @override
  List<Object> get props => [subscriptionDetail];
}

class NavigateToCardForm extends SubscriptionNavigatorEvent {
  final SubscriptionDetail subscriptionDetail;
  const NavigateToCardForm({this.subscriptionDetail});

  @override
  List<Object> get props => [subscriptionDetail];
}
