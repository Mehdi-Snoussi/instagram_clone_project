import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/widgets/upcoming_widget.dart';
import '../providers/user_proviser.dart';
import '../widgets/new_movies_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F111D),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello ${Provider.of<UserProvider>(context).userName}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        'What to Watch?',
                        style: TextStyle(color: Colors.white54),
                      )
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      "img/profile.jpg",
                      height: 60,
                      width: 60,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 55,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: const Color(0xFF292B37),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.white54,
                    size: 30,
                  ),
                  Container(
                    width: 280,
                    margin: const EdgeInsets.only(left: 5),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white54)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            const UpcomingWidget(),
            const SizedBox(height: 40),
            const NewMoviesWidget(),
          ]),
        ),
      ),
    );
  }
}
