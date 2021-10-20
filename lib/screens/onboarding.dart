import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/on_boarding.dart';

class OnBoardingWidget extends StatefulWidget {
  @override
  _OnboardingWidgetState createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnBoardingWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  OnBoardingList _onBoardingList;

  @override
  void initState() {
    _onBoardingList = new OnBoardingList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var children2 = <Widget>[
      SizedBox(
        height: 100,
      ),
      CarouselSlider(
        options: CarouselOptions(
          height: 500,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
          scrollDirection: Axis.horizontal,
        ),
        carouselController: _controller,
        items: _onBoardingList.list.map((OnBoarding boarding) {
          return Builder(
            builder: (BuildContext context) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      boarding.image,
                      width: 300,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          child: Text(boarding.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.normal)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(boarding.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight,
                                  fontSize: 13.0)),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        }).toList(),
      ),
      Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _onBoardingList.list.map((OnBoarding boarding) {
              return Builder(
                builder: (BuildContext context) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                            color: _current ==
                                    _onBoardingList.list.indexOf(boarding)
                                ? Theme.of(context)
                                    .highlightColor
                                    .withOpacity(1)
                                : Theme.of(context)
                                    .highlightColor
                                    .withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      )
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      buttonBottom(_current, () {
        if (_current == 3) {
          Navigator.of(context).pushNamed("/sign_in");
        } else {
          setState(() {
            _current = _current + 1;
          });
          _controller.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.linear);
        }
      })
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: children2,
      ),
    );
  }

  Widget buttonBottom(int index, Function click) {
    var endPage = index == 3;
    return Expanded(
      child: Container(
          child: Center(
        child: Column(
          children: [
            FlatButton(
              color: Theme.of(context).highlightColor,
              onPressed: click,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              child: Text(
                endPage ? tr("ob_button_login") : tr("ob_button_next"),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              shape: StadiumBorder(),
            ),
            SizedBox(height: 20),
            endPage
                ? SizedBox(
                    height: 20,
                  )
                : GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/sign_in");
                    },
                    child: Text(
                      tr("ob_button_skip"),
                      style: TextStyle(fontSize: 15),
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
