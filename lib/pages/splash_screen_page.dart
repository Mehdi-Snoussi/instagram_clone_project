import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:second_app/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xFF0F111D),
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(199, 95, 95, 98).withOpacity(0.99),
                  const Color.fromARGB(117, 52, 53, 59).withOpacity(0.99),
                  const Color.fromARGB(255, 4, 6, 11).withOpacity(0.99)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("img/login.png"),
              width: 200,
              height: 150,
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Welcome to our app!",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Dangrek",
                color: Colors.white,
              ),
            ),
            SpinKitThreeInOut(
              size: 30,
              itemBuilder: (context, index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: index.isEven ? Colors.red : Colors.white),
                );
              },
            ),
          ],
        )
      ],
    ));
  }
}
