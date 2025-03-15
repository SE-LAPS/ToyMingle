import 'package:flutter/material.dart';

class DailyGiftScreen extends StatefulWidget {
  static const String routeName = '/daily_gift';

  @override
  _DailyGiftScreenState createState() => _DailyGiftScreenState();
}

class _DailyGiftScreenState extends State<DailyGiftScreen> {
  final List<Map<String, dynamic>> dailyGifts = [
    {
      "name": "Chocolate Box",
      "image": "assets/images/gift1.png",
      "description": "Unlock a surprise gift!",
      "points": 100,
    },
    {
      "name": "Gift Box",
      "image": "assets/images/gift2.png",
      "description": "Get 20% off on your next purchase!",
      "points": 200,
    },
    {
      "name": "Pencil Box",
      "image": "assets/images/gift3.png",
      "description": "Enjoy free delivery on your next order!",
      "points": 150,
    },
    {
      "name": "Teddy Bear",
      "image": "assets/images/gift4.png",
      "description": "Unlock a limited-edition skin!",
      "points": 300,
    },
  ];

  late String
      selectedGift; // Use 'late' to indicate it will be initialized later

  @override
  void initState() {
    super.initState();
    selectedGift = dailyGifts[0]["name"]; // Initialize with the first gift
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Gifts"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Claim Your Daily Gift",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Check out the amazing gifts waiting for you today!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add logic to claim a gift
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("You claimed $selectedGift!"),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Claim Now",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Dropdown List Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Select a Gift",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButton<String>(
                  value: selectedGift,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGift = newValue!; // Update selected gift
                    });
                  },
                  items: dailyGifts.map<DropdownMenuItem<String>>((gift) {
                    return DropdownMenuItem<String>(
                      value: gift["name"],
                      child: Text(gift["name"]),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                // Display Selected Gift Details
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.asset(
                          dailyGifts.firstWhere(
                              (gift) => gift["name"] == selectedGift)["image"],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedGift,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              dailyGifts.firstWhere((gift) =>
                                  gift["name"] == selectedGift)["description"],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.workspace_premium,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${dailyGifts.firstWhere((gift) => gift["name"] == selectedGift)["points"]} Points",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
