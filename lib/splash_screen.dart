import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/utils/colors.dart';
import 'core/widgets/default_screen.dart';
import 'features/login/presentation/pages/Login_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds:3), (){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      body: const Center(child: Image(image: AssetImage('assets/images/splash_image.png')),),
    );
  }
}