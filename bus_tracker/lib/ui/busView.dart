import 'package:bus_tracker/models/Bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        body: Container(child: const Text("Test Bus View")));
  }
}
