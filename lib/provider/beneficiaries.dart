import 'package:flutter/material.dart';

import '../data/beneficiary.dart';

class Beneficiaries extends ChangeNotifier {
  final List<Beneficiary> _beneficiary = const [
    Beneficiary(
      firstName: 'Alex',
      lastName: 'Brickwood',
      photoURL: 'assets/images/profile/Alex.png',
    ),
    Beneficiary(
      firstName: 'Setareh',
      lastName: 'Cho',
      photoURL: 'assets/images/profile/Setareh.png',
    ),
    Beneficiary(
      firstName: 'Ali',
      lastName: 'Ababuah',
      photoURL: 'assets/images/profile/Ali.png',
    ),
    // Beneficiary(
    //   firstName: 'Baran',
    //   lastName: 'Drink-Water',
    //   photoURL: 'assets/images/profile/Baran.png',
    // ),
    Beneficiary(
      firstName: 'Hamed',
      lastName: 'Dansu',
      photoURL: 'assets/images/profile/Hamed.png',
    ),
    Beneficiary(
      firstName: 'Mohammad',
      lastName: 'Abdul',
      photoURL: 'assets/images/profile/Mohammad.png',
    ),
  ];

  List<Beneficiary> get beneficiariesList{
    return _beneficiary;
  }

  int itemCount(){
    return _beneficiary.length;
  }
}
