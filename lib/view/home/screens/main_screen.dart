import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lilac/core/common/app_image.dart';
import 'package:lilac/core/theme/app_color.dart';
import 'package:lilac/view/home/screens/home_screen.dart';
import 'package:lilac/view/requirement/screen/requirement_screen.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  @override
  void initState() {
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          Image.asset(
            AppImage.notificationImage,
            scale: 1.3,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: HomeScreen(),
      bottomNavigationBar: MotionTabBar(
        controller:
            _motionTabBarController, // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: "home",
        labels: const ["home", "message", "sell", "requirement", "profile"],
        icons: const [
          Icons.home,
          Icons.message,
          Icons.attach_money_rounded,
          Icons.request_page_outlined,
          Icons.person,
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: AppColor.brownColor,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: AppColor.brownColor,
        tabIconSelectedColor: Colors.white,
        tabBarColor: AppColor.bgColor,
        onTabItemSelected: (int value) {
          if (value == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return RequirementScreen();
              },
            ));
            _motionTabBarController!.index = 0;
          }
          setState(() {
            // _tabController!.index = value;
            // _motionTabBarController!.index = value;
          });
        },
      ),
    ));
  }
}
