import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tweetverse/constants/assets_constants.dart';
// import 'package:tweetverse/theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.pheonixLogo,
        // color: Pallete.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static List<Widget> bottomTabBarPages = [
    const Text('Feed Screen'),
    const Text('Search Screen'),
    const Text('Notification Screen'),
  ];
}
