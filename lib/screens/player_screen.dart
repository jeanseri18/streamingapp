import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/data/trending.dart';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

Future getfilmpopulaire() async {
  var url = Uri.parse("https://abidjanstreaming.com/index/filmget.php");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  }
}

class PlayerScreen extends StatefulWidget {
  final Trending movie;

  const PlayerScreen({Key key, this.movie}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  Future filmbycategorieid() async {
    var url = Uri.parse(
        "https://abidjanstreaming.com/index/filmbycategorie.php?categorie=" +
            widget.movie.rating);
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  void initState() {
    print('https://abidjanstreaming.com/admin/' + widget.movie.image);
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://abidjanstreaming.com/admin/' + widget.movie.image);
    //  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
      // Try playing around with some of these other options:

      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.black,
      ),
      autoInitialize: true,
    );

    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        print('video Ended');
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[playerWidget(context), bodyWidget(context)],
        ),
      ),
    );
  }

  playerWidget(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            movieInfoWidget(context),
            SizedBox(
              height: 2,
            ),
            detail(context),
            seasonWidget(context),
            SizedBox(
              height: 0,
            ),
            recommendedWidget(context)
          ],
        ),
      ),
    );
  }

  movieInfoWidget(BuildContext context) {
    return Container(
      color: CustomColor.primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
          top: Dimensions.heightSize,
          bottom: Dimensions.heightSize,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*  Text(
                  widget.movie.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold),
                ),*/
                SizedBox(
                  height: Dimensions.heightSize,
                ),
                Row(
                  children: [
                    Container(
                      height: 14,
                      width: 25,
                      decoration: BoxDecoration(
                          color: CustomColor.accentColor,
                          borderRadius: BorderRadius.circular(3)),
                      child: Center(
                        child: Text(
                          'HD',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.smallTextSize),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.widthSize * 0.5,
                    ),
                    Text(
                      widget.movie.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.defaultTextSize,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: CustomColor.accentColor,
                  size: 15,
                ),
                Text(
                  widget.movie.rating,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.defaultTextSize,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  detail(BuildContext context) {
    return Container(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
          top: Dimensions.heightSize,
          bottom: Dimensions.heightSize,
        ),
        child: Text(
          widget.movie.type,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  seasonWidget(BuildContext context) {
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
                  'Similaire'.toUpperCase(),
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll.toUpperCase(),
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
                future: filmbycategorieid(),
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

  recommendedWidget(BuildContext context) {
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
                  Strings.popular.toUpperCase(),
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll.toUpperCase(),
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
}
