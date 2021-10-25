import 'package:flutter/material.dart';
import 'package:vimubox/screens/auth/otp/otp_confirmation.dart';
import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/dialog/success_dialog.dart';
import 'package:vimubox/widgets/bg_image_widget.dart';
import 'package:vimubox/screens/dashboard_screen.dart';

class EmailVerificationScreen extends StatefulWidget {

  final String emailAddress;

  const EmailVerificationScreen({Key key, this.emailAddress}) : super(key: key);

  @override
  _EmailVerificationScreenState createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  TextEditingController emailController = TextEditingController();
  String _emailAddress;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailAddress = widget.emailAddress;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BgImageWidget(),
            OtpConfirmation(
              emailAddress: _emailAddress,
              otpLength: 4,
              validateOtp: validateOtp,
              routeCallback: moveToNextScreen,
              titleColor: CustomColor.secondaryColor,
              themeColor: CustomColor.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "1234") {
      moveToNextScreen(context);
      return "OTP is Successfully Verified";
    } else {
      return "The entered Otp is wrong";
    }
  }

  // action to be performed after OTP validation is success
  void moveToNextScreen(context) {
    showSuccessDialog(context);
    print('open dialog');
  }

    Future<bool> showSuccessDialog(BuildContext context) async {
      return (await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => SuccessDialog(
          title: Strings.success,
          subTitle: Strings.nowCheckYourEmail,
          buttonName: Strings.ok,
          moved: DashboardScreen(),
        ),
      )) ?? false;
    }

}
