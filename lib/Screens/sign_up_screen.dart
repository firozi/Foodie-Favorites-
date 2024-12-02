import 'package:delicious_food/bottem_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
   SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final  name=TextEditingController();

   final  email=TextEditingController();

   final  password=TextEditingController();

late String Name;

late String Password;

late String Email;

 void SignUp()async{
    Name=name.text;
    Password=password.text;
    Email=email.text;
     if(Name==""||Password==""||Email==""){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something is Missing...try again. ")));
       return;
     }
     try{
       final userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: Email, password: Password);
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered Successfully")));
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottemNavBar()));
     }on FirebaseException catch(e){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error , ${e.code}")));
     }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            height: 400,
            width: 350,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sign up",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color:
                  Colors.white),
                ),
                TextField(
                  controller: name,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Name",
                      prefixIcon: Icon(Icons.person_outline)
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: email,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined)
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: password,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Password",
                        prefixIcon: Icon(Icons.key)
                    )
                ),

                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: (){SignUp();}, child: Text("Sign Up"),),
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Already have an account ? login",style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
