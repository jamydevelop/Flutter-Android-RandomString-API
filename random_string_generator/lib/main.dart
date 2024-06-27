import 'package:bloc_data/bloc/data_bloc.dart';
import 'package:bloc_data/services/api_service.dart';
import 'package:bloc_data/view/screen/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Wrap the DataScreen with a BlocProvider to provide the DataBloc
      home: BlocProvider(
        create: (context) => DataBloc(ApiService()),
        child: const DataScreen(),
      ),
    );
  }
}
