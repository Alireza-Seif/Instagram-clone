import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/model/enums/activity_tupe_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: CustomColor.scaffoldBg,
              height: 70,
              child: TabBar(
                dividerHeight: 0,
                controller: _tabController,
                labelStyle: const TextStyle(fontSize: 20, fontFamily: 'GB'),
                indicatorWeight: 4,
                indicatorColor: CustomColor.red1,
                tabs: const [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomScrollView _getSampleList() {
    return CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 20),
                        child: Text(
                          'New',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'GB',
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(ActivityStatus.following);
                      }, childCount: 2),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 20),
                        child: Text(
                          'Today',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'GB',
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(ActivityStatus.followBack);
                      }, childCount: 4),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 20),
                        child: Text(
                          'This Week',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'GB',
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(ActivityStatus.lkies);
                      }, childCount: 5),
                    ),
                  ],
                );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: const BoxDecoration(
              color: CustomColor.red1,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 7),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/images/my_pf.png')),
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Alireza Seif',
                    style: TextStyle(
                        fontSize: 12, fontFamily: 'GB', color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Started Following',
                    style: TextStyle(
                        fontSize: 12, fontFamily: 'GM', color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style: TextStyle(
                        fontSize: 12, fontFamily: 'GM', color: Colors.grey),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '3m',
                    style: TextStyle(
                        fontSize: 12, fontFamily: 'GB', color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          _getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(
              0xffF35383,
            ),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: const TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: () {},
          child: const Text('Follow'),
        );
      case ActivityStatus.lkies:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/item1.png')),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xffC5C5C5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            side: const BorderSide(
              color: Color(0xffC5C5C5),
              width: 2,
            ),
          ),
          child: const Text(
            'Message',
            style: TextStyle(fontSize: 12, fontFamily: 'GB'),
          ),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xffC5C5C5),
            side: const BorderSide(
              color: Color(0xffC5C5C5),
              width: 2,
            ),
          ),
          child: const Text(
            'Message',
            style: TextStyle(fontSize: 12, fontFamily: 'GB'),
          ),
        );
    }
  }
}
