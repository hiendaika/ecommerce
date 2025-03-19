import 'package:ecommerce/components/shoe_tile.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);

    //Alert to user
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Successfully added'),
            content: Text('Check your cart'),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Column(
            children: [
              //search bar
              Container(
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Search', style: TextStyle(color: Colors.grey)),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),

              //message
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'Everyone flies, some fly longer than others',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              //hot picks
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Hot picks 🔥',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Shoe shoe = value.getShoeList()[index];
                    // Return shoe
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () {
                        addShoeToCart(shoe);
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25.0,
                  left: 25.0,
                  right: 25.0,
                ),
                child: Divider(color: Colors.white),
              ),
            ],
            // ),
          ),
    );
  }
}
