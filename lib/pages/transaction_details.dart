import 'package:easy_pay/pages/home.dart';
import 'package:flutter/material.dart';

class TransactionDetails extends StatelessWidget {
  static const routeName = '/Transaction';
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar(
      leading: IconButton(
        onPressed: () => Navigator.popUntil(
            context, (route) => route.settings.name == Home.routeName),
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
      centerTitle: true,
      title: const Text('Transaction Details'),
      titleTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded),
        ),
      ],
    );
    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    Size size = MediaQuery.of(context).size;
    var height = size.height - appbar.preferredSize.height;

    return Scaffold(
      appBar: appbar,
      body: Container(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(height: height, size: size),
            LargeInfo(size: size),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                onPressed: () => Navigator.popUntil(
                    context, (route) => route.settings.name == Home.routeName),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LargeInfo extends StatelessWidget {
  const LargeInfo({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromRGBO(247, 249, 251, 0.49),
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: (size.width * 0.5) - 10,
                  child: const Text(
                    'Recipient Details',
                    style: TextStyle(
                      color: Color.fromRGBO(158, 158, 158, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: (size.width * 0.5) - 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'M. Pordabagh',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Visa ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(117, 117, 117, 1),
                            ),
                          ),
                          Container(
                            height: 4,
                            width: 4,
                            color: const Color.fromRGBO(224, 224, 224, 1),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            height: 4,
                            width: 4,
                            color: const Color.fromRGBO(224, 224, 224, 1),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            height: 4,
                            width: 4,
                            color: const Color.fromRGBO(224, 224, 224, 1),
                          ),
                          const Text(
                            ' 1234',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(117, 117, 117, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: (size.width * 0.5) - 10,
                  child: const Text(
                    'Transaction Type',
                    style: TextStyle(
                      color: Color.fromRGBO(158, 158, 158, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: (size.width * 0.5) - 10,
                  child: const Text(
                    'Transfer',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: (size.width * 0.5) - 10,
                  child: const Text(
                    'Transaction Code',
                    style: TextStyle(
                      color: Color.fromRGBO(158, 158, 158, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: (size.width * 0.5) - 10,
                  child: const Text(
                    '2131278232',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: (size.width * 0.5) - 10,
                  child: const Text(
                    'Transaction Date',
                    style: TextStyle(
                      color: Color.fromRGBO(158, 158, 158, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: (size.width * 0.5) - 10,
                  child: const Text(
                    'Feb 02, 08:23',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: (size.width * 0.5) - 10,
                  child: const Text(
                    'Amount',
                    style: TextStyle(
                      color: Color.fromRGBO(158, 158, 158, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: (size.width * 0.5) - 10,
                  child: Row(
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Text(
                        '3,000.00',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.height,
    required this.size,
  });

  final double height;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.25,
      // color: Colors.grey,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: height * 0.14,
                width: size.width * 0.30,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(52, 193, 87, 0.04),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                height: height * 0.10,
                width: size.width * 0.21,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(52, 193, 87, 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 50,
                  color: Color.fromRGBO(52, 193, 87, 1),
                ),
              ),
            ],
          ),
          const Text(
            'Successful Payment',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Transfer of',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  ' \$',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const Text(
                  '3,000 ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'To ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  'Mohammad Hossein',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Was Successful',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
