import 'package:easy_pay/pages/paying_bills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/activity_button.dart';
import '../widgets/history.dart';
import '../widgets/send_money.dart';

class Home extends StatefulWidget {
  static const routeName = '/Home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedNav = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: size.height * 0.4,
                      width: size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/HeaderSection.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                        left: 20,
                        right: 20,
                      ),
                      // color: Colors.grey,
                      height: size.height * 0.32,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          header(),
                          balance(size),
                          activity(size),
                        ],
                      ),
                    ),
                  ],
                ),
                SendMoney(size: size),
              ],
            ),
            const History(),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(),
        onPressed: () => Navigator.pushNamed(context, PayingBills.routeName),
        child: SvgPicture.asset(
          'assets/svgs/home svgs/wallet-3.svg',
        ),
      ),
      bottomNavigationBar: bottomNavigation(size, context),
      extendBody: true,
    );
  }

  Widget activity(Size size) {
    return SizedBox(
      height: size.height * 0.1,
      width: double.infinity,
      // color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActivityButton(
            svgString: 'assets/svgs/home svgs/send-2.svg',
            onPressed: () {},
            label: 'Send',
          ),
          ActivityButton(
            svgString: 'assets/svgs/home svgs/wallet-3.svg',
            onPressed: () {},
            label: 'Pay',
          ),
          ActivityButton(
            svgString: 'assets/svgs/home svgs/cards.svg',
            onPressed: () {},
            label: 'Cards',
          ),
          ActivityButton(
            svgString: 'assets/svgs/home svgs/element-3.svg',
            onPressed: () {},
            label: 'More',
          ),
        ],
      ),
    );
  }

  Widget balance(Size size) {
    return SizedBox(
      // color: Colors.grey,
      height: size.height * 0.1,
      width: size.width * 0.5,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Your Balance',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          Text(
            '\$8,353.11',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svgs/home svgs/menu.svg',
          ),
        ),
        const Row(
          children: [
            Text(
              'Welcome back, ',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.7),
              ),
            ),
            Text(
              'Favour',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ],
        ),
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
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svgs/home svgs/notification.svg',
          ),
        ),
      ],
    );
  }

  Widget bottomNavigation(Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/svgs/home svgs/Background.svg',
            width: size.width * 0.9,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: Row(
              //children inside bottom appbar
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        // color: Colors.black,
                        icon: BottomIcons(
                          icon: SvgPicture.asset(
                            'assets/svgs/home svgs/Chats.svg',
                            height: selectedNav == 0 ? 20 : 23,
                            color: selectedNav == 0
                                ? Theme.of(context).colorScheme.primary
                                : Colors.black,
                          ),
                          selectedNav: selectedNav == 0,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedNav = 0;
                          });
                        },
                      ),
                      IconButton(
                        icon: BottomIcons(
                          icon: SvgPicture.asset(
                            'assets/svgs/home svgs/Call.svg',
                            height: selectedNav == 1 ? 20 : 23,
                            color: selectedNav == 1
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                          selectedNav: selectedNav == 1,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedNav = 1;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: BottomIcons(
                          icon: SvgPicture.asset(
                            'assets/svgs/home svgs/User.svg',
                            height: selectedNav == 2 ? 20 : 23,
                            color: selectedNav == 2
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                          selectedNav: selectedNav == 2,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedNav = 2;
                          });
                        },
                      ),
                      IconButton(
                        icon: BottomIcons(
                          icon: SvgPicture.asset(
                            'assets/svgs/home svgs/profile.svg',
                            height: selectedNav == 3 ? 20 : 23,
                            color: selectedNav == 3
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                          selectedNav: selectedNav == 3,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedNav = 3;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
