import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_explorer/Colors/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:space_explorer/data.dart';

import '../Components/planet_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! bottom nav bar
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 24, left: 16, right: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Container(
          height: 78,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                'Assets/Svg/home.svg',
                width: 28,
                height: 28,
                color: AppColors.yellow,
              ),
              SvgPicture.asset(
                'Assets/Svg/explore.svg',
                width: 28,
                height: 28,
                color: AppColors.yellow,
              ),
              SvgPicture.asset(
                'Assets/Svg/heart.svg',
                width: 28,
                height: 28,
                color: AppColors.yellow,
              ),
              SvgPicture.asset(
                'Assets/Svg/profile.svg',
                width: 28,
                height: 28,
                color: AppColors.yellow,
              ),
            ],
          ),
        ),
      ),
      //body
      body: Container(
        padding: EdgeInsets.only(left: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.purpleBlue,
              AppColors.pink,
              AppColors.brown.withOpacity(0.88),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*  set 90 height for Redmi
            SizedBox(height: 90),
            //! Title
            Text(
              "Explore",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
            ),
            Text(
              "Solar System",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
            ),
            SizedBox(height: 20),
            //! Planets Slider
            CarouselSlider.builder(
              itemCount: planetNumbers.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Planet(
                      key: ValueKey(itemIndex),
                      planetImg: planetImages[itemIndex],
                      planetName: planetNames[itemIndex],
                      planetNumber: planetNumbers[itemIndex],
                    );
                  },
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 497,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                scrollDirection: Axis.horizontal,
                padEnds: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
