import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Drawer content widget
class NavigationDrawer extends StatefulWidget {
  final List<Widget> children;

  const NavigationDrawer({Key? key, required this.children}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff55433c),
      child: ListView(
        children: widget.children,
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
      body: _buildScreenBody(context, filterColor),
      bottomNavigationBar: Container(
        color: const Color(0xff221e1c),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 16,
          ),
          child: GNav(
            color: Color(0xff55423d),
            backgroundColor: Color(0xff221e1c),
            activeColor: Color(0xff221e1c),
            tabBackgroundColor: Color(0xff55423d),
            curve: Curves.bounceIn,
            iconSize: 25,
            gap: 8,
            padding: EdgeInsets.all(10),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite_border,
                text: "Favorites",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _buildScreenBody(
      BuildContext context, Color filterColor) {
    return SingleChildScrollView(
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
                  colorFilter: ColorFilter.mode(filterColor, BlendMode.srcATop),
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            4, // Replace '4' with the number of cards you want to display
                            (index) => _buildCustomCard1(index),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Frozen Beverages",
                            style: TextStyle(
                              color: Color(0xff6d6b69),
                              fontSize: 18,
                              fontFamily: "Gilroy-Medium",
                            ),
                          ),
                          Spacer(),
                          Text(
                            "See All",
                            style: TextStyle(
                              color: Color(0xff7B665E),
                              fontSize: 18,
                              fontFamily: "Gilroy-Medium",
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            4, // Replace '4' with the number of cards you want to display
                            (index) => _buildCustomCard2(index),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Kava and Bottled Beverages",
                            style: TextStyle(
                              color: Color(0xff6d6b69),
                              fontSize: 18,
                              fontFamily: "Gilroy-Medium",
                            ),
                          ),
                          Spacer(),
                          Text(
                            "See All",
                            style: TextStyle(
                              color: Color(0xff7B665E),
                              fontSize: 18,
                              fontFamily: "Gilroy-Medium",
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            4, // Replace '4' with the number of cards you want to display
                            (index) => _buildCustomCard3(index),
                          ),
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
    );
  }

  IntrinsicWidth _buildCustomCard1(int index) {
    final cardTexts = [
      "Coffee",
      "Beer",
      "Wine Bar",
      "Events",
    ];
    final cardImages = [
      "assets/images/coffee.png",
      "assets/images/beer.png",
      "assets/images/wine.png",
      "assets/images/events.png",
    ];

    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 35,
        decoration: const BoxDecoration(
          color: Color(0xff55433C),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              cardImages[index],
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 7),
            Text(
              cardTexts[index], // Use the text corresponding to the index
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Gilroy-Medium",
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  IntrinsicWidth _buildCustomCard2(int index) {
    final cardTexts1 = [
      "Chai Latte",
      "Matcha Latte",
      "Red Eye Cold",
      "Chai Latte",
    ];
    final cardTexts2 = [
      "\$85.00",
      "\$22.00",
      "\$60.00",
      "\$85.00",
    ];
    final cardImages = [
      "assets/images/coffee1.png",
      "assets/images/coffee2.png",
      "assets/images/coffee3.png",
      "assets/images/coffee1.png",
    ];

    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 180,
        width: 140,
        decoration: const BoxDecoration(
          color: Color(0xff55433C),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xff43332D),
              radius: 47,
              child: Image.asset(
                cardImages[index],
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              cardTexts1[index], // Use the text corresponding to the index
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Gilroy-Bold",
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              cardTexts2[index], // Use the text corresponding to the index
              style: const TextStyle(
                color: Colors.white60,
                fontFamily: "Gilroy-Medium",
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IntrinsicWidth _buildCustomCard3(int index) {
    final cardTexts1 = [
      "Coffee",
      "Coffee",
      "Coffee",
      "Coffee",
    ];
    final cardTexts2 = [
      "\$85.00",
      "\$22.00",
      "\$60.00",
      "\$85.00",
    ];
    final cardImages = [
      "assets/images/coffee2.png",
      "assets/images/coffee1.png",
      "assets/images/coffee2.png",
      "assets/images/coffee3.png",
    ];

    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 125,
        width: 215,
        decoration: const BoxDecoration(
          color: Color(0xff55433C),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xff43332D),
              radius: 47,
              child: Image.asset(
                cardImages[index],
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cardTexts1[index], // Use the text corresponding to the index
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Gilroy-Bold",
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  cardTexts2[index], // Use the text corresponding to the index
                  style: const TextStyle(
                    color: Colors.white60,
                    fontFamily: "Gilroy-Medium",
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
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
            _buildCustomBarButton("Settinges"),
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
            hintText: 'Coffee shop, beer & wine...',
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
