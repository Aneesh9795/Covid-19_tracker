import 'package:covid19_tracker/Screen/globalStatsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        title: const Text(
            "Covid Overview", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Covid Overview",
              style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard("Confirmed", "109,548", Colors.orange),
                _buildStatCard("Active", "44,129", Colors.redAccent),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard("Recovered", "344,675", Colors.green),
                _buildStatCard("Deaths", "4,244", Colors.green)
              ],
            ),
            const SizedBox(height: 24,),
            const Text(
              "Details", style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16,),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text(
                "pie Chart Here", style: TextStyle(color: Colors.white70),),),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Globalstatsscreen()
                      ),
                    );

              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("View India Stats",style: TextStyle(fontSize: 16),),
            )
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildStatCard(String title, String count,Color color){
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
              title,style: TextStyle(color: Colors.white70,fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              count,style: TextStyle(color: color, fontSize: 18,fontWeight: FontWeight.bold),
            )
          ],
        ),
     )
  );
}