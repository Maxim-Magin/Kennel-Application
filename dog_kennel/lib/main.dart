
import 'package:dog_kennel/Bloc/bloc_base.dart';
import 'package:dog_kennel/Bloc/main_bloc.dart';
import 'package:dog_kennel/Screens/aboutUsPage.dart';
import 'package:dog_kennel/Screens/contactsPage.dart';
import 'package:dog_kennel/Screens/logInPage.dart';
import 'package:dog_kennel/dogs.dart';
import 'package:dog_kennel/dogsRepository.dart';
import 'package:flutter/material.dart';
import 'Bloc/bloc_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        child: LogInPage(),
        bloc: MainBloc(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    );
  }
}
