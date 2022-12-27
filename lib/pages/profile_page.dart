import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:second_app/pages/login_page.dart';
import 'package:second_app/providers/movies_provider.dart';

import '../providers/user_proviser.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0F111D),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(image: AssetImage("img/profile.jpg")),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Provider.of<UserProvider>(context).userName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Bookmarked Movies',
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  Provider.of<MoviesProvider>(context)
                      .bookmarkedList
                      .length
                      .toString(),
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 60,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                ProfileListTile(
                  title: "Change Password",
                  icon: Icons.lock_open_outlined,
                  onpress: () {},
                ),
                ProfileListTile(
                    title: "Settings", icon: Icons.alarm_add, onpress: () {}),
                ProfileListTile(
                    title: "Informations",
                    icon: Icons.dock_outlined,
                    onpress: () {}),
                ProfileListTile(
                    title: "Logout",
                    icon: Icons.arrow_back_outlined,
                    onpress: () {
                      Get.to(() => const LoginPage(),
                          transition: Transition.leftToRightWithFade);
                    })
              ],
            ),
          ),
        ));
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.onpress,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: Colors.yellow,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        trailing: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.withOpacity(0.1)),
          child: const Icon(
            Icons.chevron_right,
            size: 18,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
