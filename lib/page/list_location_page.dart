import 'package:flutter/material.dart';
import 'package:petruk/model/location_model.dart';

import 'detail_location_page.dart';

class ListLocationPage extends StatelessWidget {
  final List<LocationModel> listLocation;

  const ListLocationPage({Key key, this.listLocation}) : super(key: key);

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
      backgroundColor: Color(0xffF9C784),
      body: Container(
        height: MediaQuery.of(context).size.height - 56,
        child: ListView.builder(
          itemCount: this.listLocation.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 25),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xff485696)),
                  color: Colors.white),
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              child: ListTile(
                title: Text(
                  this.listLocation[index].NAMA + "(${this.listLocation[index].KERAJAAN})",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xff485696)),
                ),
                subtitle: Text(this.listLocation[index].LOKASI),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailLocationPage(
                              locationModel: this.listLocation[index],
                            ))),
              ),
            );
          },
        ),
      ),
    );
  }
}
