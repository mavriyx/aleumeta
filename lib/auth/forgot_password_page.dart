  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

  class ForgotPasswordPage extends StatefulWidget {
    const ForgotPasswordPage({Key? key}) : super(key: key);
  
    @override
    State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
  }
  
  class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
    
    final _emailController = TextEditingController();

    @override
    void dispose() {
      _emailController.dispose();
      // TODO: implement dispose
      super.dispose();
    }

    Future passwordReset() async{
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text.trim());
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Құпия сіздің поштаңызда'),
              );
            }
        );
      } on FirebaseAuthException catch (e) {
        print(e);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(e.message.toString()),
              );
            }
        );
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Email-іңізге кіріңіз',
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade900),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  hintText: 'Электорндық Пошта',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),

            SizedBox(height: 10),

            MaterialButton(
              onPressed: passwordReset,
              child: Text('Құпиясәзіңізді жазыңыз',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.red[900],
            ),
          ],
        ),
      );
    }
  }
  