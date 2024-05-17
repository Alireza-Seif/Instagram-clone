import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/screens/activity_screen.dart';
import 'package:instagram_clone/screens/add_content_screen.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';
import 'package:instagram_clone/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: CustomColor.scaffoldBg,
            currentIndex: _selectedBottomNavigationItem,
            onTap: (int index) {
              setState(() {
                _selectedBottomNavigationItem = index;
              });
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_home.png'),
                activeIcon: Image.asset('assets/images/icon_active_home.png'),
                label: '1',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_search_navigation.png'),
                activeIcon: Image.asset(
                    'assets/images/icon_search_navigation_active.png'),
                label: '2',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_add_navigation.png'),
                activeIcon:
                    Image.asset('assets/images/icon_add_navigation_active.png'),
                label: '3',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_activity_navigation.png'),
                activeIcon: Image.asset(
                    'assets/images/icon_activity_navigation_active.png'),
                label: '4',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2, color: const Color(0xffC5C5C5)),
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
                activeIcon: Container(
                  width: 30,
                  height: 30,
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
                label: '4',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: _getLayout(),
      ),
    );
  }

  List<Widget> _getLayout() {
    return <Widget>[
      const HomeScreen(),
      const SearchScreen(),
      const AddContentScreen(),
      const ActivityScreen(),
      const UserProfileScreen()
    ];
  }
}
