import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityButton extends StatelessWidget {
  const ActivityButton({
    super.key,
    required this.svgString,
    required this.label,
    required this.onPressed,
  });

  final String svgString;
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(241, 245, 249, 0.1),
        ),
        child: Column(
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: const Color.fromRGBO(241, 245, 249, 0.1),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color.fromRGBO(241, 245, 249, 0.1),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onPressed,
              icon: SvgPicture.asset(
                svgString,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomIcons extends StatelessWidget {
  const BottomIcons({super.key, required this.icon, required this.selectedNav});

  final Widget icon;
  final bool selectedNav;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          if (selectedNav)
            Container(
              color: Theme.of(context).colorScheme.primary,
              width: 13,
              height: 1.5,
            )
        ],
      ),
    );
  }
}
