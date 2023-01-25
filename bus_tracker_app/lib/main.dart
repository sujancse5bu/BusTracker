import 'package:bus_tracker/ui/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Color.fromARGB(1, 255, 179, 158),
          primarySwatch: black),
      home: const MyHomePage(title: 'Home'),
    );
  }

  static const _pink = 0xFFFFB39E;

  static const MaterialColor black = MaterialColor(
    _pink,
    const <int, Color>{
      50: const Color(0xFFFFB39E),
      100: const Color(0xFFFFB39E),
      200: const Color(0xFFFFB39E),
      300: const Color(0xFFFFB39E),
      400: const Color(0xFFFFB39E),
      500: const Color(0xFFFFB39E),
      600: const Color(0xFFFFB39E),
      700: const Color(0xFFFFB39E),
      800: const Color(0xFFFFB39E),
      900: const Color(0xFFFFB39E),
    },
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Login'),
      ),
      body: const Login(),
    );
  }
}
