import 'package:flutter/material.dart';

class FlashDealScreen extends StatelessWidget {
  static const String routeName = '/flash_deal';

  final List<Map<String, dynamic>> flashDeals = [
    {
      "name": "Ben10",
      "price": 1200,
      "originalPrice": 800,
      "discount": 40,
      "image": "assets/images/benten.png",
      "delivery": "FREE DELIVERY",
      "stock": "On sale now",
    },
    {
      "name": "car",
      "price": 700,
      "originalPrice": 580,
      "discount": 30,
      "image": "assets/images/car.png",
      "delivery": "FREE DELIVERY",
      "stock": "Only 5 left!",
    },
    {
      "name": "SpiderMan",
      "price": 600,
      "originalPrice": 520,
      "discount": 10,
      "image": "assets/images/spider.png",
      "delivery": "FREE DELIVERY",
      "stock": "Only 4 left!",
    },
    {
      "name": "TeddyBear",
      "price": 900,
      "originalPrice": 850,
      "discount": 20,
      "image": "assets/images/doll.png",
      "delivery": "FREE DELIVERY",
      "stock": "Only 3 left!",
    },
    {
      "name": "SuperMan",
      "price": 1300,
      "originalPrice": 1200,
      "discount": 30,
      "image": "assets/images/Image Popular Product 2.png",
      "delivery": "FREE DELIVERY",
      "stock": "Only 6 left!",
    },
    {
      "name": "Teddybear",
      "price": 1800,
      "originalPrice": 1720,
      "discount": 20,
      "image": "assets/images/Image Popular Product 4.png",
      "delivery": "FREE DELIVERY",
      "stock": "Only 5 left!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flash Deals"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: flashDeals.length,
        itemBuilder: (context, index) {
          final deal = flashDeals[index];
          return Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    deal["image"],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deal["name"],
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Rs. ${deal["price"]}",
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rs. ${deal["originalPrice"]}",
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "${deal["discount"]}% off",
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        deal["delivery"],
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        deal["stock"],
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
