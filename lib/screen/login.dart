import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screen/signin.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorMessage;
@override
void initState() {
  emailController.text = "zehra@gmail.com";
  passwordController.text = "123456";
  logIn();
  super.initState();
  
}
  Future<void> logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar :AppBar(title: Text("Login"), centerTitle: true,),
      body:Column(children: [
        TextField(
        controller: emailController,
        decoration:InputDecoration(
          labelText:'Email' ,
          border: OutlineInputBorder()),),
        SizedBox(height: 20,),
        TextField(
        controller: passwordController,
        decoration: InputDecoration(
          labelText:'Password' ,
          border: OutlineInputBorder())),
        ElevatedButton(
        onPressed: logIn,
        child: Text("Login")),
        ElevatedButton(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));},
           child: Text("Sign in"))],
      )
    );
  }
}