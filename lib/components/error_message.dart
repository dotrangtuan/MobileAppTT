import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {

  final String errorMessage;
  const ErrorMessage({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 10, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.error, color: Colors.red[800], size: 16,),
          const SizedBox(width: 10),
          Text(
            errorMessage,
            style: TextStyle(
              color: Colors.red[800],
              fontSize: 14
            ),
          )
        ],
      ),
    );
  }

}