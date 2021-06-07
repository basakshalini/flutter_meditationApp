import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/details_screens.dart';
import 'package:meditation_app/widget/bottom_nav_bar.dart';
import 'package:meditation_app/widget/category_card.dart';
import 'package:meditation_app/widget/search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meditation App',
        theme: ThemeData(
          fontFamily: "Cairo",
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor),

          // primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gives total height and weight of device
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavItem(
              title: "Today",
              svgScr: "assets/icons/calendar.svg",
            ),
            BottomNavItem(
              title: "All Excercises",
              svgScr: "assets/icons/gym.svg",
              isActive: true,
            ),
            BottomNavItem(
              title: "Settings",
              svgScr: "assets/icons/Settings.svg",
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            //height of container is 45% of total height
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                )),
          ),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: Color(0xFFF2BEA1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("assets/icons/menu.svg"),
                        ),
                      ),
                      Text(
                        "Good Morning \nShalini",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      SearchBar(),
                      Expanded(
                          child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            title: "Diet Recommendation",
                            svgSrc: "assets/icons/Hamburger.svg",
                            press: () {},
                          ),
                          CategoryCard(
                            title: "Kegel Exercises",
                            svgSrc: "assets/icons/Excrecises.svg",
                            press: () {},
                          ),
                          CategoryCard(
                              title: "Meditation",
                              svgSrc: "assets/icons/Meditation.svg",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return DetailsScreen();
                                  }),
                                );
                              }),
                          CategoryCard(
                              title: "Yoga",
                              svgSrc: "assets/icons/yoga.svg",
                              press: () {}),
                          CategoryCard(
                              title: "Nutrition",
                              svgSrc: "assets/icons/nutrition.svg",
                              press: () {}),
                          CategoryCard(
                              title: "Sleep Schedule",
                              svgSrc: "assets/icons/sleepsch.svg",
                              press: () {}),
                          CategoryCard(
                              title: "Water Level",
                              svgSrc: "assets/icons/waterlevel.svg",
                              press: () {}),
                          CategoryCard(
                              title: "Calorie Count",
                              svgSrc: "assets/icons/calorie (3).svg",
                              press: () {}),
                        ],
                      ))
                    ],
                  )))
        ],
      ),
    );
  }
}


// Container(
                        
//                       ),