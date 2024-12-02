import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
 ItemWidget({super.key,required this.Title,required this.subTitle,required this.Price,required this.ImagePath}) ;

  final String Title;
  final String subTitle;
  final int Price;
  final String ImagePath;
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
              Image.asset(
                widget.ImagePath.toString(),
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
               Text(
                "\$"+widget.Price.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
