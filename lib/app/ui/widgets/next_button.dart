import 'package:baffle/app/ui/components/dong_colors.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.text, required this.state, required this.onPressed}) : super(key: key);

  final String text;
  final bool state;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.07,
          color: app_orange30,
            child: Text(text)
        ),
    );
  }
}
