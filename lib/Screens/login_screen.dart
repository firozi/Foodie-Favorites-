import 'package:delicious_food/Screens/sign_up_screen.dart';
import 'package:delicious_food/bottem_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email=TextEditingController();

  final password=TextEditingController();

late String Email;

late String Password;

  void LogIn()async{
    Email=email.text;
    Password=password.text;
    if(Email==""||Password==""){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter email and password")));
      return;
    }
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: Email, password: Password);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottemNavBar()));
    }on FirebaseException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error ${e.code}")));
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
                  "Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color:
                  Colors.white),
                ),
                TextField(
                  controller: email,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                    hintText: "Enter email",
                    prefixIcon: Icon(Icons.email_outlined)
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: password,
                  obscureText: true,
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
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(onPressed: (){}, child: Text("Forget password ?",style: TextStyle(color:Colors.white),)),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: (){LogIn();}, child: Text("Login"),),
                TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));}, child: Text("Don't have an account, Sign up",style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
