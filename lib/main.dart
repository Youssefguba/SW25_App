import 'package:ecommerce_app_sw25/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app_sw25/cubits/category_cubit/category_cubit.dart';
import 'package:ecommerce_app_sw25/cubits/product_cubit/product_cubit.dart';
import 'package:ecommerce_app_sw25/screens/login_screen.dart';
import 'package:ecommerce_app_sw25/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    ),
  );
}
