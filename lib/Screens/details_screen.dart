import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_explorer/Colors/app_colors.dart';
import 'package:space_explorer/Constants/planet_color.dart';
import 'package:space_explorer/data.dart';

class DetailsScreen extends StatefulWidget {
  final String planetImg;
  final String planetName;
  final String planetNumber;
  const DetailsScreen({
    super.key,
    required this.planetImg,
    required this.planetName,
    required this.planetNumber,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController planetController;

  @override
  void initState() {
    super.initState();
    planetController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    planetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Stack(
              children: [
                //! Planet Number
                Positioned(
                  top: 200,
                  left: 0,
                  bottom: 10,
                  child: Image.asset(
                    widget.planetNumber,
                    width: 210.8,
                    height: 329.33,
                  ),
                ),
                //! PLANET img (with rotation)
                Positioned(
                  top: 20,
                  left: 100,
                  bottom: 0,
                  child: Hero(
                    tag: widget.planetImg,
                    child: RotationTransition(
                      turns: planetController,
                      child: Image.asset(
                        widget.planetImg,
                        width: 381.57,
                        height: 368.88,
                      ),
                    ),
                  ),
                ),
                //! back button
                Positioned(
                  top: 20,
                  left: 5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, top: 35, right: 10),
                      child: SvgPicture.asset(
                        'Assets/Svg/back.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18),
          //! Title
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              widget.planetName,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: planetColor[widget.planetName],
                fontFamily: 'Raleway',
              ),
            ),
          ),
          SizedBox(height: 10),
          //! desc
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Et at id vitae ante habitasse arcu lacus. Duis quis praesent lacus facilisi at sodales. Ornare ornare amet convallis purus ullamcorper laoreet cras massa in. Arcu nec nisi pharetra urna in aenean sem.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.gray,
                fontFamily: 'Raleway',
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 40),
          //! gallery
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'GALLERY',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
                fontFamily: 'Raleway',
              ),
            ),
          ),
          //!Gallery List
          widget.planetName == 'Earth'
              ? SizedBox(
                  height: 140,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left: 25, top: 15),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      //* when the image will expand
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              opaque: false,
                              barrierColor: Colors.black.withOpacity(0.8),
                              pageBuilder: (_, __, ___) => Center(
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Hero(
                                    tag: 'galleryImage$index',
                                    child: Image.asset(
                                      earthGallery[index],
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.5,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        //* image in the list with hero and tag
                        child: Hero(
                          tag: 'galleryImage$index',
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(29),
                            child: Image.asset(
                              earthGallery[index],
                              width: 180,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 18);
                    },
                    itemCount: earthGallery.length,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 50),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Sorry, this gallery not Avialable\nat this moment ☄',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
