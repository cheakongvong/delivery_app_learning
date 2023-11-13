import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/widget/rating_stars.dart';

import '../models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.restaurant});

  final Restaurant restaurant;
  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(menuItem.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: const [0.1, 0.4, 0.6, 0.9],
              ),
            ),
          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: [
                Text(
                  menuItem.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24.0,
                      letterSpacing: 1.2),
                ),
                Text(
                  '\$${menuItem.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 1.2),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              width: 48.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
                iconSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      color: Colors.white,
                      iconSize: 30.0,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_outlined),
                      color: Theme.of(context).primaryColor,
                      iconSize: 40.0,
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    ),
                    const Text(
                      '1Km away',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RatingStars(widget.restaurant.rating),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.restaurant.address,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 20.0),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {},
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  'Reviews',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  'Contact',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food);
              }),
            ),
          )
        ],
      ),
    );
  }
}
