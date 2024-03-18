import 'package:easy_pay/pages/home.dart';
import 'package:easy_pay/pages/login_page.dart';
import 'package:easy_pay/pages/onboarding.dart';
import 'package:easy_pay/pages/paying_bills.dart';
import 'package:easy_pay/pages/send_page.dart';
import 'package:easy_pay/pages/transaction_details.dart';
import 'package:easy_pay/provider/beneficiaries.dart';
import 'package:easy_pay/provider/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Beneficiaries(),
        ),
        ChangeNotifierProvider(
          create: (context) => Transactions(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // textTheme: TextTheme(
          //   titleLarge: GoogleFonts.montserrat(),
          // )
          fontFamily: 'Montserrat',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(59, 56, 235, 1),
            primary: const Color.fromRGBO(59, 56, 235, 1),
          ),
          useMaterial3: true,
        ),
        initialRoute: Onboarding.routeName,
        routes: {
          Onboarding.routeName: (context) => const Onboarding(),
          LoginPage.routeName: (context) => const LoginPage(),
          Home.routeName: (context) => const Home(),
          Send.routeName: (context) => const Send(),
          TransactionDetails.routeName: (context) => const TransactionDetails(),
          PayingBills.routeName: (context) => const PayingBills(),
        },
      ),
    );
  }
}
