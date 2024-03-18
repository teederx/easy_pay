import 'package:flutter/material.dart';

class NumberTile extends StatelessWidget {
  const NumberTile({
    super.key,
    this.onTap,
    required this.number,
  });

  final void Function()? onTap;
  final Widget number;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(241, 245, 249, 0.5),
        ),
        child: Center(
          child: number,
        ),
      ),
    );
  }
}