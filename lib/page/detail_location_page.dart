import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petruk/model/location_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailLocationPage extends StatefulWidget {
  final LocationModel locationModel;

  DetailLocationPage({Key key, this.locationModel}) : super(key: key);

  @override
  _DetailLocationPageState createState() => _DetailLocationPageState();
}

class _DetailLocationPageState extends State<DetailLocationPage> with SingleTickerProviderStateMixin {
  TabController _controller;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  YoutubePlayerController _youtubeController;

  void listener() {
    if (_isPlayerReady && mounted && !_youtubeController.value.isFullScreen) {
      setState(() {
        _playerState = _youtubeController.value.playerState;
        _videoMetaData = _youtubeController.metadata;
      });
    }
  }

  @override
  void initState() {
    _youtubeController = YoutubePlayerController(
      initialVideoId: widget.locationModel.VIDEO,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHideAnnotation: true,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _youtubeController.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.file_download),
          onPressed: () async {
            var url = widget.locationModel.FILE;
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    CarouselSlider(
                      height: 200,
                      autoPlay: false,
                      viewportFraction: 1.0,
                      aspectRatio: MediaQuery.of(context).size.aspectRatio,
                      items: widget.locationModel.PHOTO.map(
                        (url) {
                          return Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(0.0)),
                              child: Image.network(
                                url.URL_FOTO,
                                fit: BoxFit.cover,
                                width: 1000.0,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                        child: Text(
                          widget.locationModel.NAMA,
                          style: TextStyle(color: Color(0xff424874), fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Text(
                                widget.locationModel.LOKASI,
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 25),
                        decoration:
                            BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffA6B1E1), width: 1))),
                        child: DefaultTabController(
                          length: 3,
                          initialIndex: 0,
                          child: TabBar(
                            labelPadding: EdgeInsets.symmetric(horizontal: 25),
                            indicatorColor: Color(0xffA6B1E1),
                            controller: _controller,
                            tabs: <Widget>[
                              Tab(
                                child: Text(
                                  "DESKRIPSI",
                                  style: TextStyle(color: Color(0xff424874)),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "VIDEO",
                                  style: TextStyle(color: Color(0xff424874)),
                                ),
                              ),
//                              Tab(child: Text("LOKASI", style: TextStyle(color: Color(0xff424874)),),),
                            ],
                            isScrollable: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    controller: _controller,
                    children: <Widget>[
                      Scaffold(
                        body: Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                                  child: Text(widget.locationModel.DESKRIPSI),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Scaffold(
                        body: Container(
                          child: YoutubePlayer(
                            controller: _youtubeController,
                            showVideoProgressIndicator: true,
                            onReady: () {
                              _controller.addListener(listener);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
