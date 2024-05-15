import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key, this.controller});
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
        child: Container(
          color: const Color.fromRGBO(255, 255, 255, 0.09),
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: _getContent(),
        ),
      ),
    );
  }

  Widget _getContent() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 67,
                    margin: const EdgeInsets.only(top: 10, bottom: 22),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Share',
                        style: TextStyle(
                          fontFamily: 'GB',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset('assets/images/icon_share_bottomsheet.png'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Container(
                    height: 46,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.4),
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
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _getItemGrid();
                },
                childCount: 100,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                mainAxisExtent: 110,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(top: 120),
            ),
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 13),
              child: Text(
                'Share',
                style: TextStyle(fontFamily: 'GB', fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image.asset('assets/images/my_pf.png'),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Alireza Seif',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'GB',
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
