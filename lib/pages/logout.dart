// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_fenix/login.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();

}

class _LogoutState extends State<Logout> {
  FirebaseAuth auth = FirebaseAuth.instance;
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(Icons.arrow_back, size:32),
              label: Text(
                'Sign Out',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: ()async {
                await FirebaseAuth.instance.signOut().then((value) =>Navigator.push(context, MaterialPageRoute(builder: (context){
            return Login();
                })));
              },
            )
            ),
          );
  }
}