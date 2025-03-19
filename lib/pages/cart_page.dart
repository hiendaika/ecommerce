import 'package:ecommerce/components/cart_item.dart';
import 'package:ecommerce/components/shoe_tile.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //heading
                Text(
                  'My Cart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 20),

                //List item cart
                Expanded(
                  child: ListView.builder(
                    itemCount: value.shoeCart.length,
                    itemBuilder: (context, index) {
                      Shoe shoe = value.getShoeCart()[index];
                      return CartItem(shoe: shoe);
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
