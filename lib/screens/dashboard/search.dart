import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vimubox/data/trending.dart';
import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/utils/custom_style.dart';
import 'package:http/http.dart' as http;
import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/screens/category_details_screen.dart';

Future<List<Trending>> getData() async {
  var url = Uri.parse("https://abidjanstreaming.com/index/getcategorie.php");
  print(url);
  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);
  List<Trending> dataList = [];
  for (var u in jsonData) {
    Trending data = Trending(
        id: int.parse(u['id']),
        name: u['nom'],
        image: u['id'],
        type: u['id'],
        rating: u['id'],
        file: u['id']);
    dataList.add(data);
  }
  print(dataList.length);
  return dataList;
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Future getfilmpopulaire() async {
    var url = Uri.parse("https://abidjanstreaming.com/index/filmget.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Flutter Apply Search on ListView')),
            body: Center(child: ListSearch())));
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();

/*
  static List<String> mainDataList = [
    "Apple",
    "Apricot",
    "Banana",
    "Blackberry",
    "Coconut",
    "Date",
    "Fig",
    "Gooseberry",
    "Grapes",
    "Lemon",
    "Litchi",
    "Mango",
    "Orange",
    "Papaya",
    "Peach",
    "Pineapple",
    "Pomegranate",
    "Starfruit"
  ];
*/
  // Copy Main List into New List.
  /*
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Abidjan streaming",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize, right: Dimensions.marginSize),
            child: Column(
              children: [
                /*
                Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: CustomColor.accentColor),
                      onPressed: () {
                        print('open dialog');
                        /*logOut(context);*/
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
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: CustomColor.accentColor),
                      onPressed: () {
                        print('open dialog');
                        /*logOut(context);*/
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
                  ],
                ),*/
                TextFormField(
                  /* onChanged: onItemChanged,*/
                  style: CustomStyle.textStyle,
                  controller: _textController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return ('entre');
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'entrez un mot',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      filled: true,
                      fillColor: Colors.transparent,
                      hintStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      suffixIcon: Icon(
                        EvaIcons.searchOutline,
                        color: Colors.amber,
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Trending>>(
                future: getData(),
                builder: (context, snapshot) {
                  print(snapshot.hasData);
                  return snapshot.hasData
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Trending trending1;
                            trending1 = Trending(
                              id: int.parse(snapshot.data[index].id.toString()),
                              name: snapshot.data[index].name,
                              image: snapshot.data[index].id.toString(),
                              type: snapshot.data[index].id.toString(),
                              rating: snapshot.data[index].id.toString(),
                            );
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: (TextButton(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    primary: Colors.amber,
                                    textStyle: const TextStyle(fontSize: 15),
                                    backgroundColor: Colors.amber),
                                onPressed: () {
                                  print('open dialog');
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryDetailsScreen(
                                            categorie: trending1,
                                          )));
                                },
                                child: Text(
                                  snapshot.data[index].name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        );
                }),
            /*
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return ListTile(
                  title: Text(
                    data,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => print(data),
                );
              }).toList(),
            ),*/
          )
        ],
      ),
    );
  }
}
