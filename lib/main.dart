import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultAppTitle = 'Link TV';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: defaultAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Fira Code'
      ),
      // home: const MyHomePage(title: appTitle)
      routes: {
        MyClientPage.routeName : (context) => const MyClientPage()
      },
      onGenerateRoute: (settings) {
        if (settings.name == MyDesktopPage.routeName) {
          return MaterialPageRoute(
              builder: (context) {
                return const MyDesktopPage(title: defaultAppTitle);
              }
          );
        }
      },
      initialRoute: Platform.isAndroid ? MyClientPage.routeName : MyDesktopPage.routeName
    );
  }
}

class MyClientPage extends StatefulWidget {
  static const routeName = '/my_client';

  const MyClientPage({super.key});

  @override
  State<MyClientPage> createState() => _MyClientPageState();
}

class _MyClientPageState extends State<MyClientPage> {
  final _defaultImage = AssetImage('assets/images/default.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: _defaultImage, fit: BoxFit.fitHeight)
          ],
        )
      )
    );
  }
}

class MyDesktopPage extends StatefulWidget {
  static const routeName = '/my_desktop';

  const MyDesktopPage({super.key, required this.title});

  final String title;

  @override
  State<MyDesktopPage> createState() => _MyDesktopPageState();
}

class _MyDesktopPageState extends State<MyDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('desktop')
          ]
        )
      )
    );
  }
}
