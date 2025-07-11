import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr/screen/login.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorMessage;


Future<void> register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      String uid = userCredential.user!.uid;

       await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'email': emailController.text.trim(),
        'name': nameController.text.trim(),
        'password': passwordController.text.trim()
       });

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
      appBar :AppBar(title: Text("Sign in"), centerTitle: true,),
      body:Column(children: [
        TextField(controller: nameController,
        decoration:InputDecoration(
          labelText:'Name' , border: OutlineInputBorder()),),
          SizedBox(height: 20,),
        TextField(
        controller: emailController,
        decoration:InputDecoration(
          labelText:'Email' , border: OutlineInputBorder()),),
        SizedBox(height: 20,),
        TextField(
        controller: passwordController,
        decoration: InputDecoration(
          labelText:'Password' , border: OutlineInputBorder())),
        ElevatedButton(
        onPressed: register,
        child: Text("Sign in")),
        ElevatedButton(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));},
           child: Text("Log in"))],
      )
    );
  }
}