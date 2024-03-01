import 'package:easy_pay/pages/login_page.dart';
import 'package:easy_pay/pages/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // textTheme: TextTheme(
        //   titleLarge: GoogleFonts.montserrat(),
        // ),
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
      },
    );
  }
}
