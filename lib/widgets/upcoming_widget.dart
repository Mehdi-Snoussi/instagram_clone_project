import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/movie_page.dart';

class UpcomingWidget extends StatelessWidget {
  const UpcomingWidget({super.key, required this.movie});
  final List<dynamic> movie;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Upcoming Movies",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "See All",
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            for (int i = 0; i < movie.length; i++)
              InkWell(
                onTap: () {
                  Get.to(() => MoviePage(index: i,));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "${movie[i]["imageUrl"]}",
                      height: 180,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
          ]),
        )
      ],
    );
  }
}
