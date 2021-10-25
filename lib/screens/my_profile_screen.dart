import 'package:flutter/material.dart';

import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/widgets/back_widget.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {

  File _image;

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
              BackWidget(name: Strings.myProfile,),
              bodyWidget(context),
              updateProfileWidget(context)
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
            addImageWidget(context),
            SizedBox(height: Dimensions.heightSize * 2,),
            contactNumberWidget(context),
            SizedBox(height: Dimensions.heightSize * 2,),
            emailAddressWidget(context),
            SizedBox(height: Dimensions.heightSize * 2,),
            addressWidget(context),
          ],
        ),
      ),
    );
  }

  addImageWidget(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                borderRadius: BorderRadius.circular(75.0),
              ),
              child: _image == null ? Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover
              ) : Image.file(
                _image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 20,
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    color: CustomColor.accentColor,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: IconButton(
                  onPressed: (){
                    _openImageSourceOptions(context);
                  },
                  padding: EdgeInsets.only(left: 5,right: 5),
                  iconSize: 24,
                  icon: Icon(
                    Icons.camera_enhance,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }

  contactNumberWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.contactNumber,
            style: TextStyle(
              fontSize: Dimensions.largeTextSize,
              color: Colors.white
            ),
          ),
          Card(
            elevation: 2,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.heightSize,
                bottom: Dimensions.heightSize,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.call,
                      color: CustomColor.secondaryColor,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.demoNumber,
                                style: TextStyle(
                                    fontSize: Dimensions.largeTextSize,
                                    fontWeight: FontWeight.bold,
                                  color: CustomColor.secondaryColor
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: CustomColor.accentColor,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  emailAddressWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.emailAddress,
            style: TextStyle(
              fontSize: Dimensions.largeTextSize,
              color: Colors.white
            ),
          ),
          Card(
            elevation: 2,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.heightSize,
                bottom: Dimensions.heightSize,
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.mail,
                      color: CustomColor.secondaryColor,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.demoEmail,
                                style: TextStyle(
                                    fontSize: Dimensions.largeTextSize,
                                    fontWeight: FontWeight.bold,
                                  color: CustomColor.secondaryColor
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: CustomColor.accentColor,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  addressWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.address,
                style: TextStyle(
                    fontSize: Dimensions.largeTextSize,
                    color: Colors.white
                ),
              ),
              Text(
                Strings.change.toUpperCase(),
                style: TextStyle(
                    fontSize: Dimensions.largeTextSize,
                    color: CustomColor.primaryColor
                ),
              ),
            ],
          ),
          Card(
            elevation: 2,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.heightSize,
                bottom: Dimensions.heightSize,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.home,
                      color: CustomColor.secondaryColor,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.demoName,
                                style: TextStyle(
                                    fontSize: Dimensions.largeTextSize,
                                    fontWeight: FontWeight.bold,
                                  color: CustomColor.secondaryColor
                                ),
                              ),
                              Text(
                                Strings.demoAddress,
                                style: TextStyle(
                                  fontSize: Dimensions.defaultTextSize,
                                  color: CustomColor.secondaryColor
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: CustomColor.accentColor,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  updateProfileWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
        ),
        child: GestureDetector(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius * 2)
            ),
            child: Center(
              child: Text(
                Strings.updateProfile.toUpperCase(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          onTap: () {
          },
        ),
      ),
    );
  }

  Future<void> _openImageSourceOptions(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Icon(Icons.camera_alt, size: 40.0, color: Colors.blue,),
                  onTap: (){
                    Navigator.of(context).pop();
                    _chooseFromCamera();
                  },
                ),
                GestureDetector(
                  child: Icon(Icons.photo, size: 40.0, color: Colors.green,),
                  onTap: (){
                    Navigator.of(context).pop();
                    _chooseFromGallery();
                  },
                ),
              ],
            ),
          );
        });
  }
  File file;
  void _chooseFromGallery() async{
    // ignore: deprecated_member_use
    file = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 40);

    if (file == null){
      Fluttertoast.showToast(msg: 'No File Selected');
    }else{
      setState(() {
        _image = file;
      });
      //_upload();
    }
  }
  _chooseFromCamera() async{
    print('open camera');
    //ignore: deprecated_member_use
    file = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 20);

    print('picked camera');
    if (file == null){
      Fluttertoast.showToast(msg: 'No Capture Image');
    }else{
      setState(() {
        _image = file;
      });
      //_upload();
    }
  }

}
