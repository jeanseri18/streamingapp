import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/widgets/back_widget.dart';
import 'package:vimubox/data/trending.dart';
import 'package:vimubox/data/category.dart';
import 'package:vimubox/screens/player_screen.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

Future getcategorie() async {
  var url = Uri.parse("https://abidjanstreaming.com/index/getcategorie.php");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  }
}

class CategoryDetailsScreen extends StatefulWidget {
  final Trending categorie;

  const CategoryDetailsScreen({Key key, this.categorie}) : super(key: key);

  @override
  _CategoryDetailsScreenState createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  //id de l categorie pour la recherche
  Future filmbycategorieid() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=" +
            widget.categorie.rating);
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future<List<Trending>> getData() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategoriefull.php?categorie=" +
            widget.categorie.rating);
    print(url);
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    List<Trending> dataList = [];
    for (var u in jsonData) {
      Trending data = Trending(
          id: int.parse(u['id']),
          name: u['titre'],
          image: u['video'],
          type: u['descr_film'],
          rating: u['id_categorie'],
          file: u['file']);
      dataList.add(data);
    }
    print(dataList.length);
    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              BackWidget(
                name: Strings.category.toUpperCase(),
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
            categoryWidget(context),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            detailsWidget(context)
          ],
        ),
      ),
    );
  }

  categoryWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
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
      ),
    );
  }

  detailsWidget(BuildContext context) {
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
              child: FutureBuilder<List<Trending>>(
                  future: getData(),
                  builder: (context, snapshot) {
                    print(snapshot.hasData);
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.vertical,
                            //physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              List list = snapshot.data;
                              Trending trending1;
                              trending1 = Trending(
                                id: int.parse(
                                    snapshot.data[index].id.toString()),
                                name: snapshot.data[index].name,
                                image: snapshot.data[index].image,
                                type: snapshot.data[index].type,
                                rating: snapshot.data[index].rating,
                              );
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
                                                          snapshot
                                                              .data[index].file,
                                                  placeholder: (context, url) =>
                                                      CircularProgressIndicator(
                                                    backgroundColor:
                                                        Colors.amber,
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
                                                          movie: trending1,
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
                                              snapshot.data[index].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      Dimensions.largeTextSize),
                                            ),
                                            SizedBox(
                                                height: Dimensions.heightSize *
                                                    0.5),
                                            Text(
                                              snapshot.data[index].id
                                                  .toString(),
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
                                                  snapshot.data[index].id
                                                      .toString(),
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

                        /* GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              Trending trending1;
                              trending1 = Trending(
                                id: int.parse(
                                    snapshot.data[index].id.toString()),
                                name: snapshot.data[index].name,
                                image: snapshot.data[index].image,
                                type: snapshot.data[index].type,
                                rating: snapshot.data[index].rating,
                              );
                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: Dimensions.marginSize,
                                ),
                                child: GestureDetector(
                                  child: Container(
                                    child: Column(
                                      /*   crossAxisAlignment:
                                          CrossAxisAlignment.start,*/
                                      children: [
                                        Stack(
                                          children: [
                                            /* CachedNetworkImage(
                                              imageUrl:
                                                  'https://abidjanstreaming.com/admin/' +
                                                      snapshot.data[index].file,
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
                                            ),*/
                                            Image.network(
                                              'https://abidjanstreaming.com/admin/' +
                                                  snapshot.data[index].file,
                                              height: 100,
                                              width: 140,
                                              fit: BoxFit.contain,
                                            ),
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
                                                            BorderRadius
                                                                .circular(3)),
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
                                                      )
                                                      /* Text(
                                                        snapshot
                                                            .data[index].name,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: Dimensions
                                                                .defaultTextSize,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),*/
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
                                        Text(snapshot.data[index].name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            )
                                            // Dimensions.largeTextSize),
                                            ),
                                        //SizedBox(height: Dimensions.heightSize * 0.5,),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapshot.data[index].id
                                                  .toString(),
                                              style: TextStyle(
                                                  color:
                                                      CustomColor.accentColor,
                                                  fontSize: Dimensions
                                                      .defaultTextSize),
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
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => PlayerScreen(
                                                  movie: trending1,
                                                )));
                                  },
                                ),
                              );
                            },
                          )*/
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
