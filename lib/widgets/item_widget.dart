import 'dart:io';

import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
 ItemWidget({super.key,required this.Title,required this.subTitle,required this.Price,required this.ImagePath}) ;

  final String Title;
  final String subTitle;
  final String Price;
  final File ImagePath;
  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.file(
                widget.ImagePath,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
               Text(
                widget.Title,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
               Text(
                widget.subTitle,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
               Text("\$"+widget.Price,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

            ],

          ),
        ),
      ),
    );
  }
}
