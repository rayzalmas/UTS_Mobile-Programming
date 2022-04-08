import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  final String url =
      "https://spotify23.p.rapidapi.com/playlist_tracks/?id=37i9dQZF1DX1uHCeFHcn8X&limit=20";

  List data = [];

  Future<String> getData() async {
    var res = await http.get(
      Uri.parse(url),
      headers: {
        'X-RapidAPI-Host': 'spotify23.p.rapidapi.com',
        'X-RapidAPI-Key': 'a68a479e16mshe19abb284406548p17a7a9jsn76ee710da089'
      },
    );
    setState(() {
      var content = json.decode(res.body);
      data = content['items'];
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
                        data[index]['track']['album']['images'][0]['url'],
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        data[index]['track']['name'],
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  data[index]['track']['album']['artists'][0]
                                      ['name'],
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15.0,
                                  ),
                                ),
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
