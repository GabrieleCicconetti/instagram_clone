import 'dart:math';
import 'package:flutter/material.dart';

class Utils {
  static String image({forProfile = false, isBig = false}) {
    return "https://picsum.photos/id/${!forProfile ? Random().nextInt(50) : 0}${!isBig ? "/200/200" : "/800/800"}";
  }

  static Widget getProfileImage({height = 33.0}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(height/2),
      ),
      child: Image.network(
        image(forProfile: true),
        height: height,
        width: height,
        fit: BoxFit.cover,
      ),
    );
  }
}