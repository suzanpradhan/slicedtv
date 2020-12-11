part of 'homepagenavigation_bloc.dart';

abstract class HomepagenavigationState extends Equatable {
  const HomepagenavigationState();

  @override
  List<Object> get props => [];
}

class HomepagenavigationInitial extends HomepagenavigationState {}

class ExploreScreenState extends HomepagenavigationState {}
