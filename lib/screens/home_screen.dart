import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_svg/svg.dart';

// Drawer content widget
class NavigationDrawer extends StatelessWidget {
  final List<Widget> children;

  const NavigationDrawer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff55433c),
      child: ListView(
        children: children,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = "HomeScreen";

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    const Color filterColor = Color.fromARGB(153, 15, 12, 10);

    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(),
      backgroundColor: const Color(0xff55433c),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ColorFiltered(
                    colorFilter:
                        const ColorFilter.mode(filterColor, BlendMode.srcATop),
                    child: Image.asset(
                      "assets/images/coffee-beans-dark-background-top-view-coffee-concept-banner_1220-6300 1.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/image 2.png",
                              width: 60,
                              height: 60,
                            ),
                            const Text(
                              "COFFEE\nTASTE!",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Gilroy-Bold',
                                fontSize: 14,
                                wordSpacing: 2,
                                letterSpacing: 5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/Ellipse 38930.png",
                                width: 55,
                                height: 55,
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                "assets/svg/Frame 12614.svg",
                                width: 9.5,
                                height: 9.5,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Hi, ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 43,
                                fontFamily: "Gilroy-Regular",
                              ),
                            ),
                            Text(
                              "Omar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 43,
                                fontFamily: "Gilroy-Bold",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        _buildSearchTextField(),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff55433C),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          constraints: BoxConstraints(
                            minHeight: 30,
                            minWidth: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Hiiiiiiii"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  NavigationDrawer _buildDrawer() {
    return NavigationDrawer(
      children: [
        Column(
          children: [
            Container(
              width: 350,
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xff392c26),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/Ellipse 38930.png",
                    width: 200,
                    height: 200,
                  ),
                  const Text(
                    "Omar Ameer",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Gilroy-Bold",
                      fontSize: 25,
                    ),
                  ),
                  const Text(
                    "omar.ameer244@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Gilroy-Medium",
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _buildCustomBarButton("Home"),
            _buildCustomBarButton("Favorites"),
            _buildCustomBarButton("Workflow"),
            _buildCustomBarButton("Updates"),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color(0xff15120f),
              thickness: 1.0, // Specify the thickness of the line
              indent: 20.0, // Specify the indent or margin on the start side
              endIndent: 20.0, // Specify the indent or margin on the end side
            ),
            const SizedBox(
              height: 6,
            ),
            _buildCustomBarButton("Plugines"),
            _buildCustomBarButton("Notifications"),
          ],
        ),
      ],
    );
  }

  Padding _buildCustomBarButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 14,
      ),
      child: Container(
        width: 250,
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xff15120f),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "Gilroy-Regular",
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }

  Container _buildSearchTextField() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(
            0xFF272220), // Replace with the desired color code (272220)
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                child: SvgPicture.asset(
                  'assets/svg/Union.svg', // Replace with the correct asset path
                  // ignore: deprecated_member_use
                  color: const Color(0xff453731),
                ),
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                child: SvgPicture.asset(
                  'assets/svg/editSearch.svg', // Replace with the correct asset path
                  // ignore: deprecated_member_use
                  color: const Color(0xff453731),
                ),
              ),
            ),
            hintText: 'Search',
            border: InputBorder.none,
            hintStyle: const TextStyle(
              color: Color(0xff453731),
              fontSize: 18,
            ),
          ),
          style: const TextStyle(
            color: Color(0xff453731),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
