import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/custom_text.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/assets_constants.dart';

class CompleteGrid extends StatelessWidget {
  const CompleteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 15,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 5,
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
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: AppColors.kWhite, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "2022-11-09",
                fontSize: 15,
                color: AppColors.kAsh,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Task Title ....",
                fontSize: 24,
                color: AppColors.kAsh,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AssetConstants.viewIcon),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(AssetConstants.deleteIcon),
            ],
          ),
        ],
      ),
    );
  }
}
