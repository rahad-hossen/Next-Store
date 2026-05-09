import 'package:flutter/material.dart';

class POSScreen extends StatefulWidget {
  const POSScreen({super.key});

  @override
  State<POSScreen> createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
  // স্ক্যান করা প্রোডাক্টের ডামি লিস্ট
  final List<Map<String, String>> _scannedProducts = [
    {"name": "Sunlight Soap", "price": "৳ 45.00", "qty": "1"},
    {"name": "Fresh Sugar", "price": "৳ 120.00", "qty": "2"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Billing / POS",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ১. স্ক্যানার বাটন সেকশন
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                // এখানে আপনার QR Scanner লজিক বসবে
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.orange.withOpacity(0.3), width: 2),
                  boxShadow: [
                    BoxShadow(color: Colors.orange.withOpacity(0.05), blurRadius: 15)
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.qr_code_scanner_rounded, size: 80, color: Colors.orange),
                    const SizedBox(height: 15),
                    const Text(
                      "Tap to Scan Barcode",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                    const Text("Quickly add products to bill", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),

          // ২. সাম্প্রতিক স্ক্যান করা পণ্যের লিস্ট হেডার
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Scanned Items",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${_scannedProducts.length} Items", style: const TextStyle(color: Colors.orange)),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // ৩. প্রোডাক্ট লিস্ট
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _scannedProducts.length,
              itemBuilder: (context, index) {
                final item = _scannedProducts[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange.withOpacity(0.1),
                        child: Text("${index + 1}", style: const TextStyle(color: Colors.orange)),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text("Unit Price: ${item['price']}", style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.remove_circle_outline, size: 20, color: Colors.grey),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(item['qty']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          const Icon(Icons.add_circle_outline, size: 20, color: Colors.orange),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // ৪. টোটাল বিল ও চেকআউট বাটন
          Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Amount", style: TextStyle(fontSize: 16, color: Colors.grey)),
                    Text("৳ 285.00", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange)),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Text("Generate Bill", style: TextStyle(fontSize: 18, color: Colors.white)),
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