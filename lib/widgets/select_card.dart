import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectCard extends StatelessWidget {
  const SelectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(241, 245, 249, 0.5),
      ),
      child: ListTile(
        leading: SvgPicture.asset('assets/svgs/cards.svg'),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.expand_more_rounded,
            size: 30,
          ),
        ),
        title: Row(
          children: [
            const Text(
              'Visa ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 4,
              width: 4,
              color: const Color.fromRGBO(194, 194, 194, 1),
            ),
            const SizedBox(
              width: 2,
            ),
            Container(
              height: 4,
              width: 4,
              color: const Color.fromRGBO(194, 194, 194, 1),
            ),
            const SizedBox(
              width: 2,
            ),
            Container(
              height: 4,
              width: 4,
              color: const Color.fromRGBO(194, 194, 194, 1),
            ),
            const Text(
              ' 1234',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        subtitle: const Text(
          '\$ 5,353.11',
          style: TextStyle(
            color: Color.fromRGBO(194, 194, 194, 1),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
