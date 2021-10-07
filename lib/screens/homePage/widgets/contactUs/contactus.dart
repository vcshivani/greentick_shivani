import 'package:flutter/material.dart';
import 'package:greentick_shivani/utils/fontStyles.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            "Have Suggestions?",
            style: kHeadingText,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text("Contact Us"),
          )
        ],
      ),
    );
  }
}
