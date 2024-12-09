import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  void dispose() {
    reSetEmail.dispose(); // Dispose the controller when no longer needed
    super.dispose();
  }

  final reSetEmail=TextEditingController();
 late  final email;
  void ReSet()async{

    email=reSetEmail.text;
    if(email==''||email==null){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("failed to reset , Incorrect email ")));
      return;
    }
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("done, check your email ")));
      return;
    }on FirebaseException catch(e){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("failed to reset , check your email ${e.code}")));
      return;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          "Reset your password",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: reSetEmail,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter email',
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),

                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {ReSet();},
                child: Text(
                  "Reset",
               style: TextStyle(color: Colors.black),
                ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white, // Background color of the button
              ),)
          ],
        ),
      ),
    );
  }
}
