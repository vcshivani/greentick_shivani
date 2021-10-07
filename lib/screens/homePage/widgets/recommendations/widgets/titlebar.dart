import 'package:flutter/material.dart';
import 'package:greentick_shivani/utils/colors.dart';
import 'package:greentick_shivani/utils/fontStyles.dart';

class Titlebar extends StatelessWidget {
  const Titlebar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Expanded(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.thumb_up,
                color: kRedColor,
              ),
              SizedBox(width: 15),
              Text(
                'Recommended for You',
                style: kHeadingText,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Products List"),
              ),
            );
          },
          child: Text(
            "View All",
            style: TextStyle(
              color: kRedColor,
            ),
          ),
        )
      ],
    );
  }
}
