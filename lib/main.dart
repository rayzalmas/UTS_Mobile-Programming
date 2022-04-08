// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:uts/pages/auth/login.dart';
import 'package:uts/pages/collection/collection.dart';
import 'package:uts/pages/diary/diary.dart';
import 'package:uts/pages/home/home.dart';
import 'package:uts/pages/library/library.dart';
import 'package:uts/pages/profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: HomePage(),
      initialRoute: '/',
      routes: {
        '/collection': (context) => const CollectionPage(),
        '/diary': (context) => const DiaryPage(),
        '/library': (context) => const LibraryPage(),
        '/profile': (context) => const ProfilePage(),
        '/login': (context) => const LoginPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
