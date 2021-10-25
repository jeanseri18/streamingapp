import 'package:flutter/material.dart';
import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/utils/custom_style.dart';
import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/widgets/back_widget.dart';
import 'package:vimubox/screens/payment_method_screen.dart';


class CustomPlanScreen extends StatefulWidget {
  @override
  _CustomPlanScreenState createState() => _CustomPlanScreenState();
}

enum SingingCharacter { a, b, c, d}
enum SingingCharacter2 { a, b, c}
enum SingingCharacter3 { a, b}

class _CustomPlanScreenState extends State<CustomPlanScreen> {

  SingingCharacter _character = SingingCharacter.a;
  SingingCharacter2 _character2 = SingingCharacter2.a;
  SingingCharacter3 _character3 = SingingCharacter3.a;

  List durationList = ['07', '15', '30', '365'];
  List qualityList = ['Good', 'Better', 'Best'];
  List cancelList = ['Yes', 'No'];

  List<String> screenList = ['03', '10', '20'];
  String selectedScreen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedScreen = screenList[0];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            BackWidget(name: Strings.customPlan.toUpperCase(),),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.black, thickness: 6,),
          SizedBox(height: Dimensions.heightSize * 2,),
          durationWidget(context),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              top: Dimensions.heightSize * 2,
              bottom: Dimensions.heightSize * 2,
            ),
            child: Divider(color: Colors.grey,),
          ),
          qualityWidget(context),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              top: Dimensions.heightSize * 2,
              bottom: Dimensions.heightSize * 2,
            ),
            child: Divider(color: Colors.grey,),
          ),
          deviceScreensWidget(context),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              top: Dimensions.heightSize * 2,
              bottom: Dimensions.heightSize * 2,
            ),
            child: Divider(color: Colors.grey,),
          ),
          cancelAtAnyTimeWidget(context),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              top: Dimensions.heightSize * 2,
              bottom: Dimensions.heightSize * 2,
            ),
            child: Divider(color: Colors.grey,),
          ),
          continueButtonWidget(context)
        ],
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
            Strings.duration.toUpperCase(),
            style: TextStyle(
                fontSize: Dimensions.largeTextSize,
                color: Colors.white
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Theme(
            data: ThemeData.dark(),
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Radio(
                    value: SingingCharacter.a,
                    toggleable: true,
                    autofocus: true,
                    groupValue: _character,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        //index = 0;
                      });
                    },
                  ),
                  Text(
                    '${durationList[0]} days',
                    style: CustomStyle.textStyle,
                  ),
                  Radio(
                    value: SingingCharacter.b,
                    toggleable: true,
                    autofocus: true,
                    groupValue: _character,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        //index = 0;
                      });
                    },
                  ),
                  Text(
                    '${durationList[1]} days',
                    style: CustomStyle.textStyle,
                  ),
                  Radio(
                    value: SingingCharacter.c,
                    toggleable: true,
                    autofocus: true,
                    groupValue: _character,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        //index = 0;
                      });
                    },
                  ),
                  Text(
                    '${durationList[2]} days',
                    style: CustomStyle.textStyle,
                  ),
                  Radio(
                    value: SingingCharacter.d,
                    toggleable: true,
                    autofocus: true,
                    groupValue: _character,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        //index = 0;
                      });
                    },
                  ),
                  Text(
                    '${durationList[3]} days',
                    style: CustomStyle.textStyle,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  qualityWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.videoQuality.toUpperCase(),
            style: TextStyle(
                fontSize: Dimensions.largeTextSize,
                color: Colors.white
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Theme(
            data: ThemeData.dark(),
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Radio(
                    value: SingingCharacter2.a,
                    toggleable: true,
                    autofocus: true,
                    groupValue: _character2,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter2 value) {
                      setState(() {
                        _character2 = value;
                        //index = 0;
                      });
                    },
                  ),
                  Text(
                    qualityList[0],
                    style: CustomStyle.textStyle,
                  ),
                  Radio(
                    value: SingingCharacter2.b,
                    toggleable: true,
                    autofocus: true,
                    groupValue: _character2,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter2 value) {
                      setState(() {
                        _character2 = value;
                        //index = 0;
                      });
                    },
                  ),
                  Text(
                    qualityList[1],
                    style: CustomStyle.textStyle,
                  ),
                  Radio(
                    value: SingingCharacter2.c,
                    toggleable: true,
                    autofocus: true,
                    groupValue: _character2,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter2 value) {
                      setState(() {
                        _character2 = value;
                        //index = 0;
                      });
                    },
                  ),
                  Text(
                    qualityList[2],
                    style: CustomStyle.textStyle,
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  deviceScreensWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.devices.toUpperCase(),
            style: TextStyle(
                fontSize: Dimensions.largeTextSize,
                color: Colors.white
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  Strings.screenYouCanWatch,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.white.withOpacity(0.5)
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 50.0,
                    width: 80.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: Dimensions.marginSize * 0.5, right: Dimensions
                          .marginSize * 0.5),
                      child: DropdownButton(
                        dropdownColor: CustomColor.primaryColor,
                        isExpanded: true,
                        underline: Container(),
                        hint: Text(
                          selectedScreen,
                          style: CustomStyle.textStyle,
                        ), // Not necessary for Option 1
                        value: selectedScreen,
                        onChanged: (newValue) {
                          setState(() {
                            selectedScreen = newValue;
                          });
                        },
                        items: screenList.map((value) {
                          return DropdownMenuItem(
                            child: new Text(
                              value,
                              style: CustomStyle.textStyle,
                            ),
                            value: value,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  cancelAtAnyTimeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.videoQuality.toUpperCase(),
            style: TextStyle(
                fontSize: Dimensions.largeTextSize,
                color: Colors.white
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Theme(
            data: ThemeData.dark(),
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Radio(
                    value: SingingCharacter3.a,
                    toggleable: true,
                    autofocus: true,
                    groupValue: _character3,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter3 value) {
                      setState(() {
                        _character3 = value;
                        //index = 0;
                      });
                    },
                  ),
                  Text(
                    cancelList[0],
                    style: CustomStyle.textStyle,
                  ),
                  Radio(
                    value: SingingCharacter3.b,
                    toggleable: true,
                    autofocus: true,
                    groupValue: _character3,
                    activeColor: CustomColor.accentColor,
                    onChanged: (SingingCharacter3 value) {
                      setState(() {
                        _character3 = value;
                        //index = 0;
                      });
                    },
                  ),
                  Text(
                    cancelList[1],
                    style: CustomStyle.textStyle,
                  ),
                ],
              ),
            ),
          )
        ],
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentMethodScreen()));
        },
      ),
    );
  }

}
