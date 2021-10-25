import 'package:flutter/material.dart';

import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/data/notifications.dart';
import 'package:vimubox/widgets/header_widget.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
              HeaderWidget(
                name: Strings.notification,
              ),
              bodyWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Container();
    /* Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: NotificationList.list().length,
          itemBuilder: (context, index) {
            Notifications notification = NotificationList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: GestureDetector(
                child: Card(
                  elevation: 2,
                  color: CustomColor.primaryColor,
                  shadowColor: Colors.white.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize,
                      top: Dimensions.heightSize,
                      bottom: Dimensions.heightSize,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: Icon(
                                    Icons.notifications_outlined,
                                    color: CustomColor.accentColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.widthSize,),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          notification.title,
                                          style: TextStyle(
                                              fontSize: Dimensions.largeTextSize,
                                              color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Dimensions.heightSize * 0.5,),
                                    Text(
                                      notification.subTitle,
                                      style: TextStyle(
                                          fontSize: Dimensions.smallTextSize,
                                          color: Colors.grey
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {

                },
              ),
            );
          },
        ),
      ),
    );*/
  }
}
