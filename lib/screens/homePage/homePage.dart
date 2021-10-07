import 'package:flutter/material.dart';
import 'package:greentick_shivani/screens/homePage/widgets/contactUs/contactus.dart';
import 'package:greentick_shivani/screens/homePage/widgets/recommendations/recSection.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            RecommendationsWidget(),
            SizedBox(height: 20),
            ContactUsWidget(),
          ],
        ),
      ),
    );
  }
}
