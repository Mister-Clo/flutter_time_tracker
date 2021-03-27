import 'package:flutter/material.dart';
import 'package:time_trackerfl/widgets/custom_elevated_button.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(assetName),
                Text(
                  text,
                  style: TextStyle(fontSize: 15, color: textColor),
                ),
                Opacity(opacity: 0.0, child: Image.asset(assetName)),
              ],
            ),
            color: color,
            onPressed: onPressed);
}
