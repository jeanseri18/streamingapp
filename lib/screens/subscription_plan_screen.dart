import 'package:flutter/material.dart';
import 'package:vimubox/widgets/back_widget.dart';
import 'package:vimubox/widgets/basic_widget.dart';
import 'package:vimubox/widgets/standard_widget.dart';
import 'package:vimubox/widgets/premium_widget.dart';
import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/screens/custom_plan_screen.dart';
import 'package:vimubox/screens/payment_method_screen.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  @override
  _SubscriptionPlanScreenState createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            BackWidget(name: Strings.subscriptionPlan.toUpperCase(),),
            bodyWidget(context)
          ],
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 70
      ),
      child: Column(
        children: [
          Divider(color: Colors.black, thickness: 6,),
          choosePlanWidget(context),
          SizedBox(height: Dimensions.heightSize * 2,),
          planWidget(context),
          continueButtonWidget(context)
        ],
      ),
    );
  }

  choosePlanWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.heightSize,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.chooseThePlan.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize,),
                    Text(
                      Strings.downgradeOrUpgradeAnytime,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: Dimensions.smallTextSize
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Text(
                    Strings.customYourPlan,
                    style: TextStyle(
                      color: CustomColor.accentColor,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomPlanScreen()));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  planWidget(BuildContext context) {
    int totalPages = 3;
    return Container(
      height:400,
      child: PageView.builder(
          itemCount: totalPages,
          itemBuilder: (context, index) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: Dimensions.buttonHeight,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: Dimensions.marginSize,
                          right: Dimensions.marginSize
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: Dimensions.buttonHeight,
                                decoration: BoxDecoration(
                                  color: index == 0 ? CustomColor.accentColor : CustomColor
                                      .greyColor.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
                                ),
                                child: Center(
                                  child: Text(
                                    Strings.basic.toUpperCase(),
                                    style: TextStyle(
                                        color: index == 0 ? Colors.black : Colors.white,
                                        fontSize: Dimensions.defaultTextSize,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: Dimensions.widthSize,),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: Dimensions.buttonHeight,
                                decoration: BoxDecoration(
                                    color: index == 1 ? CustomColor.accentColor : CustomColor
                                        .greyColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
                                ),
                                child: Center(
                                  child: Text(
                                    Strings.standard.toUpperCase(),
                                    style: TextStyle(
                                        color: index == 1 ? Colors.black : Colors.white,
                                        fontSize: Dimensions.defaultTextSize,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: Dimensions.widthSize,),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: Dimensions.buttonHeight,
                                decoration: BoxDecoration(
                                    color: index == 2 ? CustomColor.accentColor : CustomColor
                                        .greyColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
                                ),
                                child: Center(
                                  child: Text(
                                    Strings.premium.toUpperCase(),
                                    style: TextStyle(
                                        color: index == 2 ? Colors.black : Colors.white,
                                        fontSize: Dimensions.defaultTextSize,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize * 3,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: pageViewWidget(index),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  pageViewWidget(int i) {
    switch(i) {
      case 0 :
        return BasicWidget();
      case 1 :
        return StandardWidget();
      case 2 :
        return PremiumWidget();
    }
  }

  continueButtonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize * 2,
        right: Dimensions.marginSize * 2,
      ),
      child: GestureDetector(
        child: Container(
          height: Dimensions.buttonHeight,
          decoration: BoxDecoration(
              color: CustomColor.greyColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
          ),
          child: Center(
            child: Text(
              Strings.goToContinue.toUpperCase(),
              style: TextStyle(
                  color: CustomColor.accentColor,
                  fontSize: Dimensions.defaultTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentMethodScreen()));
        },
      ),
    );
  }
}
