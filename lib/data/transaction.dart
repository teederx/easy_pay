import 'package:flutter/material.dart';

class Transaction {
  const Transaction({
    required this.title,
    required this.amount,
    required this.time,
    required this.image, 
    required this.isCredit, 
  });

  final String title;
  final bool isCredit;
  final double amount;
  final Widget image;
  final DateTime time;
}
