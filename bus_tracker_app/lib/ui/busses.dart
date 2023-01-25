import 'package:bus_tracker/models/Bus.dart';
import 'package:bus_tracker/models/helper/utils.dart';
import 'package:bus_tracker/ui/busView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Busses extends StatefulWidget {
  const Busses({super.key});

  @override
  State<Busses> createState() => _BussesState();
}

class _BussesState extends State<Busses> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  final List<Bus> busList = Bus.getBusses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buses'),
      ),
      body: Container(
        decoration: Utils.gradientDecoration(),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select Route',
                  style: Utils.mainTextStyle(),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: fromController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'From',
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: toController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'To',
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upcoming Schedules',
                  style: Utils.mainTextStyle(),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: busList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return busCard(busList[index], context);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget busCard(Bus bus, BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Card(
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 20, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(bus.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BusView(
                      bus: bus,
                    )))
      },
    );
  }
}
