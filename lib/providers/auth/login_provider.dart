import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/utils/alert_helper.dart';

class LoginProvider extends ChangeNotifier {
  // ---- email controller
  final _emailController = TextEditingController();
  // ---- get email controller
  TextEditingController get emailController => _emailController;

  // ---- password controller
  final _passwordController = TextEditingController();
  // ---- get email controller
  TextEditingController get passwordController => _passwordController;

  // ---- loader state
  bool _isLoading = false;
  // ---- get loading state
  bool get isLoading => _isLoading;

  // ---- change loading state
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // ---- validate text field functions
  bool validationFields(BuildContext context) {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
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

// ---- start login prosesss
  Future<void> startLogin(BuildContext context) async {
    try {
      if (validationFields(context)) {
        /// start the Loader
        setLoading(true);
        // await AuthController().si
      }
    } catch (e) {}
  }
}
