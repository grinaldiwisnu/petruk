import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:petruk/model/location_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailLocationPage extends StatefulWidget {
  final LocationModel locationModel;

  DetailLocationPage({Key key, this.locationModel}) : super(key: key);

  @override
  _DetailLocationPageState createState() => _DetailLocationPageState();
}

class _DetailLocationPageState extends State<DetailLocationPage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.locationModel.NAMA, style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Color(0xffF9C784),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
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
                                style: TextStyle(color: Color(0xff485696), fontWeight: FontWeight.normal, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          padding: EdgeInsets.only(top: 25),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle
                                    ),
                                    child: Icon(Icons.description, color: Colors.white,),
                                  ),
                                  onTap: () async {
                                    var url = widget.locationModel.FILE;
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        shape: BoxShape.circle
                                    ),
                                    child: Icon(Icons.photo, color: Colors.white,),
                                  ),
                                  onTap: () async {
                                    var url = widget.locationModel.FOTO;
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        shape: BoxShape.circle
                                    ),
                                    child: Icon(Icons.play_arrow, color: Colors.white,),
                                  ),
                                  onTap: () async {
                                    var url = 'https://www.youtube.com/watch?v=' + widget.locationModel.VIDEO;
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
