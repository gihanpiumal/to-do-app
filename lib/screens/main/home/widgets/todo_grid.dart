import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/custom_text.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/assets_constants.dart';

class ToDoGrid extends StatelessWidget {
  const ToDoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.25,
          mainAxisSpacing: 44,
          crossAxisSpacing: 19,
        ),
        itemBuilder: (context, i) {
          return const TiDiTile();
        },
      ),
    );
  }
}

class TiDiTile extends StatelessWidget {
  const TiDiTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.kWhite, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    text: "2022-11-09",
                    fontSize: 15,
                    color: AppColors.kAsh,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "Task Title",
                  fontSize: 24,
                  color: AppColors.kAsh,
                ),
                SizedBox(
                  height: 12,
                ),
                CustomText(
                  text:
                      "It is a long established fact that a reader will be distracted by the readablecontent of a page when looking at its layout...",
                  fontSize: 16,
                  color: AppColors.kAsh,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: const BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AssetConstants.checkIcon),
                  SvgPicture.asset(AssetConstants.editIcon),
                  SvgPicture.asset(AssetConstants.deleteIcon),
                  SvgPicture.asset(AssetConstants.viewIcon),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
