import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../2.home/presentation/pages/base_screen/user_base_screen.dart';
import '../../../2.home/presentation/pages/base_screen/admin_base_screen.dart';
import 'Login_screen.dart';

class AuthenticationScreen extends StatelessWidget{
  final FirebaseAuth auth = FirebaseAuth.instance;
  AuthenticationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    if(auth.currentUser != null){
      return auth.currentUser?.email == 'e.services@gmail.com' ? const BaseScreenAdmin() : const BaseScreenUser();
    }else{
      return LoginScreen();
    }
  }
}

