import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailFromUrlWidget extends StatefulWidget {
  final String videoUrl;

  VideoThumbnailFromUrlWidget({required this.videoUrl});

  @override
  _VideoThumbnailFromUrlWidgetState createState() =>
      _VideoThumbnailFromUrlWidgetState();
}

class _VideoThumbnailFromUrlWidgetState
    extends State<VideoThumbnailFromUrlWidget> {
  late Future<Uint8List?> _thumbnail;

  @override
  void initState() {
    super.initState();
    _thumbnail = _generateThumbnail();
  }

  Future<Uint8List?> _generateThumbnail() async {
    // Tải video từ URL
    final response = await http.get(Uri.parse(widget.videoUrl));
    final videoBytes = response.bodyBytes;

    // Tạo thumbnail từ video bytes
    final thumbnail = await VideoThumbnail.thumbnailData(
      video: videoBytes.toString(),
      imageFormat: ImageFormat.JPEG,
      maxWidth: 200, // Chiều rộng tối đa của thumbnail
      quality: 25,   // Chất lượng của thumbnail (1-100)
    );

    return thumbnail;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _thumbnail,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Hiển thị tiến trình khi đang tạo thumbnail.
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Image.memory(
            snapshot.data!,
            fit: BoxFit.cover, // Thay đổi cách thumbnail được hiển thị (có thể thay đổi)
          );
        }
      },
    );
  }
}
