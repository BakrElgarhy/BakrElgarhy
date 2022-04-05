// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:bloc/bloc.dart';
import 'package:calc_flutter/calc_cubit/cubit_observer.dart';
import 'package:calc_flutter/calc_screen.dart';
import 'package:flutter/material.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(
      MyApp(),
    ),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp() ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,),
      home: CalcScreen(),
    );
  }
}
