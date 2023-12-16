  List RecommendedItemsArr = ['Biryani','Haleem','Karhai','Nihari','Burger'];
  List RecommendedItemsURLArr = ['assets/images/recommend/biryani.jpg','assets/images/recommend/haleem.jpg','assets/images/recommend/karhai.jpg','assets/images/recommend/nihari.jpg','assets/images/recommend/burger.jpg'];

  List DealArr =['Azadi Deal' , 'Weekend Deal' , 'Mid Night Deal' ,'Gol-Gappay Combo' , 'Weekend Deal'];
  List DealsURLArr = ['assets/images/deals/1.jpg','assets/images/deals/2.jpg','assets/images/deals/3.jpg','assets/images/deals/4.png','assets/images/deals/5.png'];


class MyData {
  List<String> addressArr = ['Green Way 3000, Sylhet', 'Halt road 201, Europe', 'Halt road 201, Asia', 'Halt road 201, Africa'];
  String addressDropDownValue = 'Green Way 3000, Sylhet';

  List<String> timeArr = ['1 Hour', '2 Hours', '3 Hours', '4 Hours'];
  String timeDropDownValue = '1 Hour';

  List <String> SliderImagesArr = ['assets/images/slider/slider1.jpg','assets/images/slider/slider2.png','assets/images/slider/slider3.png','assets/images/slider/slider5.png'];

  List RecommendedItemsArr = ['Hey','Hello','Hey','Hello','Hey','Hello','Hey','Hello','Hey','Hello'];
  List DealsArr = ['Happy','Hojao','yup','Hello','Hey','Hello','Hey','Hello','Hey','Hello'];

}

class Restaurant {
  final String name;
  final List<Product> products;

  Restaurant({required this.name, required this.products});
}

class Product {
  final int id;
  final String name;
  final double price;

  static var productName;

  Product({required this.id, required this.name, required this.price});
}

 List RestaurantsArr = [
  Restaurant(
    name: "KFC",
    products: [
      Product(id: 1, name: "Zinger", price: 10.99),
      Product(id: 2, name: "Broast", price: 9.99),
      Product(id: 3, name: 'Drink', price: 5.99)
      // Add more products for Restaurant 1
    ],
  ),
  Restaurant(
    name: "Allah wala biryani",
    products: [
      Product(id: 3, name: "Single Biryani", price: 12.99),
      Product(id: 4, name: "Drink", price: 11.99),
      // Add more products for Restaurant 2
    ],
  ),
  // Add more restaurants as needed
];
Map<int, int> cart = {};

void addToCart(int productId) {
  if (cart.containsKey(productId)) {
    cart[productId]= 0+1;
  } else {
    cart[productId] = 1;
  }
}
