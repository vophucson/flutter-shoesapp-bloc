import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesappbloc/Blocs/bloc/category_bloc.dart';
import 'package:shoesappbloc/Widgets/homebanner_widget.dart';
import 'package:shoesappbloc/blocs/bloc/banner_bloc.dart';
import 'package:shoesappbloc/blocs/bloc/product_bloc.dart';
import 'package:shoesappbloc/widgets/homecategory_widget.dart';
import 'package:shoesappbloc/widgets/homeproduct_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BannerBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => ProductBloc()),
      ],
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            HomeBanner(
              key: key,
            ),
            HomeCategory(
              key: key,
            ),
            HomeProduct(
              key: key,
            )
          ],
        ),
      ),
    ));
  }
}
