import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/widget/recent_orders.dart';

import '../widget/rating_stars.dart';
import 'cart_screen.dart';
import 'restaurant_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];
    for (var restaurant in restaurants) {
      restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RestaurantScreen(restaurant: restaurant),
            ),
          ),
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 1.0,
                color: Colors.grey.shade300,
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                      image: AssetImage(restaurant.imageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                        RatingStars(restaurant.rating),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          restaurant.address,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        const Text(
                          '1Km away',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () {},
          iconSize: 30.0,
        ),
        title: const Text(
          'Food Delivery',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        actions: [
          MaterialButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CartScreen(),
              ),
            ),
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: const TextStyle(
                  fontFamily: 'Poppins', fontSize: 20.0, color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      width: 1.0, color: Theme.of(context).primaryColor),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30.0,
                  // color: Colors.deepOrangeAccent,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.clear,
                    // color: Colors.deepOrangeAccent,
                  ),
                ),
                hintText: 'Search Food or Restaurant',
              ),
            ),
          ),
          // recent order part
          const RecentOrder(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurant',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                      letterSpacing: 1.2),
                ),
              ),
              _buildRestaurants(),
            ],
          )
          //   Nearby order part
        ],
      ),
    );
  }
}
