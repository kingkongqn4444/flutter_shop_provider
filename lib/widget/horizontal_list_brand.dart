import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novus_trade_v1/models/brand.dart';

class HorizontaListBrand extends StatelessWidget {
  List<Brand> brandList;
  String heroTag;

  HorizontaListBrand({Key key, this.brandList, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: brandList.length,
        itemBuilder: (context, index) {
          double _marginLeft = 0;
          (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
          return ListBrand(
            heroTag: this.heroTag,
            marginLeft: _marginLeft,
            brand: brandList.elementAt(index),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class ListBrand extends StatelessWidget {
  String heroTag;
  double marginLeft;
  Brand brand;

  ListBrand({Key key, this.heroTag, this.marginLeft, this.brand})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: brand.color.withOpacity(0.3),
                border: Border.all(width: 2.0, color: Color(0xFFEBF0FF)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  // child: Image.asset(brand.logo),
                  child: SvgPicture.asset(brand.logo,
                      color: Theme.of(context).primaryColor, width: 80),
                ),
              ),
            ),
            Text(
              brand.name,
              style: TextStyle(color: Color(0xFF9098B1)),
            )
          ],
        ),
      ),
    );
  }
}
