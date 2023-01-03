import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_blocs.dart';
import 'home_page.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 // BlocProvider is the entry point of your BLoC for your app. You need to wrap MaterialApp using BlocProvider.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>CounterBlocs(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}