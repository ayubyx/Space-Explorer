import 'package:flutter/material.dart';

import 'Colors/app_colors.dart';

final List<String> planetImages = [
  'Assets/images/Mercury.png',
  'Assets/images/Venus.png',
  'Assets/images/Earth.png',
  'Assets/images/Mars.png',
  'Assets/images/Jupiter.png',
  'Assets/images/Saturn.png',
  'Assets/images/Uranus.png',
  'Assets/images/Neptune.png',
];

//Plant Numbers
final List<String> planetNumbers = [
  'Assets/numbers/1.png',
  'Assets/numbers/2.png',
  'Assets/numbers/3.png',
  'Assets/numbers/4.png',
  'Assets/numbers/5.png',
  'Assets/numbers/6.png',
  'Assets/numbers/7.png',
  'Assets/numbers/8.png',
];

// earth planet gallery
final List<String> earthGallery = [
  'Assets/images/Rectangle 4.png',
  'Assets/images/Rectangle 5.png',
  'Assets/images/Rectangle 4 copy.png',
  'Assets/images/Rectangle 5.png',
];

// List of planet names
final List<String> planetNames = [
  'Mercury',
  'Venus',
  'Earth',
  'Mars',
  'Jupiter',
  'Saturn',
  'Uranus',
  'Neptune',
];

final Map<String, Color> planetColors = {
  'Mercury': AppColors.murcury, // Gray
  'Venus': AppColors.yellowLight, // Orange-Brown
  'Earth': AppColors.blue, // Blue
  'Mars': AppColors.orange, // Red
  'Jupiter': AppColors.orangeLight, // Light Brown
  'Saturn': AppColors.purple, // Gold
  'Uranus': AppColors.cyan, // Light Blue
  'Neptune': AppColors.blueDeep, // Dark Blue
};
