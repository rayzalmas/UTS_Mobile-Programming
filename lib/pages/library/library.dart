import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final String url =
      'https://api.pexels.com/v1/collections/8xntbhr?type=photos&per_page=20';

  List data = [];

  Future<String> getData() async {
    var res = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader:
          '563492ad6f91700001000001818f40ec184941328e1eef2a639f6cd4',
    });
    setState(() {
      var content = json.decode(res.body);
      data = content['media'];
    });
    return 'success!';
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Library'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: data == null ? 0 : data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(3, 3),
                      )
                    ],
                  ),
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: Image.network(
                    data[index]['src']['medium'],
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.grey),
                  margin: EdgeInsets.fromLTRB(5, 163, 5, 5),
                  padding: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    data[index]['photographer'],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
