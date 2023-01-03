import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  void initState() {
    Provider.of<MoviesProvider>(context, listen: false).getBookmarkedList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F111D),
      body: Consumer<MoviesProvider>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Bookmarked Movies",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(children: [
                    for (int i = 0; i < value.bookmarkedList.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "${value.bookmarkedList[i]["poster"]}",
                                height: 70,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "${value.bookmarkedList[i]["name"]}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 22),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Provider.of<MoviesProvider>(context,
                                        listen: false)
                                    .onPressedBookmark2(i);

                                Provider.of<MoviesProvider>(context,
                                        listen: false)
                                    .getBookmarkedList();
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 23,
                              ),
                            )
                          ],
                        ),
                      )
                  ]),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
