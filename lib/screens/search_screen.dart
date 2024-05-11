import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 46,
              margin: const EdgeInsets.only(left: 18, right: 18, top: 12),
              decoration: const BoxDecoration(
                color: Color(0xff272B40),
                borderRadius: BorderRadius.all(
                  Radius.circular(13),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Image.asset('assets/images/icon_search.png'),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search User',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Image.asset('assets/images/icon_scan.png'),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ),
            _categoryList(),
          ],
        ),
      ),
    );
  }

  Widget _categoryList() {
    return Container(
      height: 23,
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
              color: Color(0xff272B40),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  child: Text(
                    'Alireza $index',
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'GM',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
