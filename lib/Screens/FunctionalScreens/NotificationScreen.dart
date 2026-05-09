import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Clear All", style: TextStyle(color: Colors.orange)),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 10),
          _buildSectionHeader("Today"),
          _buildNotificationItem(
            icon: Icons.inventory_2_rounded,
            color: Colors.red,
            title: "Low Stock Alert!",
            description: "Fresh Sugar is almost out of stock (only 2kg left).",
            time: "2 mins ago",
            isUnread: true,
          ),
          _buildNotificationItem(
            icon: Icons.account_balance_wallet_rounded,
            color: Colors.green,
            title: "Daily Sales Goal Met",
            description: "Congratulations! You've reached your daily sales target.",
            time: "1 hour ago",
            isUnread: true,
          ),

          const SizedBox(height: 20),
          _buildSectionHeader("Yesterday"),
          _buildNotificationItem(
            icon: Icons.security_rounded,
            color: Colors.blue,
            title: "Security Update",
            description: "Your store password was changed successfully.",
            time: "Yesterday, 10:30 AM",
            isUnread: false,
          ),
          _buildNotificationItem(
            icon: Icons.campaign_rounded,
            color: Colors.orange,
            title: "System Maintenance",
            description: "NextStore will be under maintenance tonight at 12:00 AM.",
            time: "Yesterday, 08:00 PM",
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isUnread ? Colors.white : Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(15),
        border: isUnread ? Border.all(color: Colors.orange.withOpacity(0.2)) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 15),

          // টেক্সট সেকশন
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    if (isUnread)
                      const CircleAvatar(radius: 4, backgroundColor: Colors.orange),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}