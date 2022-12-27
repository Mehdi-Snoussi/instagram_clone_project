import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/widgets/actors_widget.dart';
import '../providers/movies_provider.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key, required this.index});

  final int index;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F111D),
      body: Consumer<MoviesProvider>(builder: (context, value, child) {
        return Stack(
          children: [
            Opacity(
              opacity: 0.4,
              child: Image.network(
                "${value.list[widget.index]["imageUrl"]}",
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
                                "${value.list[widget.index]["poster"]}",
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
                                  color: value.list[widget.index]
                                              ["bookmarked"] ==
                                          true
                                      ? Colors.green
                                      : Colors.red,
                                  boxShadow: [
                                    BoxShadow(
                                      color: value.list[widget.index]
                                                  ["bookmarked"] ==
                                              true
                                          ? Colors.green.withOpacity(0.5)
                                          : Colors.red.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                    )
                                  ]),
                              child: InkWell(
                                onTap: () {
                                  Provider.of<MoviesProvider>(context,
                                          listen: false)
                                      .onPressedBookmark(widget.index);
                                },
                                child: Icon(
                                  value.list[widget.index]["bookmarked"] == true
                                      ? Icons.check
                                      : Icons.add,
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
                            "${value.list[widget.index]["name"]}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${value.list[widget.index]["description"]}",
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
                    ActorsWidget(
                      actors: value.list[widget.index]["actors"],
                    ),
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
