import 'package:delicious_food/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../Admin/admin_login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Material(
              elevation: 5,
              child: Center(
                child: Container(
                  child: Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminLoginScreen()));
              },
              child: Material(
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: 300,
                  child: Text("Admin Panel",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

                ),
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                final auth=FirebaseAuth.instance;
                auth.signOut().then((value){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                });
              },
              child: Material(
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: 300,
                  child: Text("Log out",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
