import 'package:calley/core/contents/images/images.dart';
import 'package:calley/core/style/color_manager.dart';
import 'package:calley/feature/home/presentation/screen/body.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/font_style_app.dart';
import '../widget/menu_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Home')),
    Center(child: Text('profile')),
    Center(child: Text('Play')),
    Center(child: Text('Call')),
    Center(child: Text('Calendar')),
  ];

  static const List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.rocket, 'title': 'Getting Started'},
    {'icon': Icons.sync, 'title': 'Sync Data'},
    {'icon': Icons.games, 'title': 'Gamification'},
    {'icon': Icons.call, 'title': 'Send Logs'},
    {'icon': Icons.settings, 'title': 'Settings'},
    {'icon': Icons.help, 'title': 'Help?'},
    {'icon': Icons.cancel, 'title': 'Cancel Subscription'},
    {'icon': Icons.info, 'title': 'About Us', 'isAppInfo': true},
    {'icon': Icons.policy, 'title': 'Privacy Policy', 'isAppInfo': true},
    {'icon': Icons.build, 'title': 'Version 1.01.52', 'isAppInfo': true},
    {'icon': Icons.share, 'title': 'Share App', 'isAppInfo': true},
    {'icon': Icons.exit_to_app, 'title': 'Logout', 'isAppInfo': true},
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: ColorManager.primary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      Image.asset(Images.profile, height: 50, width: 50),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Swati",
                                  style: TextStyle(
                                    color: ColorManager.background,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: " . ",
                                  style: TextStyle(
                                    color: ColorManager.warning,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "Calley",
                                  style: TextStyle(
                                    color: ColorManager.warning.withAlpha(250),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "swati@cstech.in",
                            style: FontStyleApp.semiBoldStyle.copyWith(
                              color: ColorManager.background.withAlpha(
                                255 * 70 ~/ 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ...List.generate(HomeScreen.menuItems.length, (index) {
                final item = HomeScreen.menuItems[index];
                return MenuItem(
                  icon: item['icon'],
                  title: item['title'],
                  onTap: () {
                    Navigator.pop(context);
                  },
                  isAppInfo: item['isAppInfo'] ?? false,
                );
              }),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        title: Text('Dashboard', style: FontStyleApp.semiBoldStyle),
        actionsPadding: EdgeInsets.zero,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.support_agent_sharp)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active_outlined),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45),
        child: Body(),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: ColorManager.primary, width: 1.5),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: ColorManager.background,
          items: List.generate(5, (index) {
            final icons = [
              Icons.home,
              Icons.co_present_rounded,
              Icons.play_arrow,
              Icons.phone,
              Icons.calendar_today,
            ];

            return BottomNavigationBarItem(
              icon:
                  _selectedIndex == index
                      ? Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(icons[index], color: Colors.white),
                      )
                      : Icon(
                        icons[index],
                        color: Colors.black, // أو Colors.grey لو عايز هادي أكتر
                      ),
              label: '',
            );
          }),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
