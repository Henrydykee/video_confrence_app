


import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';


makeIconButtons(IconData icon , Color color) => Container(
    margin: EdgeInsets.all(2),
    decoration: const ShapeDecoration(
      color: Colors.white,
      shape: CircleBorder(),
    ),
    child: IconButton(
      icon: Icon(icon, color: color ?? Colors.black54),
      iconSize: 20,
      onPressed: null,
    )
);

RaisedButton finishButton(String label, Function fun) {
  return RaisedButton(
    onPressed: fun,
    textColor: Colors.white,
    color: Color.fromRGBO(50, 62, 72, 1.0),
    padding: const EdgeInsets.all(19.0),
    child: Text(label, style: TextStyle(fontSize: 11, color: Colors.white)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}

makeIconColumnButtons(IconData icon, String title,Color color) => Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Column(
    children: [
      makeIconButtons(icon,color),
      Text(title, style: TextStyle(fontSize: 9, color:color,))
    ],
  ),
);