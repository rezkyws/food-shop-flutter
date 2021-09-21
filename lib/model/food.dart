class Food {
  String name;
  int price;
  String imageAsset;
  List<String> categories;

  Food({
    required this.name,
    required this.price,
    required this.categories,
    required this.imageAsset,
  });
}

var foodList = [
  Food(
    name: 'Pizza',
    price: 8,
    imageAsset: 'images/burger.jpg',
    categories: [
      'Chicken',
      'Italian'
    ],
  ),
  Food(
    name: 'Ayam Goreng',
    price: 2,
    imageAsset: 'images/ayam_goreng.jpg',
    categories: [
      'Chicken',
      'Indonesia'
    ],
  ),
  Food(
    name: 'Buratta Cheese',
    price: 3,
    imageAsset: 'images/buratta_chese.jpg',
    categories: [
      'Cheese',
    ],
  ),
  Food(
    name: 'Dimsum',
    price: 3,
    imageAsset: 'images/dimsum.jpg',
    categories: [
      'Bapao',
      'Traditional'
    ],
  ),
  Food(
    name: 'Mangos Plano',
    price: 5,
    imageAsset: 'images/mangos_plano.jpg',
    categories: [
      'Fruit',
      'Traditional'
    ],
  ),
  Food(
    name: 'Miso',
    price: 1,
    imageAsset: 'images/miso.jpg',
    categories: [
      'Mie',
      'Soup'
    ],
  ),
  Food(
    name: 'Pancake Strawberry',
    price: 3,
    imageAsset: 'images/pancake_strawberry.jpg',
    categories: [
      'Bread',
      'Dessert'
    ],
  ),
  Food(
    name: 'Risotto',
    price: 6,
    imageAsset: 'images/risotto.jpg',
    categories: [
      'Soup',
    ],
  ),
  Food(
    name: 'Shashlik',
    price: 7,
    imageAsset: 'images/shashlik.jpeg',
    categories: [
      'Fried',
    ],
  ),
  // Food(
  //   name: 'Spagetti',
  //   price: 4,
  //   imageAsset: 'images/spageti.jpg',
  //   categories: [
  //     'Fried',
  //   ],
  // ),
  // Food(
  //   name: 'Suhsi',
  //   price: 8,
  //   imageAsset: 'images/suhsi.jpg',
  //   categories: [
  //     'Japanese',
  //     'Seafood'
  //   ],
  // ),
];