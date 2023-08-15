import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:to_do_app/controllers/auth_controller.dart';

import '../../utils/alert_helper.dart';

class SignupProvider extends ChangeNotifier {
  // ---- email controller
  final _emailController = TextEditingController();
  // ---- get email controller
  TextEditingController get emailController => _emailController;

  // ---- password controller
  final _passwordController = TextEditingController();
  // ---- get email controller
  TextEditingController get passwordController => _passwordController;

  // ---- name controller
  final _nameController = TextEditingController();
  // ---- get email controller
  TextEditingController get nameController => _nameController;

  // ---- loader state
  bool _isLoading = false;
  // ---- get loading state
  bool get isLoading => _isLoading;

  // ---- chnage loading state
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // ---- validate text field functions
  bool validationFields(BuildContext context) {
    if (_emailController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      /// show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please fill all the fields!");
      return false;
    } else if (!_emailController.text.contains("@")) {
      /// show error dialog
      AlertHelper.showAlert(
          context, DialogType.ERROR, "ERROR", "Please enter a valid email!");
      return false;
    } else if (_passwordController.text.length < 6) {
      /// show error dialog
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR",
          "Password must contain at least 6 characters!");
      return false;
    } else {
      return true;
    }
  }

  // ---- start signup prosess
  Future<void> startSignUp(BuildContext context) async {
    try {
      if (validationFields(context)) {
        /// start the loader
        setLoading(true);

        await AuthController().registerUser(
          context,
          _emailController.text,
          _passwordController.text,
          _nameController.text,
        );

        /// clear text fields
        _emailController.clear();
        _nameController.clear();
        _passwordController.clear();

        /// stop the loader
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      Logger().e(e);
      AlertHelper.showAlert(context, DialogType.ERROR, "ERROR", e.toString());
    }
  }
}
