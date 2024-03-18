import 'package:flutter/material.dart';

import 'number_tile.dart';

class NumberPad extends StatelessWidget {
  const NumberPad({
    super.key,
    required this.inPut,
    required this.backspace,
  });

  final void Function(String text) inPut;
  final void Function() backspace;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 1.85,
      children: [
        NumberTile(
          number: const Text(
            '1',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          onTap: () => inPut('1'),
        ),
        NumberTile(
          number: const Text(
            '2',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          onTap: () => inPut('2'),
        ),
        NumberTile(
          number: const Text(
            '3',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          onTap: () => inPut('3'),
        ),
        NumberTile(
          number: const Text(
            '4',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          onTap: () => inPut('4'),
        ),
        NumberTile(
          number: const Text(
            '5',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          onTap: () => inPut('5'),
        ),
        NumberTile(
          number: const Text(
            '6',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          onTap: () => inPut('6'),
        ),
        NumberTile(
          number: const Text(
            '7',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          onTap: () => inPut('7'),
        ),
        NumberTile(
          number: const Text(
            '8',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          onTap: () => inPut('8'),
        ),
        NumberTile(
          number: const Text(
            '9',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          onTap: () => inPut('9'),
        ),
        NumberTile(
          number: const Text(
            '.',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          onTap: () => inPut('.'),
        ),
        NumberTile(
          number: const Text(
            '0',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          onTap: () => inPut('0'),
        ),
        NumberTile(
          number: const Icon(Icons.backspace_rounded),
          onTap: () => backspace(),
        ),
      ],
    );
  }
}