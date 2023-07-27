import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/components/custom_text.dart';
import 'package:to_do_app/screens/auth/login.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/assets_constants.dart';
import 'package:to_do_app/utils/util_functions.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(
      const Duration(seconds: 3),
      () {
        UtilFunctions().navigateTo(context, const Login());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(child: Image.asset(AssetConstants.logo)),
            FadeInUp(
              child: const CustomText(
                text: "To simplify \nthe way to\nwork",
                textAlign: TextAlign.center,
                fontSize: 36,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
