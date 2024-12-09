import 'dart:io';

import 'package:delicious_food/module/FoodCardModule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartitemWiget extends StatelessWidget {
  CartitemWiget(
      {Key? key, required this.Title, required this.subTitle, required this.Price, required this.ImagePath,required this.remove,required this.food})
      : super(key: key);
  void Function (FoodCard food) remove;
  FoodCard food;
  final String Title;
  final String subTitle;
  final String Price;
  final File ImagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(2),
          child: Row(
            children: [
              SizedBox(width: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.file(
                  ImagePath,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "${Title}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Text(
                    "\$${Price}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${subTitle}"),
                  IconButton(onPressed:(){remove(food);}, icon: Icon(Icons.remove_circle,)),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}

