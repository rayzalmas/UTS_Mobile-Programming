// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:uts/pages/profile/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HomeArguments;
    print(args.isLoggedIn);
    setState(() {
      isLoggedIn = (args.isLoggedIn ? args.isLoggedIn : false);
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Home'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, (isLoggedIn) ? '/profile' : '/login');
              },
              icon: Icon(Icons.person),
            )
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     setState(() {
        //       isLoggedIn = !isLoggedIn;
        //     });
        //   },
        //   backgroundColor: Colors.blue,
        //   child: Icon(
        //     (isLoggedIn) ? Icons.logout_rounded : Icons.login_rounded,
        //   ),
        // ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text('Collection'),
                onPressed: () {
                  Navigator.pushNamed(context, '/collection');
                },
              ),
              margin: const EdgeInsets.all(5),
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text('Diary'),
                onPressed: () {
                  Navigator.pushNamed(context, '/diary');
                },
              ),
              margin: const EdgeInsets.all(5),
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text('Library'),
                onPressed: () {
                  Navigator.pushNamed(context, '/library');
                },
              ),
              margin: const EdgeInsets.all(5),
            ),
            Container(
              height: 50,
              child: Text(''),
              margin: const EdgeInsets.all(5),
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text('Is loggedIn: ' + isLoggedIn.toString()),
                onPressed: () {},
              ),
              margin: const EdgeInsets.all(5),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
