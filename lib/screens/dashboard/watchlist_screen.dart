import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/widgets/header_widget.dart';
import 'package:vimubox/data/trending.dart';
import 'package:vimubox/screens/player_screen.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

Future getfilmpopulaire() async {
  var url = Uri.parse("https://abidjanstreaming.com/index/filmbyfavoris.php");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  }
}

class WatchlistScreen extends StatefulWidget {
  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              HeaderWidget(
                name: Strings.watchlist.toUpperCase(),
              ),
              bodyWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 60,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.brightness_1_outlined,
                        color: Colors.white,
                        size: 15.0,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      Strings.all,
                      style: TextStyle(
                          fontSize: Dimensions.extraLargeTextSize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                    size: 15.0,
                  ),
                  onPressed: () {},
                ),*/
              ],
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                  future: getfilmpopulaire(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: TrendingList.list().length,
                            scrollDirection: Axis.vertical,
                            //physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              List list = snapshot.data;
                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: Dimensions.marginSize,
                                  right: Dimensions.marginSize,
                                  bottom: Dimensions.heightSize,
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 120,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          child: Container(
                                            height: 120,
                                            child: Stack(
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl:
                                                      'https://abidjanstreaming.com/admin/' +
                                                          list[index]['file'],
                                                  placeholder: (context, url) =>
                                                      CircularProgressIndicator(
                                                    backgroundColor:
                                                        Colors.black,
                                                    color: Colors.transparent,
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                  height: 180,
                                                  width: 160,
                                                  fit: BoxFit.contain,
                                                ),
                                                /* Image.asset(
                                                  trending.image,
                                                  height: 120,
                                                  width: 100,
                                                  fit: BoxFit.contain,
                                                ),*/
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    Icons.play_arrow,
                                                    size: 50,
                                                    color:
                                                        CustomColor.accentColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PlayerScreen(
                                                          movie: list[index],
                                                        )));
                                          },
                                        ),
                                      ),
                                      SizedBox(width: Dimensions.widthSize),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 14,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  color:
                                                      CustomColor.accentColor,
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
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
                                            SizedBox(
                                                height: Dimensions.heightSize),
                                            Text(
                                              list[index]['titre'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      Dimensions.largeTextSize),
                                            ),
                                            SizedBox(
                                                height: Dimensions.heightSize *
                                                    0.5),
                                            Text(
                                              list[index]['id'],
                                              style: TextStyle(
                                                  color:
                                                      CustomColor.accentColor,
                                                  fontSize: Dimensions
                                                      .defaultTextSize),
                                            ),
                                            SizedBox(
                                                height: Dimensions.heightSize *
                                                    0.5),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                      CustomColor.accentColor,
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
                                      ),
                                      /* Expanded(
                                        flex: 1,
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.brightness_1_outlined,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                            onPressed: null),
                                      )*/
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : CircularProgressIndicator(
                            color: Colors.black,
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
