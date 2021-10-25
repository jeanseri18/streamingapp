import 'dart:convert';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vimubox/screens/auth/sign_up_screen.dart';
import 'package:vimubox/screens/dashboard/search.dart';
import 'package:vimubox/screens/onboard/on_board_screen.dart';
import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/utils/custom_style.dart';
import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/data/category.dart';
import 'package:vimubox/data/trending.dart';
import 'package:vimubox/screens/auth/sign_in_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vimubox/screens/subscription_plan_screen.dart';
import 'package:vimubox/screens/my_profile_screen.dart';
import 'package:vimubox/screens/support_screen.dart';
import 'package:vimubox/screens/player_screen.dart';
import 'package:vimubox/screens/category_details_screen.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';

final List<String> sliderList = [
  'https://abidjanstreaming.com/admin/assets/files/mulan.jpg',
  'https://abidjanstreaming.com/admin/assets/files/The curse of la liorona.jpg',
  'https://abidjanstreaming.com/admin/assets/files/TIMBUKTU.jpg',
  'https://abidjanstreaming.com/admin/assets/files/boogie.jpg',

  //'assets/images/slider/3.png',
];
String id;

final List<Widget> imageSliders = sliderList
    .map(
      (item) => Container(child: Builder(
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: item,
                    placeholder: (context, url) => LinearProgressIndicator(
                      color: Colors.black,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                  //  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                ],
              ),
            ),
          );
        },
      )),
    )
    .toList();
final List<String> sliderList1 = [
  'https://abidjanstreaming.com/admin/assets/files/boruto.jpg',
  'https://abidjanstreaming.com/admin/assets/files/Dragon 3.jpg',
  'https://abidjanstreaming.com/admin/assets/files/MOI MOCHE MECHANT.jpg',
  'https://abidjanstreaming.com/admin/assets/files/pikachu.jpg',

  //'assets/images/slider/3.png',
];

final List<Widget> imageSliders1 = sliderList1
    .map(
      (item) => Container(child: Builder(
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: item,
                    placeholder: (context, url) => LinearProgressIndicator(
                      color: Colors.black,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                  //  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                ],
              ),
            ),
          );
        },
      )),
    )
    .toList();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  //List<DataModel> model;
  /*
  List data;
  Future login() async {
    var url = Uri.parse("https://abidjanstreaming.com/index/get.php");
    var response = await http.get(url);
    data = json.decode(response.body);
  }
*/
  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OnBoardScreen(),
      ),
    );
  }

  Future getfilmpopulaire() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var email = preferences.getString('email');
    print(email);
    var url = Uri.parse("https://abidjanstreaming.com/index/filmget.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getfilmnew() async {
    var url = Uri.parse("https://abidjanstreaming.com/index/filmnew.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getcategorie() async {
    var url = Uri.parse("https://abidjanstreaming.com/index/getcategorie.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getfilmaction() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=6");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getfilmcomedie() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=4");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getfilmdrame() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=3");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getfilmanime() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=16");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getfilmaventure() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=17");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getfilmfantastique() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=7");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getfilmscifi() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=2");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getfilmhorreur() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=8");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getfilmmanga() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=21");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }
