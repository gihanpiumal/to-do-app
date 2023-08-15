import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/screens/main/completed/completed_screen.dart';
import 'package:to_do_app/screens/main/history/history_screen.dart';
import 'package:to_do_app/screens/main/home/home_screen.dart';
import 'package:to_do_app/screens/main/profile/profile_screen.dart';

import '../../utils/app_colors.dart';
import '../../utils/assets_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _screens.addAll({
      const HomeScreen(),
      const CompletedScreen(),
      const HistoryScreen(),
      const ProfileScreen()
    });
  }

  ///list to store botom navigation screen
  final List<Widget> _screens = [];

  /// store the active index
  int activeIndex = 0;

  /// ontap function
  void onTapped(int item) {
    setState(() {
      activeIndex = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlue,
      body: _screens[activeIndex],
      bottomNavigationBar: SizedBox(
        height: 83,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                child: SvgPicture.asset(
                  AssetConstants.homeIcon,
                  color: activeIndex == 0
                      ? AppColors.primaryColor
                      : AppColors.kBlack,
                ),
                onTap: () => onTapped(0)),
            InkWell(
                child: SvgPicture.asset(
                  AssetConstants.completedIcon,
                  color: activeIndex == 1
                      ? AppColors.primaryColor
                      : AppColors.kBlack,
                ),
                onTap: () => onTapped(1)),
            InkWell(
                child: SvgPicture.asset(
                  AssetConstants.historyIcon,
                  color: activeIndex == 2
                      ? AppColors.primaryColor
                      : AppColors.kBlack,
                ),
                onTap: () => onTapped(2)),
            InkWell(
                child: SvgPicture.asset(
                  AssetConstants.profileIcon,
                  color: activeIndex == 3
                      ? AppColors.primaryColor
                      : AppColors.kBlack,
                ),
                onTap: () => onTapped(3)),
          ],
        ),
      ),
    );
  }
}
