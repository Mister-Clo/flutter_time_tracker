import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;
  const CustomElevatedButton(
      {Key key,
      this.borderRadius: 8.0,
      this.height: 50,
      this.child,
      this.color,
      this.onPressed})
      : assert(borderRadius != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height,
        maxHeight: height,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            primary: color),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
