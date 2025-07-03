import 'package:flutter/material.dart';
import 'district_list_screen.dart';

class StateDetailScreen extends StatelessWidget {
  final String stateName;
  final int confirmed;
  final int active;
  final int recovered;
  final int deaths;

  const StateDetailScreen({
    Key? key,
    required this.stateName,
    required this.confirmed,
    required this.active,
    required this.recovered,
    required this.deaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        title: Text(
          stateName,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildStatBox("Confirmed", confirmed, Colors.orange),
            _buildStatBox("Active", active, Colors.redAccent),
            _buildStatBox("Recovered", recovered, Colors.green),
            _buildStatBox("Deaths", deaths, Colors.purple),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DistrictListScreen(
                        stateName: stateName,
                        districts: [
                          {"name": "Mumbai", "count": 196494},
                          {"name": "Pune", "count": 109966},
                          {"name": "Nagpur", "count": 70576},
                        ],
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("View Districts", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String title, int count, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              Text(
                count.toString(),
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
