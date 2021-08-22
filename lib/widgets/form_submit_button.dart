import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_trackerfl/widgets/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
}) : assert(text!=null),
  super(
        child: Text(text,style: TextStyle(color: Colors.white, fontSize: 20.0)
        ),
        borderRadius: 4.0,
        height: 44.0,
        color: Colors.indigo,
        onPressed: onPressed,
      );
}