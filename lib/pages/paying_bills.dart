import 'package:easy_pay/widgets/my_separator.dart';
import 'package:flutter/material.dart';

class PayingBills extends StatelessWidget {
  static const routeName = '/payingBills';
  const PayingBills({super.key});

  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
      centerTitle: true,
      title: const Text('Paying Bills'),
      titleTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );

    Size size = MediaQuery.of(context).size;
    var height = size.height - appBar2.preferredSize.height;

    return Scaffold(
      appBar: appBar2,
      body: ListView.builder(
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          height: height * 0.3,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromRGBO(252, 252, 252, 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: const Color.fromRGBO(252, 252, 252, 1),
                height: height * 0.17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.white,
                          width: size.width * 0.2,
                          height: height * 0.07,
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/profile/Alex.png',
                                width: size.width * 0.13,
                              ),
                              Positioned(
                                left: 28,
                                width: size.width * 0.13,
                                child: Image.asset(
                                    'assets/images/profile/Setareh.png'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: size.width * 0.2,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(241, 245, 249, 1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '\$34.02',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Domestic water bill',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      width: size.width * 0.45,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.schedule_rounded,
                            color: Color.fromRGBO(217, 217, 217, 1),
                          ),
                          const Text(
                            '2024 / 02 / 06',
                            style: TextStyle(
                              color: Color.fromRGBO(117, 117, 117, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            height: 4,
                            width: 4,
                          ),
                          const Text(
                            '10:00',
                            style: TextStyle(
                              color: Color.fromRGBO(117, 117, 117, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const MySeparator(
                color: Color.fromRGBO(205, 217, 228, 1),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(241, 245, 249, 1),
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'View Details',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        itemCount: 6,
      ),
    );
  }
}
