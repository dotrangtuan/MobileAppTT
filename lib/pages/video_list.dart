import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/video_card.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: GridView.count(
          primary: false,
          //padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1 / 0.7,
          children: const <Widget>[
            VideoCard(),
            VideoCard(),
            VideoCard(),
            VideoCard(),
            VideoCard(),
            VideoCard(),
            VideoCard(),
            VideoCard(),
            VideoCard(),
            VideoCard(),
          ],
        )
      )
    );
    // TODO: implement build
  }

}