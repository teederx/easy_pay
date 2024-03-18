import 'package:easy_pay/pages/send_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/beneficiaries.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      height: size.height * 0.15,
      width: size.width,
      // color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            height: size.height * 0.04,
            // color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Send Money',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'More',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.09,
            width: size.width * 0.98,
            margin: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // height: 50,
                        // width: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(241, 245, 249, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: 27.5,
                          width: 27.5,
                          child: SvgPicture.asset(
                            'assets/svgs/home svgs/send.svg',
                            // height: 30,
                            // width: 30,
                          ),
                        ),
                      ),
                      const Text(
                        'New Send',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Consumer<Beneficiaries>(
                    builder: (context, value, _) => ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: value.itemCount(),
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            Send.routeName,
                            arguments: value.beneficiariesList[i],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(241, 245, 249, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      value.beneficiariesList[i].photoURL,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                value.beneficiariesList[i].firstName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
