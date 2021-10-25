import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:vimubox/utils/dimensions.dart';
import 'package:vimubox/utils/colors.dart';
import 'package:vimubox/utils/strings.dart';
import 'package:vimubox/data/trending.dart';

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
              height: 2,
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
      height: 150,
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
                  Strings.season.toUpperCase(),
                  style: TextStyle(
                      fontSize: Dimensions.largeTextSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll.toUpperCase(),
                  style: TextStyle(
                    fontSize: Dimensions.defaultTextSize,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: TrendingList.list().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Trending trending = TrendingList.list()[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                  ),
                  child: GestureDetector(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                trending.image,
                                height: 120,
                                width: 100,
                                fit: BoxFit.contain,
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                left: 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 14,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: CustomColor.accentColor,
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Center(
                                        child: Text(
                                          'HD',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.smallTextSize),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: CustomColor.accentColor,
                                          size: 15,
                                        ),
                                        Text(
                                          '${trending.rating}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  Dimensions.defaultTextSize,
                                              fontWeight: FontWeight.bold),
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
                            trending.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.largeTextSize),
                          ),
                          //SizedBox(height: Dimensions.heightSize * 0.5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${trending.type}',
                                style: TextStyle(
                                    color: CustomColor.accentColor,
                                    fontSize: Dimensions.defaultTextSize),
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
                                movie: trending,
                              )));
                    },
                  ),
                );
              },
            ),
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
                  Strings.recommendedForYou.toUpperCase(),
                  style: TextStyle(
                      fontSize: Dimensions.largeTextSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  Strings.seeAll.toUpperCase(),
                  style: TextStyle(
                    fontSize: Dimensions.defaultTextSize,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: TrendingList.list().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Trending trending = TrendingList.list()[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                  ),
                  child: GestureDetector(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                trending.image,
                                height: 120,
                                width: 100,
                                fit: BoxFit.contain,
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                left: 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 14,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: CustomColor.accentColor,
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Center(
                                        child: Text(
                                          'HD',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.smallTextSize),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: CustomColor.accentColor,
                                          size: 15,
                                        ),
                                        Text(
                                          '${trending.rating}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  Dimensions.defaultTextSize,
                                              fontWeight: FontWeight.bold),
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
                            trending.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.largeTextSize),
                          ),
                          //SizedBox(height: Dimensions.heightSize * 0.5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${trending.type}',
                                style: TextStyle(
                                    color: CustomColor.accentColor,
                                    fontSize: Dimensions.defaultTextSize),
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
                                movie: trending,
                              )));
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
