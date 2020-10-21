import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petruk/bloc/home/bloc.dart';
import 'package:petruk/model/location_model.dart';
import 'package:petruk/page/detail_location_page.dart';
import 'package:petruk/page/guide_page.dart';
import 'package:petruk/page/list_location_page.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  HomeBloc homeBloc;
  final Map<String, Marker> _markers = {};
  GoogleMapController mapController;
  List<LocationModel> listInMuseum = List<LocationModel>();
  List<LocationModel> listGeneng = List<LocationModel>();

  final LatLng _center = const LatLng(-7.822840, 112.011864);

  void _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    mapController = controller;
    for (int i = 0; i < homeBloc.dataList.length; i++) {
      BitmapDescriptor icon;
      if (homeBloc.dataList[i].DISPLAY == '1') {
        if (homeBloc.dataList[i].TIPE == '0') {
          icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(24, 24)), 'assets/thailand.png');
        } else if (homeBloc.dataList[i].TIPE == '1') {
          icon =
              await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(24, 24)), 'assets/inscription.png');
        } else if (homeBloc.dataList[i].TIPE == '2') {
          icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(24, 24)), 'assets/museum.png');
        }

        final marker = Marker(
          markerId: MarkerId(homeBloc.dataList[i].NAMA),
          position: LatLng(homeBloc.dataList[i].KOORDINAT.latitude, homeBloc.dataList[i].KOORDINAT.longitude),
          icon: icon,
          infoWindow: InfoWindow(
            title: homeBloc.dataList[i].NAMA + "(" + homeBloc.dataList[i].KERAJAAN + ")",
            snippet: homeBloc.dataList[i].LOKASI,
            onTap: () {
              if (homeBloc.dataList[i].IS_GROUP == '1') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListLocationPage(
                              listLocation: listInMuseum,
                            )));
              } else if (homeBloc.dataList[i].IS_GROUP == '2') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListLocationPage(
                              listLocation: listGeneng,
                            )));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailLocationPage(
                              locationModel: homeBloc.dataList[i],
                            )));
              }
            },
          ),
        );
        _markers[homeBloc.dataList[i].NAMA] = marker;
      } else {
        if (homeBloc.dataList[i].IS_GROUP == '1') {
          listInMuseum.add(homeBloc.dataList[i]);
        } else if (homeBloc.dataList[i].IS_GROUP == '2') {
          listGeneng.add(homeBloc.dataList[i]);
        }
      }
    }
  }

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.dispatch(LoadHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is HomeLoadedState) {
          _onMapCreated(mapController);
        }
      },
      child: BlocBuilder(
        bloc: homeBloc,
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                    markers: _markers.values.toSet(),
                    zoomGesturesEnabled: true,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: IconButton(
                            color: Color(0xffFC7A1E),
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFC7A1E),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: IconButton(
                            color: Color(0xffFC7A1E),
                            icon: Icon(Icons.help_outline, color: Colors.white,),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => GuidePage()));
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
