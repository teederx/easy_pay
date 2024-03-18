import 'package:easy_pay/data/beneficiary.dart';
import 'package:easy_pay/pages/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/number_pad.dart';
import '../widgets/select_card.dart';
import '../widgets/thousand_formatter.dart';

class Send extends StatefulWidget {
  static const routeName = '/send-money';
  const Send({super.key});

  @override
  State<Send> createState() => _SendState();
}

class _SendState extends State<Send> {
  final _controller = TextEditingController();
  late TextSelection _selection;

  void _input(String text) {
    int position = _selection.base.offset; // gets position of cursor
    var value = _controller.text; // text in our textfield

    if (value.isNotEmpty) {
      var suffix =
          value.substring(position, value.length); // 1) suffix: the string
      // from the position of the cursor to the end of the text in the controller

      value = value.substring(0, position) +
          text +
          suffix; // 2) value.substring gets
      // a new string from start of the string in our textfield, appends the new input to our
      // new string and appends the suffix to it.

      _controller.text =
          value; // 3) set our controller text to the gotten value
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: position + 1)); // 4) update selection
      // to update our position.
    } else {
      value =
          _controller.text + text; // 5) appends controller text and new input
      // and assigns to value
      _controller.text =
          value; // 6) set our controller text to the gotten value
      _controller.selection = TextSelection.fromPosition(
          const TextPosition(offset: 1)); // 7) since this is the first input
      // set position of cursor to 1, so the cursor is placed at the end
    }
  }

// 4
  void _backspace() {
    int position = _selection.base.offset; // cursor position
    final value = _controller.text; // string in our textfield

    // 1) only erase when string in textfield is not empty and when position is not zero (at the start)
    if (value.isNotEmpty && position != 0) {
      var suffix = value.substring(
          position, value.length); // 2) get string after cursor position
      _controller.text = value.substring(0, position - 1) +
          suffix; // 3) get string before the cursor and append to
      // suffix after removing the last char before the cursor
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: position - 1)); // 4) update the cursor
    }
  }

  void _onSelectionChanged() {
    setState(() {
      // update selection on change (updating position too)
      _selection = _controller.selection;
    });
    // print('Cursor position: ${_selection.base.offset}'); // print position
  }

  @override
  void initState() {
    super.initState();
    //add listner to controller to tell when selection is made...
    _controller.addListener(_onSelectionChanged);
    _selection = _controller.selection;
  }

  @override
  void dispose() {
    // remove listener
    _controller.removeListener(_onSelectionChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final beneficiary =
        ModalRoute.of(context)!.settings.arguments as Beneficiary;

    Size size = MediaQuery.of(context).size;

    var appbar = AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
          // print(beneficiary.firstName);
        },
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
      title: const Text('Send Money'),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    );

    var appBarSize = appbar.preferredSize;

    var height = size.height - appBarSize.height - 24;

    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.28,
            width: size.width,
            // color: const Color.fromARGB(255, 12, 240, 88),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.18,
                  width: size.width * 0.36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(
                    //   color: const Color.fromARGB(255, 197, 197, 197),
                    //   width: 1.5,
                    // ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    beneficiary.photoURL,
                    fit: BoxFit.fill,
                  ),
                  // const Center(
                  //   child: Text(
                  //     'Image',
                  //     style: TextStyle(
                  //       color: Color.fromARGB(255, 197, 197, 197),
                  //     ),
                  //   ),
                  // ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Text(
                        '${beneficiary.firstName} ${beneficiary.lastName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'Your Friend',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(158, 158, 158, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                // vertical: 5,
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _controller,
                    readOnly: true,
                    showCursor: true,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                    inputFormatters: [
                      ThousandsFormatter(),
                    ],
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      prefix: Text(
                        '\u0024',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      suffix: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        width: size.width * 0.22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(247, 249, 251, 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'USD',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SvgPicture.asset('assets/svgs/Flag.svg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SelectCard(),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: NumberPad(
                              inPut: _input,
                              backspace: _backspace,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: ElevatedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, TransactionDetails.routeName),
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Send',
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





