import 'package:easy_pay/data/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Transactions extends ChangeNotifier {
  final List<Transaction> _transactionsList = [
    Transaction(
      title: 'Ali Sent',
      amount: 100.00,
      time: DateTime.now(),
      image: Image.asset('assets/images/profile/Ali.png'),
      isCredit: true,
    ),
    Transaction(
      title: 'Super Market',
      amount: 36.83,
      time: DateTime.now().subtract(const Duration(days: 1)),
      image: SvgPicture.asset('assets/svgs/home svgs/History/super-market.svg'),
      isCredit: false,
    ),
    Transaction(
      title: 'Gift For You!',
      amount: 60.00,
      time: DateTime.now().subtract(const Duration(days: 5)),
      image: SvgPicture.asset('assets/svgs/home svgs/History/Gift.svg'),
      isCredit: true,
    ),
    Transaction(
      title: 'Send Money',
      amount: 35.00,
      time: DateTime.now().subtract(const Duration(days: 6)),
      image: SvgPicture.asset('assets/svgs/home svgs/History/Send-money.svg'),
      isCredit: false,
    ),
    Transaction(
      title: 'Gas Station',
      amount: 12.28,
      time: DateTime.now().subtract(const Duration(days: 7)),
      image: SvgPicture.asset('assets/svgs/home svgs/History/Gas.svg'),
      isCredit: false,
    ),
    Transaction(
      title: 'Premium Spotify',
      amount: 10.99,
      time: DateTime.now().subtract(const Duration(days: 10)),
      image: SvgPicture.asset('assets/svgs/home svgs/History/Spotify.svg'),
      isCredit: false,
    ),
    Transaction(
      title: 'Morteza Send',
      amount: 96.00,
      time: DateTime.now().subtract(const Duration(days: 20)),
      image: SvgPicture.asset('assets/svgs/home svgs/History/Morteza.svg'),
      isCredit: true,
    ),
    Transaction(
      title: 'Cat Food',
      amount: 10.99,
      time: DateTime.now().subtract(const Duration(days: 31)),
      image: SvgPicture.asset('assets/svgs/home svgs/History/pet.svg'),
      isCredit: false,
    ),
  ];

  List<Transaction> get transactionsList {
    return _transactionsList;
  }

  int itemCount() {
    return _transactionsList.length;
  }
}