/*
  Future<void> getData() async {
    Uri url = Uri.parse('https://abidjanstreaming.com/index/get.php');
    http.Response res = await http.get(url);
    print(res.body);
    List<dynamic> body = cnv.jsonDecode(res.body);
    model = body.map((dynamic item) => DataModel.fromJson(item)).toList();
    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //ajout app
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: IconButton(
            /*   EvaIcons.menu2Outline,*/
            color: Colors.amber,
            icon: Icon(EvaIcons.menu2Outline),
            //drawer side bar
            onPressed: () {
              scaffoldKey.currentState.openDrawer();
            },
          ),
          title: Text(
            "Abidjan streaming",
            style: TextStyle(color: Colors.amber),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ListSearch()));
                },
                icon: Icon(
                  EvaIcons.searchOutline,
                  color: Colors.amber,
                ))
          ],
        ),
        backgroundColor: Colors.black,
        key: scaffoldKey,
        drawer: Drawer(
          child: Container(
            color: CustomColor.primaryColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: profileWidget(context),
                  decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: CustomColor.accentColor),
                  onPressed: () {
                    print('open dialog');
                    logOut(context);
                    /*  Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoryDetailsScreen()));*/
                  },
                  child: Text(
                    'deconnexion'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.defaultTextSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                listData('assets/images/icon/account.png', Strings.myAccount,
                    MyProfileScreen()),
                /* listData('assets/images/icon/about_us.png', Strings.aboutUs,
                    MyProfileScreen()),*/
                ListTile(
                  leading: Image.asset('assets/images/icon/subscription.png'),
                  title: Text(
                    Strings.mySubscriptions,
                    style: CustomStyle.listStyle,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    openSubscribeNowDialog(context);
                  },
                ),
                listData('assets/images/icon/support.png', Strings.support,
                    SupportScreen()),
                /*    listData('assets/images/icon/rate_us.png', Strings.rateUs,
                    MyProfileScreen()),
                SizedBox(
                  height: 50,
                ),*/
                //   listData('assets/images/icon/sign_out.png', Strings.singOut,
                //    SignInScreen()),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 200.0,
                  width: double.infinity,
                  child: Carousel(
                    dotBgColor: Colors.transparent,
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    indicatorBgPadding: 5.0,
                    dotColor: Colors.amber,
                    images: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://abidjanstreaming.com/admin/assets/files/mulan.jpg',
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.transparent,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        /* height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,*/
                        fit: BoxFit.cover,
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            'https://abidjanstreaming.com/admin/assets/files/The curse of la liorona.jpg',
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.transparent,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        /* height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,*/
                        fit: BoxFit.cover,
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            'https://abidjanstreaming.com/admin/assets/files/TIMBUKTU.jpg',
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.transparent,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        /* height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,*/
                        fit: BoxFit.cover,
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            'https://abidjanstreaming.com/admin/assets/files/boogie.jpg',
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.transparent,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        /* height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,*/
                        fit: BoxFit.cover,
                      ),
                    ],
                  )),
              categoryWidget(context),
              /*  headerWidget(context),*/
              bodyWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  profileWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.heightSize * 3,
      ),
      child: ListTile(
        leading: Image.asset(
          'assets/images/user.png',
        ),
        title: Text(
          'Mon profil',
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          Strings.demoEmail,
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimensions.defaultTextSize,
          ),
        ),
      ),
    );
  }

  listData(String icon, String title, Widget goTo) {
    return ListTile(
      leading: Image.asset(icon),
      title: Text(
        title,
        style: CustomStyle.listStyle,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => goTo));
      },
    );
  }

  headerWidget(BuildContext context) {
    return Container(
      height: 180,
      //250
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimensions.radius * 2),
            bottomRight: Radius.circular(Dimensions.radius * 2)),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              /*image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/home_bg.png',
                ),
              ),*/
            ),
            height: 250.0,
          ),
          Container(
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*  GestureDetector(
                  child: Image.asset('assets/images/list.png'),
                  onTap: () {
                    if (scaffoldKey.currentState.isDrawerOpen) {
                      scaffoldKey.currentState.openEndDrawer();
                    } else {
                      scaffoldKey.currentState.openDrawer();
                    }
                  },
                ),*/
                Text(
                  Strings.trending.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.smallTextSize),
                ),
                Text(
                  Strings.newest.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.smallTextSize),
                ),
                Text(
                  Strings.forYou.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.smallTextSize),
                ),
                Text(
                  Strings.popular.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.smallTextSize),
                ), /*
                GestureDetector(
                  child: Image.asset('assets/images/profile.png'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyProfileScreen()));
                  },
                ),*/
              ],
            ),
          ),*/
          headerSliderWidget(context)
        ],
      ),
    );
  }

  headerSliderWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: 0,
      right: 0,
      child: Container(
        height: 160,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 1.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.heightSize,
          ),
          trendingWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          newestWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          specialForYouWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          popularWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          animeWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          aventureWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          specialForYouWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          comedieWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          dramaWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          fantastiqueWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          specialForYouWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          horreurWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          mangaWidget(context),
          scifiWidget(context),
          SizedBox(
            height: Dimensions.heightSize,
          ),
        ],
      ),
    );
  }
