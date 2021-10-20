import 'package:flutter/animation.dart';

class TabIconData {
  String imagePath;

  int index;

  String selectedImagePath;

  bool isSelected;

  AnimationController animationController;

  TabIconData({
    this.imagePath = "",
    this.index = 0,
    this.selectedImagePath = "",
    this.isSelected = false,
    this.animationController,
  });

  static List<TabIconData> tabIconList = <TabIconData>[
    TabIconData(
      imagePath: 'img/images/tab_1.png',
      selectedImagePath: 'img/images/tab_1s.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'img/images/tab_4.png',
      selectedImagePath: 'img/images/tab_4s.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'img/images/tab_3.png',
      selectedImagePath: 'img/images/tab_3s.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'img/images/tab_2.png',
      selectedImagePath: 'img/images/tab_2s.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
