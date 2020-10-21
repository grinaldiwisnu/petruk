import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Peta Persebaran Peninggalan",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 1,
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height - 56,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: PhotoView(
                  enableRotation: true,
                  backgroundDecoration: BoxDecoration(color: Color(0xffF9C784)),
                  initialScale: PhotoViewComputedScale.contained * 1,
                  minScale: PhotoViewComputedScale.contained * 1,
                  imageProvider: AssetImage("assets/peta.jpeg"),
                )),
          ],
        ),
      ),
      backgroundColor: Color(0xffF9C784),
    );
  }
}
