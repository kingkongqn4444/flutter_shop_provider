import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/slider_home.dart';
import 'package:novus_trade_v1/models/slider_home.dart' as prefix0;
import 'package:novus_trade_v1/configs/app_config.dart' as config;

class HomeSliderWidget extends StatefulWidget {
  @override
  _HomeSliderWidgetState createState() => _HomeSliderWidgetState();
}

class _HomeSliderWidgetState extends State<HomeSliderWidget> {
  int _current = 0;
  SliderList _sliderList = new SliderList();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
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
          items: _sliderList.list.map((prefix0.Slider slide) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(slide.image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 4),
                          blurRadius: 9)
                    ],
                  ),
                  child: Container(
                    alignment: AlignmentDirectional.bottomEnd,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: config.App(context).appWidth(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            slide.description,
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .merge(TextStyle(height: 0.8)),
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.fade,
                            maxLines: 3,
                          ),
                          // FlatButton(
                          //   onPressed: () {},
                          //   padding: EdgeInsets.symmetric(vertical: 5),
                          //   color: Theme.of(context).accentColor,
                          //   shape: StadiumBorder(),
                          //   child: Text(
                          //     slide.button,
                          //     textAlign: TextAlign.start,
                          //     style: TextStyle(
                          //         color: Theme.of(context).primaryColor),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
          Positioned(
            bottom: 25,
            right: 41,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _sliderList.list.map((prefix0.Slider slide) {
                return Container(
                  width: 20.0,
                  height: 3.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: _current == _sliderList.list.indexOf(slide)
                          ? Theme.of(context).hintColor
                          : Theme.of(context).hintColor.withOpacity(0.3)),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
