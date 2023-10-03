import 'package:app_auth/pages/video_page.dart';
import 'package:app_auth/utilities/utilites.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class PreviewVideo extends StatefulWidget {
  const PreviewVideo({super.key});

  @override
  _PreviewVideoState createState() => _PreviewVideoState();
}

class _PreviewVideoState extends State<PreviewVideo> {
  double _currentSliderPrimaryValue = 0.0;
  int _videoDuration = 0;
  int _currentTime = 0;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.networkUrl(Uri.parse(
    //     'https://terabox.com/s/1_xScV_CotkYz0Q2nHcPVxg'))
      _controller = VideoPlayerController.asset("assets/images/video_test.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
            _videoDuration = _controller.value.duration.inSeconds;
            _controller.addListener(() {
              setState(() {
                _currentTime = _controller.value.position.inSeconds;
                _currentSliderPrimaryValue = Utility.reverseMapValue(
                    _currentTime.toDouble(),
                    0.0, _videoDuration.toDouble(),
                    0, 1.0
                );
                print("-----------------------------");
                print(_currentSliderPrimaryValue);
                //_currentSliderPrimaryValue = (_controller.value.position.inSeconds / _controller.value.duration.inSeconds'');
              });
            });
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : Container(
              child: CircularProgressIndicator(),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.fast_rewind, size: 40,),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, size: 40,),
                ),

                SizedBox(width: 20,),
                Icon(Icons.fast_forward, size: 40,)
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Slider(
                value : _currentSliderPrimaryValue,
                onChanged: (newValue) {
                  setState(() {
                    _currentSliderPrimaryValue = newValue;
                    _controller.seekTo(
                        Duration(
                            seconds: Utility.reverseMapValue(
                                newValue, 0.0, 1.0, 0, _videoDuration.toDouble()
                            ).toInt()
                        )
                    );
                    _controller.play();
                  });
                },
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      _controller.value.isInitialized ? Utility.convertTime(_currentTime)
                          : "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                      _controller.value.isInitialized ? Utility.convertTime(_videoDuration) :
                      "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
