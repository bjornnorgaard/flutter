import 'package:flutter/material.dart';
import 'package:onboarding_arek_k/styles.dart';

class OnboadingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboadingPage({
    Key key,
    @required this.image,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(image),
              width: 250,
              height: 250,
            ),
          ),
          SizedBox(height: 30),
          Text(
            title,
            style: kTitleStyle,
          ),
          SizedBox(height: 15),
          Text(
            subtitle,
            style: kSubtitleStyle,
          ),
        ],
      ),
    );
  }
}
