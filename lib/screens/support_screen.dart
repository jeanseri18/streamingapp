import 'package:flutter/material.dart';

import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/widgets/back_widget.dart';

class SupportScreen extends StatefulWidget {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              BackWidget(name: Strings.support,),
              bodyWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, bottom: 100),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
              ),
              child: Text(
                Strings.weAreThereToHelp,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5)
                ),
              ),
            ),
            SizedBox(height: Dimensions.heightSize * 2,),
            contactNumberWidget('assets/images/messenger.png', Strings.clickHereForMessenger),
            SizedBox(height: Dimensions.heightSize * 2,),
            contactNumberWidget('assets/images/email.png', Strings.clickHereForMail),
            SizedBox(height: Dimensions.heightSize * 2,),
            contactNumberWidget('assets/images/support.png', Strings.customerCare),
            SizedBox(height: Dimensions.heightSize * 2,),
          ],
        ),
      ),
    );
  }

  contactNumberWidget(String image, String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Card(
        elevation: 2,
        color: Colors.grey.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.only(
            top: Dimensions.heightSize,
            bottom: Dimensions.heightSize,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  image
                )
              ),
              Expanded(
                flex: 4,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold,
                    color: CustomColor.secondaryColor
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
