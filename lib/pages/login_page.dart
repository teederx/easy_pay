import 'package:easy_pay/widgets/custom_outlined_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/social_login.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/loginPage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _isVisible = false;
  var _enteredEmail = '';
  var _enteredPassword = '';

  void onSaved() {
    final validateForm = _formKey.currentState!.validate();
    if (validateForm == false) {
      return;
    }
    _formKey.currentState!.save();
    print(_enteredEmail);
    print(_enteredPassword);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = size.height - 52;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text('Login page'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 14,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: size.width * 0.9,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                start(),
                SizedBox(
                  height: height * 0.05,
                ),
                socialLogin(),
                SizedBox(
                  height: height * 0.05,
                ),
                divider(),
                SizedBox(
                  height: height * 0.05,
                ),
                form(height, context),
                SizedBox(
                  height: height * 0.05,
                ),
                buttons(height, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttons(double height, BuildContext context) {
    return SizedBox(
      // color: Colors.grey,
      height: height * 0.18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: onSaved,
            style: ElevatedButton.styleFrom(
              elevation: 5,
              backgroundColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              'Sign in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              'Register',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget form(double height, BuildContext context) {
    return SizedBox(
      // color: Colors.grey,
      height: height * 0.31,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              style: const TextStyle(fontSize: 16),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(249, 249, 249, 1.0),
                labelText: 'Email',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(158, 158, 158, 1.0),
                ),
                floatingLabelStyle: const TextStyle(
                  color: Color.fromRGBO(158, 158, 158, 1.0),
                  fontSize: 12,
                ),
                suffixIcon: const Icon(
                  Icons.mail_rounded,
                  color: Color.fromRGBO(194, 194, 194, 1.0),
                ),
                errorBorder: CustomOutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.error),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: CustomOutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (newValue) => _enteredEmail = newValue!,
              validator: (value) {
                if (value!.trim().isEmpty || !value.contains('@')) {
                  return 'invalid Email Address';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              style: const TextStyle(fontSize: 16),
              cursorColor: Colors.black,
              obscureText: !_isVisible,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(249, 249, 249, 1.0),
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(158, 158, 158, 1.0),
                ),
                floatingLabelStyle: const TextStyle(
                  color: Color.fromRGBO(158, 158, 158, 1.0),
                  fontSize: 12,
                ),
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    _isVisible = !_isVisible;
                  }),
                  icon: Icon(
                    _isVisible == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: const Color.fromRGBO(194, 194, 194, 1.0),
                  ),
                ),
                errorBorder: CustomOutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.error),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: CustomOutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              onSaved: (newValue) => _enteredPassword = newValue!,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.trim().isEmpty || value.length < 6) {
                  return 'Password is too short';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 11,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.primary,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            height: 1,
            color: Color.fromRGBO(217, 217, 217, 1.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'or sign in with',
            style: TextStyle(
              color: Color.fromRGBO(117, 117, 117, 1.0),
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            height: 1,
            color: Color.fromRGBO(217, 217, 217, 1.0),
          ),
        ),
      ],
    );
  }

  Widget socialLogin() {
    return Hero(
      tag: 'social_Login',
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

  Widget start() {
    return SizedBox(
      // color: Colors.grey,
      height: 111,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/svgs/Logo.svg',
            width: 44.86,
            height: 60,
          ),
          const Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'EasyPay, Paving the Way to Your Financial Future',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11,
              color: Color.fromRGBO(158, 158, 158, 1),
            ),
          ),
        ],
      ),
    );
  }
}
