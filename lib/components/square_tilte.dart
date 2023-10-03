import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareTitle extends StatelessWidget {

  Function() onTap;
  final String imagePath;
  final String title;

  SquareTitle({super.key, required this.imagePath, required this.onTap, required this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset(
                  imagePath,
                  height: 30,
              ),
              const SizedBox(width: 10,),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              )
          ],
        ),
      ),
    );

  }

}