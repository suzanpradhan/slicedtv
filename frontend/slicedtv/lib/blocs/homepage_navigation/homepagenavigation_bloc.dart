import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'homepagenavigation_event.dart';
part 'homepagenavigation_state.dart';

class HomepagenavigationBloc
    extends Bloc<HomepagenavigationEvent, HomepagenavigationState> {
  HomepagenavigationBloc() : super(HomepagenavigationInitial());

  @override
  Stream<HomepagenavigationState> mapEventToState(
    HomepagenavigationEvent event,
  ) async* {
    if (event is NavigateToExploreScreen) {
      yield ExploreScreenState();
    }
  }
}
