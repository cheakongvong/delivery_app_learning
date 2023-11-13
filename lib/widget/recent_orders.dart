import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({super.key});

  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0,
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage(order.food.imageUrl),
                  fit: BoxFit.cover,
                  // image: AssetImage(order.food.imageUrl),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.food.name,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      order.restaurant.name,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      order.date,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0),
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
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Order',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
        ),
        SizedBox(
          height: 120.0,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrder(context, order);
            },
          ),
        )
      ],
    );
  }
}
