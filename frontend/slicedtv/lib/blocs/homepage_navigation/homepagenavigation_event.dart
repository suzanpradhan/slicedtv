part of 'homepagenavigation_bloc.dart';

abstract class HomepagenavigationEvent extends Equatable {
  const HomepagenavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToExploreScreen extends HomepagenavigationEvent {}
