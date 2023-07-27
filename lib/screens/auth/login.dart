import 'package:flutter/material.dart';
import 'package:to_do_app/components/custom_text.dart';
import 'package:to_do_app/utils/app_colors.dart';
import 'package:to_do_app/utils/assets_constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 52,
              ),
              const CustomText(
                text: "Login",
                textAlign: TextAlign.center,
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                AssetConstants.logo,
                width: 400,
                height: 300,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
