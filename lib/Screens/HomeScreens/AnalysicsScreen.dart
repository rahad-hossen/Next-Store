import 'package:flutter/material.dart';

class AnalysicsScreen extends StatelessWidget {
  const AnalysicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Business Analysis",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ১. টাইম ফিল্টার (Today, Weekly, Monthly)
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  _buildTimeTab("Today", false),
                  _buildTimeTab("Weekly", true), // Weekly সিলেক্টেড
                  _buildTimeTab("Monthly", false),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // ২. রেভিনিউ চার্ট এরিয়া (Placeholder)
            const Text("Revenue Overview",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bar_chart_rounded, size: 80, color: Colors.orange.withOpacity(0.3)),
                    const Text("Chart will be integrated here",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),

            // ৩. প্রফিট ও কাস্টমার স্ট্যাটাস কার্ড
            Row(
              children: [
                _buildAnalysisCard("Net Profit", "৳ 4,200", Icons.trending_up, Colors.green),
                const SizedBox(width: 15),
                _buildAnalysisCard("New Customers", "12", Icons.person_add, Colors.blue),
              ],
            ),
            const SizedBox(height: 25),

            // ৪. টপ সেলিং প্রোডাক্টস
            const Text("Top Selling Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildTopProduct("Pusty Rice", "120 kg sold", "৳ 9,000"),
            _buildTopProduct("Fresh Sugar", "45 kg sold", "৳ 5,400"),
            _buildTopProduct("Sunlight Soap", "30 pcs sold", "৳ 1,350"),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // টাইম ট্যাব বিল্ডার
  Widget _buildTimeTab(String label, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // এনালাইসিস কার্ড বিল্ডার
  Widget _buildAnalysisCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // টপ প্রোডাক্ট রো বিল্ডার
  Widget _buildTopProduct(String name, String sold, String total) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(sold, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          Text(total, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}