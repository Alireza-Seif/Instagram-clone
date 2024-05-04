import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1F2E),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1C1F2E),
        title: SizedBox(
            width: 128,
            height: 24,
            child: Image.asset('assets/images/moodinger_logo.png')),
        actions: [
          Container(
            height: 24,
            width: 24,
            margin: const EdgeInsets.only(right: 18),
            child: Image.asset('assets/images/icon_direct.png'),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              _getStoryBox(),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alireza Seif',
                      style: TextStyle(
                          fontFamily: 'GB', color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      'برنامه نویس موبایل',
                      style: TextStyle(fontFamily: 'SM', color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
        )),
      ),
    );
  }

  DottedBorder _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.Circle,
      radius: const Radius.circular(17),
      color: const Color(0xffF35383),
      strokeWidth: 2,
      dashPattern: const [180, 5],
      padding: const EdgeInsets.all(4),
      child: const ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: CircleAvatar(
            radius: 19, foregroundImage: AssetImage('assets/images/my_pf.png')),
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
      width: 64,
      height: 64,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xff1C1F2E),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset('assets/images/icon_plus.png'),
      ),
    );
  }
}
