import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        color: const Color(0x00dedbed).withOpacity(0.46),
        gradient: LinearGradient(
          colors: [
            const Color.fromRGBO(255, 171, 64, 1).withOpacity(0.99),
            const Color.fromARGB(255, 255, 64, 64).withOpacity(0.99),
            const Color.fromARGB(255, 223, 8, 8).withOpacity(0.99)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45),
            child: Image.asset(
              "img/insta.png",
              height: 170,
              width: 170,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, top: 1, left: 20),
            alignment: Alignment.center,
            child: const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      )),
    );
  }
}
