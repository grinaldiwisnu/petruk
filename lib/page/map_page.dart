import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petruk/bloc/home/bloc.dart';
import 'package:petruk/page/detail_location_page.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  HomeBloc homeBloc;
  final Map<String, Marker> _markers = {};
  GoogleMapController mapController;

  final LatLng _center = const LatLng(-7.822840, 112.011864);

  void _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    mapController = controller;
    homeBloc.dataList.forEach((data) {
      final marker = Marker(
        markerId: MarkerId(data.NAMA),
        position: LatLng(data.KOORDINAT.latitude, data.KOORDINAT.longitude),
        infoWindow: InfoWindow(
          title: data.NAMA,
          snippet: data.LOKASI,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailLocationPage(
                        locationModel: data,
                      ))),
        ),
      );
      _markers[data.NAMA] = marker;
    });
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
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: IconButton(
                        color: Color(0xffFC7A1E),
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Color(0xffFC7A1E),
                onPressed: () {},
                child: Icon(Icons.help),
              ),
            ),
          );
        },
      ),
    );
  }
}
