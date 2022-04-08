import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FilmPage extends StatefulWidget {
  const FilmPage({Key? key}) : super(key: key);

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  final String url =
      'http://api.themoviedb.org/3/movie/popular?api_key=3fb1c922f2a39a927baf7e48e7deb073';

  final String image_url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/";

  List data = [];

  Future<String> getData() async {
    var res =
        await http.get(Uri.parse(url), headers: {'accept': 'application/json'});
    setState(() {
      var content = json.decode(res.body);
      data = content['results'];
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
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ListTile(
                      leading: Image.network(
                        this.image_url + data[index]['poster_path'],
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        data[index]['title'],
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Language : ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                data[index]['original_language'],
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Vote : ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data[index]['vote_average'].toString()),
                              Icon(
                                Icons.star,
                                size: 20.0,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Popular : ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                data[index]['popularity'].toString(),
                                softWrap: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
