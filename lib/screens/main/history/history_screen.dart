import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_text.dart';
import '../../../providers/auth/user_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/assets_constants.dart';
import '../completed/widgets/complete_grid.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
                            SvgPicture.asset(AssetConstants.bellIcon),
                          ],
                        ),
                        const SizedBox(
                          height: 37,
                        ),
                        const CustomText(
                          text: "Task History",
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                        const CustomText(
                          text: "100 available",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kAsh,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                            width: 250,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  text: "Filter by date",
                                  color: AppColors.kWhite,
                                  fontSize: 24,
                                ),
                                SvgPicture.asset(AssetConstants.filterIcon),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const CompleteGrid()
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
