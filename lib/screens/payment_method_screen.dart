import 'package:flutter/material.dart';
import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/utils/custom_style.dart';
import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/widgets/back_widget.dart';
import 'package:vimubox/widgets/data_widget.dart';
import 'package:vimubox/dialog/success_dialog.dart';
import 'package:vimubox/bottomsheet/add_card_bottomsheet.dart';
import 'package:vimubox/screens/dashboard_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

enum SingingCharacter {card1, card2, card3, card4}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {

  SingingCharacter _character = SingingCharacter.card1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            BackWidget(name: Strings.paymentMethod.toUpperCase(),),
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.black, thickness: 6,),
            SizedBox(height: Dimensions.heightSize * 2,),
            durationWidget(context),
            paymentMethodWidget(context),
            SizedBox(height: Dimensions.heightSize * 2,),
            continueButtonWidget(context)
          ],
        ),
      ),
    );
  }

  durationWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.chooseYourPaymentMethod.toUpperCase(),
            style: TextStyle(
                fontSize: Dimensions.largeTextSize,
                color: Colors.white
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 3,),
          DataWidget(name: Strings.timeDuration, value: '15 days',),
          divider(),
          DataWidget(name: Strings.videoQuality, value: 'Best',),
          divider(),
          DataWidget(name: Strings.devices, value: '20',),
          divider(),
          DataWidget(name: Strings.cancelAtAnyTime, value: 'Yes',),
          divider(),
        ],
      ),
    );
  }

  divider(){
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.heightSize,
        bottom: Dimensions.heightSize,
      ),
      child: Divider(color: Colors.grey,),
    );
  }

  paymentMethodWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.heightSize,
      ),
      child: Theme(
        data: ThemeData.dark(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Radio(
                    value: SingingCharacter.card1,
                    toggleable : true,
                    autofocus : true,
                    groupValue: _character,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        print('value: '+_character.toString());
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.mastercard.toUpperCase(),
                        style: CustomStyle.textStyle,
                      ),
                      SizedBox(height: Dimensions.heightSize * 0.5,),
                      Text(
                        Strings.payFromMastercard,
                        style: TextStyle(
                            fontSize: Dimensions.smallTextSize,
                          color: Colors.white.withOpacity(0.7)
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/card/mastercard.png',
                      height: 30,
                    )
                )
              ],
            ),
            Divider(color: Colors.grey,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Radio(
                    value: SingingCharacter.card2,
                    toggleable : true,
                    autofocus : true,
                    groupValue: _character,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        print('value: '+_character.toString());
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.discover,
                        style: CustomStyle.textStyle,
                      ),
                      SizedBox(height: Dimensions.heightSize * 0.5,),
                      Text(
                        Strings.payFromMastercard,
                        style: TextStyle(
                            fontSize: Dimensions.smallTextSize,
                            color: Colors.white.withOpacity(0.7)
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/card/discover.png',
                      height: 30,
                    )
                )
              ],
            ),
            Divider(color: Colors.grey,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Radio(
                    value: SingingCharacter.card3,
                    toggleable : true,
                    autofocus : true,
                    groupValue: _character,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        print('value: '+_character.toString());
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.visaCard,
                        style: CustomStyle.textStyle,
                      ),
                      SizedBox(height: Dimensions.heightSize * 0.5,),
                      Text(
                        Strings.payFromMastercard,
                        style: TextStyle(
                            fontSize: Dimensions.smallTextSize,
                            color: Colors.white.withOpacity(0.7)
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/card/visa.png',
                      height: 30,
                    )
                )
              ],
            ),
            Divider(color: Colors.grey,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Radio(
                    value: SingingCharacter.card4,
                    toggleable : true,
                    autofocus : true,
                    groupValue: _character,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        print('value: '+_character.toString());
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.payPal,
                        style: CustomStyle.textStyle,
                      ),
                      SizedBox(height: Dimensions.heightSize * 0.5,),
                      Text(
                        Strings.payFromMastercard,
                        style: TextStyle(
                            fontSize: Dimensions.smallTextSize,
                            color: Colors.white.withOpacity(0.7)
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/card/paypal.png',
                      height: 30,
                    )
                )
              ],
            ),
            Divider(color: Colors.grey,),
          ],
        ),
      ),
    );
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
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (builder) {
                return AddCardBottomSheet();
              });
        },
      ),
    );
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
