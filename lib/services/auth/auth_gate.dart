import 'package:chatapp/services/auth/loginorregister.dart';
import 'package:chatapp/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
        // user has logged in
        if(snapshot.hasData){
          return  HomePage();
        } 
        // user has not logged in
        else{
          return const Loginorregister();
        }
      },)
    );
  }
}