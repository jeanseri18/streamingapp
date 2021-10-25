import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vimubox/screens/dashboard/home_screen.dart';
import 'package:vimubox/screens/dashboard/notification_screen.dart';
import 'package:vimubox/screens/dashboard/watchlist_screen.dart';
import 'package:vimubox/utils/colors.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: new Material(
        elevation: 10,
        //borderRadius: BorderRadius.circular(20),
        child: new BottomNavigationBar(
          backgroundColor: CustomColor.primaryColor,
            elevation: 25,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex ,
            onTap: _onTapIndex,
            items: [
              BottomNavigationBarItem(
                // ignore: deprecated_member_use
                  icon: SvgPicture.asset(
                    'assets/svg/favorite.svg',
                    color: currentIndex == 0 ? CustomColor.accentColor : Colors.white,
                  ),
                  // ignore: deprecated_member_use
                  title: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: currentIndex == 0 ? Container(
                      height: 6,
                      width: 20,
                      decoration: BoxDecoration(
                          color: CustomColor.accentColor,
                          borderRadius: BorderRadius.circular(2)
                      ),
                    ) : Container(),
                  )
              ),
              BottomNavigationBarItem(
                // ignore: deprecated_member_use
                  icon: SvgPicture.asset(
                    'assets/svg/home.svg',
                    color: currentIndex == 1 ? CustomColor.accentColor : Colors.white,
                  ),
                  // ignore: deprecated_member_use
                  title: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: currentIndex == 1 ? Container(
                      height: 6,
                      width: 20,
                      decoration: BoxDecoration(
                          color: CustomColor.accentColor,
                          borderRadius: BorderRadius.circular(2)
                      ),
                    ) : Container(),
                  )
              ),
              BottomNavigationBarItem(
                // ignore: deprecated_member_use
                  icon: SvgPicture.asset(
                    'assets/svg/notification.svg',
                    color: currentIndex == 2 ? CustomColor.accentColor : Colors.white,
                  ),
                  // ignore: deprecated_member_use
                  title: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: currentIndex == 2 ? Container(
                      height: 6,
                      width: 20,
                      decoration: BoxDecoration(
                          color: CustomColor.accentColor,
                          borderRadius: BorderRadius.circular(2)
                      ),
                    ) : Container(),
                  )
              ),
            ]),
      ),
      body: goToScreen(currentIndex),
    );
  }

  _onTapIndex(index) {
    setState(() {
      currentIndex = index;
      print('index: $index');
    });
    goToScreen(currentIndex);
  }

  goToScreen(int currentIndex) {
    print('indexx: $currentIndex');
    switch(currentIndex){
      case 0:
        return WatchlistScreen();
      case 1:
        return HomeScreen();
      case 2:
        return NotificationScreen();
    }
  }
}
