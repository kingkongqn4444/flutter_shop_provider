import 'package:easy_localization/easy_localization.dart';

class OnBoarding {
  String image;
  String title;
  String description;

  OnBoarding({this.image, this.title, this.description});
}

class OnBoardingList {
  List<OnBoarding> _list;

  List<OnBoarding> get list => _list;

  OnBoardingList() {
    _list = [
      new OnBoarding(
          image: 'img/images/ob_1.gif',
          title: tr("ob_title_one"),
          description: tr("ob_content_one")),
      new OnBoarding(
          image: 'img/images/ob_2.gif',
          title: tr("ob_title_two"),
          description: tr("ob_content_two")),
      new OnBoarding(
          image: 'img/images/ob_3.gif',
          title: tr("ob_title_three"),
          description: tr("ob_content_three")),
      new OnBoarding(
          image: 'img/images/ob_4.gif',
          title: tr("ob_title_four"),
          description: tr("ob_content_four")),
    ];
  }
}
