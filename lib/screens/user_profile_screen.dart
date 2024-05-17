import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/constants/colors.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.scaffoldBg,
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverAppBar(
                  toolbarHeight: 80,
                  actions: const [
                    Padding(
                      padding: EdgeInsets.only(right: 18, top: 18),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(10),
                    child: Container(
                      height: 14,
                      decoration: const BoxDecoration(
                        color: CustomColor.scaffoldBg,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  expandedHeight: 170,
                  backgroundColor: CustomColor.scaffoldBg,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'assets/images/item1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _getHeaderProfile(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: TabBarViewDelegate(
                    TabBar(
                      dividerHeight: 0,
                      indicatorWeight: 2,
                      indicatorColor: CustomColor.red1,
                      indicatorPadding: const EdgeInsets.only(bottom: 0),
                      tabs: [
                        Tab(
                          icon: Image.asset('assets/images/icon_tab_posts.png'),
                        ),
                        Tab(
                          icon: Image.asset(
                              'assets/images/icon_tab_bookmark.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 20),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.asset(
                                        'assets/images/item$index.png')),
                              ),
                            );
                          },
                          childCount: 10,
                        ),
                        gridDelegate: SliverQuiltedGridDelegate(
                            crossAxisCount: 3,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3,
                            repeatPattern: QuiltedGridRepeatPattern.inverted,
                            pattern: [
                              const QuiltedGridTile(1, 1),
                              const QuiltedGridTile(1, 1),
                              const QuiltedGridTile(1, 1),
                            ]),
                      ),
                    ),
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 20),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.asset(
                                        'assets/images/item$index.png')),
                              ),
                            );
                          },
                          childCount: 10,
                        ),
                        gridDelegate: SliverQuiltedGridDelegate(
                            crossAxisCount: 3,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3,
                            repeatPattern: QuiltedGridRepeatPattern.inverted,
                            pattern: [
                              const QuiltedGridTile(1, 1),
                              const QuiltedGridTile(1, 1),
                              const QuiltedGridTile(1, 1),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Padding _getHeaderProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: CustomColor.red1),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              child: Image.asset(
                'assets/images/my_pf.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          const SizedBox(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'علیرضاسیف',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'SM', fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Alireza Seif',
                    style: TextStyle(
                        color: Color(0xffC5C5C5),
                        fontFamily: 'GB',
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Image.asset('assets/images/icon_profile_edit.png')
        ],
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);

  TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: CustomColor.scaffoldBg,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
