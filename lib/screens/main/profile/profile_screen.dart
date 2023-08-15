import 'package:flutter/material.dart';

import '../../../components/custom_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CustomText(
          text: "Profile Screen",
          fontSize: 20,
        ),
      ),
    );
  }
}
