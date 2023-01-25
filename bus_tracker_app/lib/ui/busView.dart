import 'package:bus_tracker/models/Bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class BusView extends StatefulWidget {
  final Bus bus;

  const BusView({super.key, required this.bus});

  @override
  State<BusView> createState() => _BusViewState();
}

class _BusViewState extends State<BusView> {
  late Bus bus;

  @override
  void initState() {
    super.initState();
    bus = Bus.getBusses()[0];

    // after api calls
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(bus.title),
        ),
        body: Container(
            child: FlutterMap(
          options: MapOptions(
            center: LatLng(22.697711453882913, 90.35350561733077),
            zoom: 13.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(51.5, -0.09),
                  builder: (ctx) => Container(
                    child: Icon(Icons.location_on, color: Colors.red, size: 50),
                  ),
                ),
              ],
            ),
          ],
        )));
  }
}
