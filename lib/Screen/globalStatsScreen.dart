import 'package:covid19_tracker/Screen/state_detail_screen.dart';
import 'package:flutter/material.dart';
import 'district_list_screen.dart'; // Make sure this import is correct

class Globalstatsscreen extends StatefulWidget {
  @override
  State<Globalstatsscreen> createState() => _GlobalstatsscreenState();
}

class _GlobalstatsscreenState extends State<Globalstatsscreen> {
  final List<Map<String, dynamic>> allStates = [
    {"name": "Andhra Pradesh", "count": 246546, "active": 44129, "recovered": 200000, "deaths": 1417},
    {"name": "Karnataka", "count": 401546, "active": 50000, "recovered": 320000, "deaths": 1546},
    {"name": "Tamil Nadu", "count": 349946, "active": 38000, "recovered": 300000, "deaths": 1946},
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredStates = allStates
        .where((state) =>
        state["name"].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: const Text("India State", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search state...",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard("Confirmed", "408,046", Colors.orange, titleColor: Colors.blue),
                _buildStatCard("Active", "46,144", Colors.redAccent, titleColor: Colors.red),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard("Recovered", "46,544", Colors.green, titleColor: Colors.green),
                _buildStatCard("Deaths", "36,644", Colors.purple, titleColor: Colors.purple),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Top States",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filteredStates.length,
                itemBuilder: (context, index) {
                  final state = filteredStates[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StateDetailScreen(
                            stateName: state["name"],
                            confirmed: int.tryParse(state["count"].toString()) ?? 0,
                            active: int.tryParse(state["active"].toString()) ?? 0,
                            recovered: int.tryParse(state["recovered"].toString()) ?? 0,
                            deaths: int.tryParse(state["deaths"].toString()) ?? 0,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state["name"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            state["count"].toString(),
                            style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildStatCard(String title, String count, Color countColor, {Color? titleColor}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: titleColor ?? Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            count,
            style: TextStyle(
              color: countColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Container(
            height: 1,
            width: double.infinity,
            color: countColor,
          )
        ],
      ),
    ),
  );
}
