import 'package:dirst_app/views/calculator/calculator_view.dart';
import 'package:dirst_app/views/home_views.dart';
import 'package:flutter/material.dart';

// Stateless Widget is a widget in Flutter that doesn't change its state
// For e.g. If the background color of the container remains Amber,
// then it can be put into a stateless widget

// Stateful Widget is a widget that requires mutable state (i.e. whose state can change)

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "First Flutter App",
        theme: ThemeData(
          primarySwatch: Colors.deepOrange
        ),
        home: const HomeView()
    );
  }
}
