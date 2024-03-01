import 'package:easy_pay/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/social_login.dart';

class Onboarding extends StatelessWidget {
  static const routeName = '/';
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              // margin: EdgeInsets.all(0),
              height: size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
                  image: AssetImage('assets/images/Group.png'),
                ),
              ),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Positioned(
                    bottom: size.height * 0.2,
                    child: Image.asset('assets/images/Ellipse_bottom1.png'),
                  ),
                  Positioned(
                    bottom: size.height * 0.1,
                    child: Image.asset('assets/images/Ellipse_bottom2.png'),
                  ),
                  Positioned(
                    bottom: size.height * 0.04,
                    child: Image.asset('assets/images/Ellipse_bottom3.png'),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // color: Colors.black38,
                  height: size.height * 0.54,
                  width: size.width,
                  child: Stack(
                    // alignment: Alignment.topCenter,
                    children: [
                      Image.asset('assets/images/Ellipse_top1.png'),
                      Image.asset('assets/images/Ellipse_top2.png'),
                      Image.asset('assets/images/Ellipse_top3.png'),
                      Container(
                        // color: Color.fromARGB(207, 253, 249, 249),
                        width: size.width,
                        height: size.height * 0.2,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white70,
                              Colors.white60,
                              // Colors.white38,
                              Colors.white12,
                              // Colors.transparent
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset('assets/images/Logo.png'),
                            ),
                            Image.asset('assets/images/Cards.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: size.height * 0.46,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          // color: Colors.grey,
                          height: size.height * 0.14,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'EasyPay',
                                style: GoogleFonts.montserrat(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Smart Finance Easy Transactions',
                                style: GoogleFonts.montserrat(
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          // color: Colors.grey,
                          height: size.height * 0.2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, LoginPage.routeName),
                                style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              socialLogin(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'do you not have an account? ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(117, 117, 117, 100),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget socialLogin() {
    return Hero(
      tag: 'social_login',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SocialLogin(
            onPressed: () {},
            iconUrl: 'assets/images/apple_icon.png',
          ),
          SocialLogin(
            onPressed: () {},
            iconUrl: 'assets/images/google_icon.png',
          ),
          SocialLogin(
            onPressed: () {},
            iconUrl: 'assets/images/facebook_icon.png',
          ),
        ],
      ),
    );
  }
}
