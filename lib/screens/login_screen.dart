import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _getImageContainer(),
              _getContainerBox(),
            ],
          )),
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      top: 80,
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        children: [
          const Expanded(
            child: Image(
              image: AssetImage('assets/images/rocket.png'),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget _getContainerBox() {
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: CustomColor.scaffoldBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 32,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Sign in to ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/images/mood.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: negahban1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      labelText: '  Email  ',
                      labelStyle: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 20,
                        color: negahban1.hasFocus
                            ? CustomColor.red1
                            : Colors.white,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffC5C5C5),
                          width: 3.0,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: CustomColor.red1,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: negahban2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      labelText: '  Password  ',
                      labelStyle: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 20,
                        color: negahban2.hasFocus
                            ? CustomColor.red1
                            : Colors.white,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide:
                            BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide:
                            BorderSide(color: CustomColor.red1, width: 3.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {},
                  child: const Text('Sign in'),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? / ",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontFamily: 'GB'),
                    ),
                    const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'GB',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    negahban1.dispose();
    negahban2.dispose();
    super.dispose();
  }
}
