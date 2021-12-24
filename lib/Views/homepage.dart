import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesappbloc/Blocs/banner_bloc.dart';
import 'package:shoesappbloc/Widgets/homebanner_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [BlocProvider(create: (context) => BannerBloc())],
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            HomeBanner(
              key: key,
            )
          ],
        ),
      ),
    ));
  }
}
