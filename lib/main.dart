import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vimubox/screens/auth/sign_in_screen.dart';
import 'package:vimubox/screens/dashboard_screen.dart';
import 'package:vimubox/screens/splash_screen.dart';
import 'package:vimubox/utils/colors.dart';

/*void main() {
  runApp(MyApp());
}*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //verification de session

  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');

  runApp(
    email == null ? MyApp() : home(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: CustomColor.primaryColor, fontFamily: 'Ubuntu'),
      home: SplashScreen(),
    );
  }
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: CustomColor.primaryColor, fontFamily: 'Ubuntu'),
      home: DashboardScreen(),
    );
  }
}
