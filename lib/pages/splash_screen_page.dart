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
              color: const Color(0x00dedbed).withOpacity(0.46),
              gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(255, 171, 64, 1).withOpacity(0.99),
                  const Color.fromARGB(255, 255, 64, 64).withOpacity(0.99),
                  const Color.fromARGB(255, 223, 8, 8).withOpacity(0.99)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("img/insta.png"),
              width: 200,
              height: 150,
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              "Welcome to our app!",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Dangrek",
                color: Colors.black.withOpacity(0.53),
              ),
            ),
            SpinKitThreeInOut(
              size: 30,
              itemBuilder: (context, index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: index.isEven ? Colors.white : Colors.white),
                );
              },
            ),
          ],
        )
      ],
    ));
  }
}
