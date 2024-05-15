import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _getWholeScrollingPart(),
          Container(
            height: 83,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: CustomColor.scaffoldBg2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 10, left: 18, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Draft',
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomColor.red1,
                        fontFamily: 'GB'),
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                        fontSize: 16, color: Colors.white, fontFamily: 'GB'),
                  ),
                  Text(
                    'Take',
                    style: TextStyle(
                        fontSize: 16, color: Colors.white, fontFamily: 'GB'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getWholeScrollingPart() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getHeaderSection(),
        ),
        SliverToBoxAdapter(
          child: _getSelectedImageContainer(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/item$index.png'),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 83),
        ),
      ],
    );
  }

  Widget _getSelectedImageContainer() {
    return Container(
      height: 394,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        child: FittedBox(
            fit: BoxFit.cover, child: Image.asset('assets/images/item8.png')),
      ),
    );
  }

  Widget _getHeaderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 18),
      child: Row(
        children: [
          const Text(
            'Post',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'GB',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset('assets/images/icon_arrow_down.png'),
          const Spacer(),
          const Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'GB',
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Image.asset('assets/images/icon_arrow_right_box.png'),
        ],
      ),
    );
  }
}
