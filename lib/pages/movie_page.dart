import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:second_app/widgets/actors_widget.dart';

import '../providers/movies_provider.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key, required this.movId});

  final String movId;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    Provider.of<MoviesProvider>(context, listen: false)
        .getMovieById(widget.movId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F111D),
      body: Consumer<MoviesProvider>(builder: (context, value, child) {
        return 
           value.isLoading2 ? 
          const SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
            duration: Duration(milliseconds: 1500)
          )
        : Stack(
          children: [
            Opacity(
              opacity: 0.4,
              child: Image.network(
                "${value.movieById["imageUrl"]}",
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                  ),
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                "${value.movieById["poster"]}",
                                height: 250,
                                width: 180,
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 50, top: 70),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.red,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.red.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                    )
                                  ]),
                              child: InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${value.movieById["name"]}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                           "${value.movieById["description"]}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ActorsWidget(actors: value.movieById["actors"],),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
