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
        color: const Color(0xFF0F111D),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(199, 95, 95, 98).withOpacity(0.99),
            const Color.fromARGB(117, 52, 53, 59).withOpacity(0.99),
            const Color.fromARGB(255, 4, 6, 11).withOpacity(0.99)
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
              "img/login.png",
              height: 170,
              width: 170,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, top: 1, left: 20),
            alignment: Alignment.center,
            child: const Text(
              "CornMovies",
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
