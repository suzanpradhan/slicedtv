import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicedtv/blocs/homepage_navigation/homepagenavigation_bloc.dart';
import 'package:slicedtv/models/movie_model.dart';
import 'package:slicedtv/src/screens/movie_detail_page.dart';
import 'package:slicedtv/src/screens/navigation_screens/explore_screen.dart';
import 'package:slicedtv/src/widgets/homepage/left_page_navigation.dart';
import 'package:slicedtv/src/widgets/top_screen_bar.dart';
import 'package:slicedtv/utils/conts/colors.dart';
import 'package:slicedtv/utils/screen_config.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) =>
            HomepagenavigationBloc()..add(NavigateToExploreScreen()),
      )
    ], child: HomePageStateful());
  }
}

class HomePageStateful extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageStateful> {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: ScreenConfig.screenWidth,
              height: 50,
              decoration: BoxDecoration(
                color: ColorPalette.blackDark,
              ),
              child: TopScreenBar(),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeftPageNavigation(),
                  BlocBuilder<HomepagenavigationBloc, HomepagenavigationState>(
                    builder: (context, state) {
                      if (state is ExploreScreenState) {
                        return Expanded(child: MovieDetailPage());
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
