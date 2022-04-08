import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  List data = [
    {
      'image':
          'https://images.pexels.com/photos/2058853/pexels-photo-2058853.jpeg?auto=compress&cs=tinysrgb&h=130',
      'date': 'Wednesday, April 6 2022',
      'title': 'A Very Tiring Day',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fringilla diam varius lorem suscipit, ut suscipit nisi molestie. Curabitur tincidunt fringilla purus, a molestie libero tempus eu. Vivamus ut orci justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a lectus vestibulum, fringilla tortor ut, tristique tellus. Donec pretium sed erat et fermentum. Cras congue, turpis ut tincidunt malesuada, nisi nunc varius eros, non placerat sem nisi et odio. Quisque ut fringilla elit. In ut magna a urna dictum venenatis. Sed et finibus lacus.'
    },
    {
      'image':
          'https://images.pexels.com/photos/2058853/pexels-photo-2058853.jpeg?auto=compress&cs=tinysrgb&h=130',
      'date': 'Wednesday, April 6 2022',
      'title': 'A Very Tiring Day',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fringilla diam varius lorem suscipit, ut suscipit nisi molestie. Curabitur tincidunt fringilla purus, a molestie libero tempus eu. Vivamus ut orci justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a lectus vestibulum, fringilla tortor ut, tristique tellus. Donec pretium sed erat et fermentum. Cras congue, turpis ut tincidunt malesuada, nisi nunc varius eros, non placerat sem nisi et odio. Quisque ut fringilla elit. In ut magna a urna dictum venenatis. Sed et finibus lacus.'
    },
    {
      'image':
          'https://images.pexels.com/photos/2058853/pexels-photo-2058853.jpeg?auto=compress&cs=tinysrgb&h=130',
      'date': 'Wednesday, April 6 2022',
      'title': 'A Very Tiring Day',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fringilla diam varius lorem suscipit, ut suscipit nisi molestie. Curabitur tincidunt fringilla purus, a molestie libero tempus eu. Vivamus ut orci justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a lectus vestibulum, fringilla tortor ut, tristique tellus. Donec pretium sed erat et fermentum. Cras congue, turpis ut tincidunt malesuada, nisi nunc varius eros, non placerat sem nisi et odio. Quisque ut fringilla elit. In ut magna a urna dictum venenatis. Sed et finibus lacus.'
    },
  ];

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
        title: Text('Diary'),
      ),
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
                        data[index]['image'],
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
                              Flexible(
                                child: ReadMoreText(
                                  data[index]['description'],
                                  trimLines: 2,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: 'show less',
                                  style: TextStyle(fontSize: 15.0),
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
