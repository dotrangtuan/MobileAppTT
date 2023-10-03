import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
        ),
      //padding: const EdgeInsets.all(8),
      //color: Colors.teal[100],
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/back.jpg", fit: BoxFit.cover),
          Center(
            child: Icon(
              Icons.play_circle,
              size: 44, // Kích thước của biểu tượng
              color: Colors.grey[300]?.withOpacity(0.8), // Màu của biểu tượng
            ),
          ),
          const Positioned(
            bottom: 0, // Đặt bottom thành 0 để đặt Row ở dưới cùng
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "21/09/2023",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "18:09",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )

        ],
      ),

    );
    throw UnimplementedError();
  }

}