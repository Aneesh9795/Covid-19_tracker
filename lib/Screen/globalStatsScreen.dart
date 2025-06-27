import 'package:flutter/material.dart';
class Globalstatsscreen extends StatelessWidget {
  final List<Map<String, dynamic >> states = [
    {"name": "Andhra Pradesh", "count": "246,546"},
    {"name": "Karnataka", "count": "401,546"},
    {"name": "Tamil Nadu", "count": "349,946"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: const Text("India State",style: TextStyle(color:Colors.white),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard("Confirmed", "408,046", Colors.orange),
              _buildStatCard("Active", "46,144", Colors.redAccent),
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatCard("Recovered", "46,544", Colors.green),
              _buildStatCard("Deaths", "36,644", Colors.purple),
            ],
          ),
          const SizedBox(height: 24,),
          const Text(
            "Top States",
            style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),

          ),
          const SizedBox(height: 12),
          Expanded(child: ListView.builder(
              itemCount: states.length,
              itemBuilder: (context,index) {
                final state = states[index];
                return Container(
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
                        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );

              }))
        ],
      ),
      ),
    );
  }
}

Widget _buildStatCard (String title, String count, Color color){
  return Expanded(child: Container(
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
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          count,
          style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  )
  );
}
