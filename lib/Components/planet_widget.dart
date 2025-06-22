import 'package:flutter/material.dart';
import 'package:space_explorer/Constants/planet_color.dart';
import '../Colors/app_colors.dart';
import '../Screens/details_screen.dart';

class Planet extends StatefulWidget {
  final String planetImg;
  final String planetName;
  final String planetNumber;
  const Planet({
    super.key,
    required this.planetImg,
    required this.planetName,
    required this.planetNumber,
  });

  @override
  State<Planet> createState() => _PlanetState();
}

class _PlanetState extends State<Planet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 497,
      width: 325,
      child: Stack(
        children: [
          //! Card
          Positioned(
            top: 200,
            left: 0,
            right: 35,
            child: SizedBox(
              height: 265,
              child: GestureDetector(
                //? navigating to details screen
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          DetailsScreen(
                            planetImg: widget.planetImg,
                            planetName: widget.planetName,
                            planetNumber: widget.planetNumber,
                          ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                    ),
                  );
                },

                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 15, top: 25, bottom: 10),
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Explore",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: planetColor[widget.planetName],
                            fontFamily: 'Raleway',
                          ),
                        ),
                        Text(
                          widget.planetName,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: planetColor[widget.planetName],
                            fontFamily: 'Raleway',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lorem ipsum dolor sit amet consectetur. Est lorem a nec dignissim ornare eget suspendisse tempus. ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray,
                            fontFamily: 'Raleway',
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          //! PlanetNulber
          Positioned(
            right: 40,
            bottom: 95,
            child: Image.asset(widget.planetNumber, width: 90, height: 100),
          ),

          //! Planet Image
          Positioned(
            top: 35,
            left: 0,
            right: 0,
            child: Center(
              child: Hero(
                tag: widget.planetImg,
                child: Image.asset(widget.planetImg, width: 263, height: 250),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
