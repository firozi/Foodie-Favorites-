import 'package:flutter/material.dart';

import 'add_fooditem.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Go back"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        width:double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Home Admin",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddFooditem()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(15),
                height: 150,
                child: Row(
                  children: [
                    Image.asset("images/salad4.png"),
                    Text("Add Food Items",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  ],
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