/*
  categorytestWidget(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: CustomColor.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius * 2),
              topRight: Radius.circular(Dimensions.radius * 2))),
      child: ListView.builder(
        itemCount: CategoryList.list().length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Category category = CategoryList.list()[index];
          return Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize, right: Dimensions.marginSize),
            child: GestureDetector(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*
                    Image.asset(
                      category.image,
                      height: 40,
                      width: 40,
                      fit: BoxFit.contain,
                    ),*/
                    SizedBox(
                      height: Dimensions.heightSize,
                    ),
                    Text(
                      category.name.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.defaultTextSize,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              onTap: () {
                print('open dialog');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoryDetailsScreen()));
              },
            ),
          );
        },
      ),
    );
  }*/

  categoryWidget(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: CustomColor.primaryColor,
          borderRadius: BorderRadius.only(
              //*2
              topLeft: Radius.circular(Dimensions.radius * 0),
              topRight: Radius.circular(Dimensions.radius * 0))),
      child: FutureBuilder(
        future: getcategorie(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    List category = snapshot.data;
                    Trending trending2;
                    trending2 = Trending(
                      id: int.parse(category[index]['id']),
                      name: category[index]['nom'],
                      image: category[index]['id'],
                      type: category[index]['id'],
                      rating: category[index]['id'],
                    );
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.marginSize,
                          right: Dimensions.marginSize),
                      child: GestureDetector(
                        child: Container(
                          //color: CustomColor.accentColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /*
                      Image.asset(
                        category.image,
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                      ),*/
                              SizedBox(
                                height: Dimensions.heightSize,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(7.0),
                                    primary: Colors.amber,
                                    textStyle: const TextStyle(fontSize: 15),
                                    backgroundColor: Colors.amber),
                                onPressed: () {
                                  print('open dialog');
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryDetailsScreen(
                                            categorie: trending2,
                                          )));
                                },
                                child: Text(
                                  category[index]['nom'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          print('open dialog');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CategoryDetailsScreen()));
                        },
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(color: Colors.black);
        },
      ),
    );
  }

  openSubscribeNowDialog(BuildContext context) {
    showGeneralDialog(
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.6),
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                ),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 12, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: CustomColor.accentColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/video_popcorn.png'),
                      SizedBox(
                        height: Dimensions.heightSize,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: Dimensions.marginSize,
                          right: Dimensions.marginSize,
                        ),
                        child: Text(
                          Strings.subscribeNowToAccessPremiumContent,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.heightSize * 2,
                      ),
                      GestureDetector(
                        child: Container(
                          height: Dimensions.buttonHeight,
                          width: 150,
                          decoration: BoxDecoration(
                              color: CustomColor.primaryColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius)),
                          child: Center(
                            child: Text(
                              Strings.subscribeNow.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SubscriptionPlanScreen()));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        });
  }

  trendingWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.trendingOnVimu,
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 180,
            child: FutureBuilder(
                future: getfilmpopulaire(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(list[index]['id']),
                              name: list[index]['titre'],
                              image: list[index]['video'],
                              type: list[index]['descr_film'],
                              rating: list[index]['id_categorie'],
                            );
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                'https://abidjanstreaming.com/admin/' +
                                                    list[index]['file'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                              backgroundColor: Colors.black,
                                              color: Colors.transparent,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            height: 100,
                                            width: 180,
                                            fit: BoxFit.contain,
                                          ),
                                          /* Image.network(
                                            'https://abidjanstreaming.com/admin/' +
                                                list[index]['file'],
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),*/
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: CustomColor
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      'HD',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .smallTextSize),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: CustomColor
                                                          .accentColor,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      list[index]['id'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: Dimensions
                                                              .defaultTextSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                        list[index]['titre'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize),
                                      ),
                                      //SizedBox(height: Dimensions.heightSize * 0.5,),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index]['id'],
                                            style: TextStyle(
                                                color: CustomColor.accentColor,
                                                fontSize:
                                                    Dimensions.defaultTextSize),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthSize * 0.5,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              onPressed: null)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                            movie: trending1,
                                          )));
                                },
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
          )
        ],
      ),
    );
  }

  newestWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.newest,
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 180,
            child: FutureBuilder(
                future: getfilmnew(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(list[index]['id']),
                              name: list[index]['titre'],
                              image: list[index]['video'],
                              type: list[index]['descr_film'],
                              rating: list[index]['id_categorie'],
                            );
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                'https://abidjanstreaming.com/admin/' +
                                                    list[index]['file'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                              backgroundColor: Colors.black,
                                              color: Colors.transparent,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            height: 100,
                                            width: 180,
                                            fit: BoxFit.contain,
                                          ),
                                          /* Image.network(
                                            'https://abidjanstreaming.com/admin/' +
                                                list[index]['file'],
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),*/
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: CustomColor
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      'HD',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .smallTextSize),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: CustomColor
                                                          .accentColor,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      list[index]['id'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: Dimensions
                                                              .defaultTextSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                        list[index]['titre'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize),
                                      ),
                                      //SizedBox(height: Dimensions.heightSize * 0.5,),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index]['id'],
                                            style: TextStyle(
                                                color: CustomColor.accentColor,
                                                fontSize:
                                                    Dimensions.defaultTextSize),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthSize * 0.5,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              onPressed: null)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                            movie: trending1,
                                          )));
                                },
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
          )
        ],
      ),
    );
  }

  specialForYouWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.specialForYou.toUpperCase(),
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                /*      Text(
                  Strings.seeAll.toUpperCase(),
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),*/
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders1,
            ),
          )
        ],
      ),
    );
  }

  popularWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Action',
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 180,
            child: FutureBuilder(
                future: getfilmaction(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(list[index]['id']),
                              name: list[index]['titre'],
                              image: list[index]['video'],
                              type: list[index]['descr_film'],
                              rating: list[index]['id_categorie'],
                            );

                            return Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                'https://abidjanstreaming.com/admin/' +
                                                    list[index]['file'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                              backgroundColor: Colors.black,
                                              color: Colors.transparent,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),
                                          /* Image.network(
                                            'https://abidjanstreaming.com/admin/' +
                                                list[index]['file'],
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),*/
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: CustomColor
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      'HD',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .smallTextSize),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: CustomColor
                                                          .accentColor,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      list[index]['id'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: Dimensions
                                                              .defaultTextSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                        list[index]['titre'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize),
                                      ),
                                      //SizedBox(height: Dimensions.heightSize * 0.5,),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index]['id'],
                                            style: TextStyle(
                                                color: CustomColor.accentColor,
                                                fontSize:
                                                    Dimensions.defaultTextSize),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthSize * 0.5,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              onPressed: null)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                            movie: trending1,
                                          )));
                                },
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
          )
        ],
      ),
    );
  }

  comedieWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Comedie',
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 180,
            child: FutureBuilder(
                future: getfilmaction(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(list[index]['id']),
                              name: list[index]['titre'],
                              image: list[index]['video'],
                              type: list[index]['descr_film'],
                              rating: list[index]['id_categorie'],
                            );

                            return Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                'https://abidjanstreaming.com/admin/' +
                                                    list[index]['file'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                              backgroundColor: Colors.black,
                                              color: Colors.transparent,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),
                                          /* Image.network(
                                            'https://abidjanstreaming.com/admin/' +
                                                list[index]['file'],
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),*/
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: CustomColor
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      'HD',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .smallTextSize),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: CustomColor
                                                          .accentColor,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      list[index]['id'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: Dimensions
                                                              .defaultTextSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                        list[index]['titre'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize),
                                      ),
                                      //SizedBox(height: Dimensions.heightSize * 0.5,),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index]['id'],
                                            style: TextStyle(
                                                color: CustomColor.accentColor,
                                                fontSize:
                                                    Dimensions.defaultTextSize),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthSize * 0.5,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              onPressed: null)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                            movie: trending1,
                                          )));
                                },
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
          )
        ],
      ),
    );
  }

  dramaWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Drame',
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 180,
            child: FutureBuilder(
                future: getfilmdrame(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(list[index]['id']),
                              name: list[index]['titre'],
                              image: list[index]['video'],
                              type: list[index]['descr_film'],
                              rating: list[index]['id_categorie'],
                            );

                            return Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                'https://abidjanstreaming.com/admin/' +
                                                    list[index]['file'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                              backgroundColor: Colors.black,
                                              color: Colors.transparent,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),
                                          /* Image.network(
                                            'https://abidjanstreaming.com/admin/' +
                                                list[index]['file'],
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),*/
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: CustomColor
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      'HD',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .smallTextSize),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: CustomColor
                                                          .accentColor,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      list[index]['id'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: Dimensions
                                                              .defaultTextSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                        list[index]['titre'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize),
                                      ),
                                      //SizedBox(height: Dimensions.heightSize * 0.5,),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index]['id'],
                                            style: TextStyle(
                                                color: CustomColor.accentColor,
                                                fontSize:
                                                    Dimensions.defaultTextSize),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthSize * 0.5,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              onPressed: null)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                            movie: trending1,
                                          )));
                                },
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
          )
        ],
      ),
    );
  }

  horreurWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Horreur',
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 180,
            child: FutureBuilder(
                future: getfilmhorreur(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(list[index]['id']),
                              name: list[index]['titre'],
                              image: list[index]['video'],
                              type: list[index]['descr_film'],
                              rating: list[index]['id_categorie'],
                            );

                            return Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                'https://abidjanstreaming.com/admin/' +
                                                    list[index]['file'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                              backgroundColor: Colors.black,
                                              color: Colors.transparent,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),
                                          /* Image.network(
                                            'https://abidjanstreaming.com/admin/' +
                                                list[index]['file'],
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),*/
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: CustomColor
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      'HD',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .smallTextSize),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: CustomColor
                                                          .accentColor,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      list[index]['id'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: Dimensions
                                                              .defaultTextSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                        list[index]['titre'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize),
                                      ),
                                      //SizedBox(height: Dimensions.heightSize * 0.5,),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index]['id'],
                                            style: TextStyle(
                                                color: CustomColor.accentColor,
                                                fontSize:
                                                    Dimensions.defaultTextSize),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthSize * 0.5,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              onPressed: null)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                            movie: trending1,
                                          )));
                                },
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
          )
        ],
      ),
    );
  }

  mangaWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Manga',
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 180,
            child: FutureBuilder(
                future: getfilmmanga(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(list[index]['id']),
                              name: list[index]['titre'],
                              image: list[index]['video'],
                              type: list[index]['descr_film'],
                              rating: list[index]['id_categorie'],
                            );

                            return Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                'https://abidjanstreaming.com/admin/' +
                                                    list[index]['file'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                              backgroundColor: Colors.black,
                                              color: Colors.transparent,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),
                                          /* Image.network(
                                            'https://abidjanstreaming.com/admin/' +
                                                list[index]['file'],
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),*/
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: CustomColor
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      'HD',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .smallTextSize),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: CustomColor
                                                          .accentColor,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      list[index]['id'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: Dimensions
                                                              .defaultTextSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                        list[index]['titre'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize),
                                      ),
                                      //SizedBox(height: Dimensions.heightSize * 0.5,),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index]['id'],
                                            style: TextStyle(
                                                color: CustomColor.accentColor,
                                                fontSize:
                                                    Dimensions.defaultTextSize),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthSize * 0.5,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              onPressed: null)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                            movie: trending1,
                                          )));
                                },
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
          )
        ],
      ),
    );
  }

  scifiWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Science fiction',
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 180,
            child: FutureBuilder(
                future: getfilmscifi(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(list[index]['id']),
                              name: list[index]['titre'],
                              image: list[index]['video'],
                              type: list[index]['descr_film'],
                              rating: list[index]['id_categorie'],
                            );

                            return Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                'https://abidjanstreaming.com/admin/' +
                                                    list[index]['file'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                              backgroundColor: Colors.black,
                                              color: Colors.transparent,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),
                                          /* Image.network(
                                            'https://abidjanstreaming.com/admin/' +
                                                list[index]['file'],
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),*/
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: CustomColor
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      'HD',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .smallTextSize),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: CustomColor
                                                          .accentColor,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      list[index]['id'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: Dimensions
                                                              .defaultTextSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                        list[index]['titre'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize),
                                      ),
                                      //SizedBox(height: Dimensions.heightSize * 0.5,),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index]['id'],
                                            style: TextStyle(
                                                color: CustomColor.accentColor,
                                                fontSize:
                                                    Dimensions.defaultTextSize),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthSize * 0.5,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              onPressed: null)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                            movie: trending1,
                                          )));
                                },
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
          )
        ],
      ),
    );
  }

  fantastiqueWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fantastique',
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 180,
            child: FutureBuilder(
                future: getfilmfantastique(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(list[index]['id']),
                              name: list[index]['titre'],
                              image: list[index]['video'],
                              type: list[index]['descr_film'],
                              rating: list[index]['id_categorie'],
                            );

                            return Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                'https://abidjanstreaming.com/admin/' +
                                                    list[index]['file'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                              backgroundColor: Colors.black,
                                              color: Colors.transparent,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),
                                          /* Image.network(
                                            'https://abidjanstreaming.com/admin/' +
                                                list[index]['file'],
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),*/
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: CustomColor
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      'HD',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .smallTextSize),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: CustomColor
                                                          .accentColor,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      list[index]['id'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: Dimensions
                                                              .defaultTextSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                        list[index]['titre'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize),
                                      ),
                                      //SizedBox(height: Dimensions.heightSize * 0.5,),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index]['id'],
                                            style: TextStyle(
                                                color: CustomColor.accentColor,
                                                fontSize:
                                                    Dimensions.defaultTextSize),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthSize * 0.5,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              onPressed: null)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                            movie: trending1,
                                          )));
                                },
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
          )
        ],
      ),
    );
  }

  aventureWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Aventure',
                  //.toUpperCase(),
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 180,
            child: FutureBuilder(
                future: getfilmaventure(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(list[index]['id']),
                              name: list[index]['titre'],
                              image: list[index]['video'],
                              type: list[index]['descr_film'],
                              rating: list[index]['id_categorie'],
                            );

                            return Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                'https://abidjanstreaming.com/admin/' +
                                                    list[index]['file'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                              backgroundColor: Colors.black,
                                              color: Colors.transparent,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),
                                          /* Image.network(
                                            'https://abidjanstreaming.com/admin/' +
                                                list[index]['file'],
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),*/
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: CustomColor
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      'HD',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .smallTextSize),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: CustomColor
                                                          .accentColor,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      list[index]['id'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: Dimensions
                                                              .defaultTextSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                        list[index]['titre'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize),
                                      ),
                                      //SizedBox(height: Dimensions.heightSize * 0.5,),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index]['id'],
                                            style: TextStyle(
                                                color: CustomColor.accentColor,
                                                fontSize:
                                                    Dimensions.defaultTextSize),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthSize * 0.5,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              onPressed: null)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                            movie: trending1,
                                          )));
                                },
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
          )
        ],
      ),
    );
  }

  animeWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Anime',
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 180,
            child: FutureBuilder(
                future: getfilmanime(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(list[index]['id']),
                              name: list[index]['titre'],
                              image: list[index]['video'],
                              type: list[index]['descr_film'],
                              rating: list[index]['id_categorie'],
                            );

                            return Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                'https://abidjanstreaming.com/admin/' +
                                                    list[index]['file'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                              backgroundColor: Colors.black,
                                              color: Colors.transparent,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),
                                          /* Image.network(
                                            'https://abidjanstreaming.com/admin/' +
                                                list[index]['file'],
                                            height: 100,
                                            width: 160,
                                            fit: BoxFit.contain,
                                          ),*/
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 14,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: CustomColor
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Center(
                                                    child: Text(
                                                      'HD',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Dimensions
                                                              .smallTextSize),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: CustomColor
                                                          .accentColor,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      list[index]['id'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: Dimensions
                                                              .defaultTextSize,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                        list[index]['titre'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize),
                                      ),
                                      //SizedBox(height: Dimensions.heightSize * 0.5,),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index]['id'],
                                            style: TextStyle(
                                                color: CustomColor.accentColor,
                                                fontSize:
                                                    Dimensions.defaultTextSize),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthSize * 0.5,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              onPressed: null)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                            movie: trending1,
                                          )));
                                },
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
          )
        ],
      ),
    );
  }
}
