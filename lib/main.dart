import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesappbloc/Views/dashboard.dart';
import 'package:shoesappbloc/blocs/bloc/product_bloc.dart';
import 'package:shoesappbloc/blocs/bloc/productbycid_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Kicks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.redAccent,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600])),
      home: const DashBoard(),
    );
  }
}
