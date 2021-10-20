class Slider {
  String image;
  String button;
  String description;

  Slider({this.image, this.button, this.description});
}

class SliderList {
  List<Slider> _list;

  List<Slider> get list => _list;

  SliderList() {
    _list = [
      new Slider(
          image: 'img/banner_sale.png', button: 'Collection', description: ''),
      new Slider(
          image: 'img/banner_sale.png', button: 'Explore', description: ''),
      new Slider(
          image: 'img/banner_sale.png', button: 'Visit Store', description: ''),
    ];
  }
}
