import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tweetverse/constants/assets_constants.dart';
import 'package:tweetverse/features/explore/views/explore_view.dart';
import 'package:tweetverse/features/notifications/view/notification_view.dart';
import 'package:tweetverse/features/tweet/widgets/tweet_list.dart';
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

  static const List<Widget> bottomTabBarPages = [
    TweetList(),
    ExploreView(),
    NotificationView(),
  ];
}
