import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/custom_text.dart';
import 'package:to_do_app/providers/auth/user_provider.dart';
import 'package:to_do_app/screens/main/home/widgets/todo_grid.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/assets_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kBlue,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: size.width,
          child: Consumer<UserProvider>(
            builder: (context, value, child) {
              return value.isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(AssetConstants.avatarIcon),
                                CustomText(
                                  text: "Hi ${value.userModel.name} !",
                                  color: AppColors.kAsh,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            SvgPicture.asset(AssetConstants.addIcon),
                          ],
                        ),
                        const SizedBox(
                          height: 37,
                        ),
                        const CustomText(
                          text: "Tasks for today",
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                        const CustomText(
                          text: "5 available",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kAsh,
                        ),
                        const ToDoGrid()
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
