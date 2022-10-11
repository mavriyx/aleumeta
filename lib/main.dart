import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aleumeta/auth/login_page.dart';
import 'package:aleumeta/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MaterialApp(
    home: Splash()
    ),
  );
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key:key);

  @override
  SplashPage createState() => SplashPage();
}

class SplashPage extends State<Splash> {

  @override
  void initState() {
    // TODO: implement inState
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/aleumeta_logo.PNG', height:550),
            const SizedBox(height:60,),
            if(Platform.isIOS)
              const CupertinoActivityIndicator(
              radius: 27,
              )
            else
            const CircularProgressIndicator(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}


