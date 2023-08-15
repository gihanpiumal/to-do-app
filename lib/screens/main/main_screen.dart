import 'package:flutter/material.dart';
import 'package:to_do_app/components/custom_button.dart';
import 'package:to_do_app/components/custom_text.dart';

import '../../controllers/auth_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: CustomText(text: "HOME")),
          CustomButton(
              text: "Logout",
              onTap: () {
                AuthController().logout();
              })
        ],
      ),
    );
  }
}
