import 'dart:ui';
import 'package:flutter/cupertino.dart';
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
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0 ? _getAddStoryBox() : _getStoryListBox();
                },
              ),
            ),
           _getPostList(),
          ],
        ),
      )),
    );
  }

  ListView _getPostList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: 34),
            _getHeaderPost(),
            const SizedBox(height: 24),
            _getPostContent(),
          ],
        );
      },
    );
  }

  Widget _getPostContent() {
    return SizedBox(
      height: 440,
      width: 394,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/post_cover.png',
              ),
            ),
          ),
          const Positioned(
            top: 15,
            right: 15,
            child: Icon(
              Icons.smart_display,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 15,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  width: 340,
                  height: 46,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      Row(
                        children: [
                          Image.asset('assets/images/icon_hart.png'),
                          const SizedBox(width: 6),
                          const Text(
                            '2.5 k',
                            style: TextStyle(
                                fontFamily: 'GB',
                                fontSize: 14,
                                color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(width: 42),
                      Row(
                        children: [
                          Image.asset('assets/images/icon_comments.png'),
                          const SizedBox(width: 6),
                          const Text(
                            '1.5 k',
                            style: TextStyle(
                                fontFamily: 'GB',
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          const SizedBox(width: 42),
                          Image.asset('assets/images/icon_share.png'),
                          const SizedBox(width: 42),
                          Image.asset('assets/images/icon_save.png'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _getHeaderPost() {
    return Padding(
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
    );
  }

  Widget _getStoryBox(){
    return  DottedBorder(
            borderType: BorderType.Circle,
            radius: const Radius.circular(17),
            color: const Color(0xffF35383),
            strokeWidth: 2,
            dashPattern: const [40, 10],
            padding: const EdgeInsets.all(4),
            child: const ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: CircleAvatar(
                radius: 16,
                foregroundImage: AssetImage('assets/images/my_pf.png'),
              ),
            ),
          );
  }

  Widget _getStoryListBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.Circle,
            radius: const Radius.circular(17),
            color: const Color(0xffF35383),
            strokeWidth: 2,
            dashPattern: const [40, 10],
            padding: const EdgeInsets.all(4),
            child: const ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: CircleAvatar(
                radius: 28,
                foregroundImage: AssetImage('assets/images/my_pf.png'),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'a',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
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
          ),
          const SizedBox(height: 10),
          const Text(
            'Your Story',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
