

import 'package:ecommerce/models/product.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier{
//  product for sale
  final List<Product> _shop = [
   Product(
    name: "Product 1",
    price: 23.50000,
    description: """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rhoncus eros in velit lacinia, sed viverra magna fermentum. Sed bibendum metus a lorem consequat laoreet at nec nisl. Donec ex urna, tempus ut imperdiet vitae, consequat eget lorem. Morbi iaculis porttitor nunc, sit amet efficitur orci vulputate malesuada. Fusce at quam diam. Fusce sollicitudin pharetra sapien, eget maximus metus feugiat eu. In iaculis sem lobortis ipsum aliquet tempor. Fusce ante leo, dapibus sed libero semper, placerat auctor nisi. Donec ultricies ornare dui eu cursus. Duis sit amet sem nec libero lobortis tempus vel eget mauris. Cras metus tellus, pellentesque sit amet vehicula vitae, facilisis in tortor.   
    """,
    imagePath: "https://images.pexels.com/photos/974911/pexels-photo-974911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
  ),
    Product(
      name: "Product 2",
      price: 40.5,
      description: "Item description",
      imagePath: "https://images.pexels.com/photos/346752/pexels-photo-346752.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
    ),
    Product(
      name: "Product 1",
      price: 12.5,
      description: "Item description",
      imagePath: "https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
    ),
    Product(
      name: "Product 1",
      price: 90.5,
      description: "Item description",
      imagePath: "https://images.pexels.com/photos/994234/pexels-photo-994234.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
    )

  ];


// user cart

List<Product> _cart = [];

// get product list

List<Product> get shop => _shop;

// get user cart

List<Product> get cart => _cart;


// add item to cart
void addToCart(Product item){
  _cart.add(item);
  notifyListeners();
}

// remove item from cart
void removeFromCart(Product item){
  _cart.remove(item);
  notifyListeners();
 }

}