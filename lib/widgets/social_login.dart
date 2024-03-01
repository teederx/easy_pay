import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
    required this.onPressed,
    required this.iconUrl,
  });

  final void Function() onPressed;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        elevation: 2,
        // backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Color.fromRGBO(226, 232, 240, 1),
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
      child: Image.asset(iconUrl),
    );
  }
}