import 'package:flutter/material.dart';

class Invertoryscreen extends StatelessWidget {
  const Invertoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Inventory Management",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // ১. ইনভেন্টরি সামারি কার্ডস
            Row(
              children: [
                _buildStatCard("Total Items", "125", Colors.blue),
                const SizedBox(width: 15),
                _buildStatCard("Stock Value", "৳ 45k", Colors.orange),
              ],
            ),
            const SizedBox(height: 25),

            // ২. সার্চ এবং ফিল্টার সেকশন
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search products...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.filter_list, color: Colors.orange),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ৩. প্রোডাক্ট লিস্ট হেডার
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Product List",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("In Stock", style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),

            // ৪. প্রোডাক্ট লিস্ট
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildProductItem("Fresh Sugar", "৳ 120", "25 kg", Colors.green),
                  _buildProductItem("Sunlight Soap", "৳ 45", "05 pcs", Colors.red),
                  _buildProductItem("Aci Salt", "৳ 35", "10 kg", Colors.orange),
                  _buildProductItem("Pusty Rice", "৳ 75", "100 kg", Colors.green),
                  _buildProductItem("Dettol 50ml", "৳ 80", "02 pcs", Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),

      // নতুন প্রোডাক্ট যোগ করার বাটন
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // স্ট্যাটাস কার্ড বিল্ডার
  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Text(value,
                style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // ইনভেন্টরি লিস্ট আইটেম বিল্ডার
  Widget _buildProductItem(String name, String price, String qty, Color stockColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.inventory_2_outlined, color: Colors.grey),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Price: $price", style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(qty, style: TextStyle(color: stockColor, fontWeight: FontWeight.bold)),
              const Text("Stock", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}