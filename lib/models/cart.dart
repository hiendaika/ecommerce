import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  //List of shoe for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Adidas',
      price: '150',
      imagePath: 'lib/images/adidas.png',
      description: 'Adidas Samba',
    ),
    Shoe(
      name: 'Nike',
      price: '200',
      imagePath: 'lib/images/air_jordan.png',
      description: 'Air Jordan',
    ),
    Shoe(
      name: 'Converse',
      price: '100',
      imagePath: 'lib/images/converse.png',
      description: 'Converse Chuck Taylor',
    ),
    Shoe(
      name: 'Nike',
      price: '250',
      imagePath: 'lib/images/lebron.png',
      description: 'Lebron IV',
    ),
    Shoe(
      name: 'Vans',
      price: '120',
      imagePath: 'lib/images/vans.png',
      description: 'Vans old school',
    ),
  ];

  //List of items in user cart
  List<Shoe> shoeCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getShoeCart() {
    return shoeCart;
  }

  // add item to cart
  void addToCart(Shoe shoe) {
    shoeCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemCart(Shoe shoe) {
    shoeCart.remove(shoe);
    notifyListeners();
  }
}
