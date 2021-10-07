import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greentick_shivani/screens/homePage/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GreenTick Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // setting up font family here
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: MyHomePage(
        title: 'GreenTick Demo Home Page',
      ),
    );
  }
}
