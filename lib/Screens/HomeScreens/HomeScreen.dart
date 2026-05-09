import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextstore/Screens/CustomWidget/RecentCards.dart';
import 'package:nextstore/Screens/FunctionalScreens/PosScreen.dart';
import 'package:nextstore/Screens/FunctionalScreens/NotificationScreen.dart';
import 'package:nextstore/Screens/HomeScreens/AnalysicsScreen.dart';
import 'package:nextstore/Screens/HomeScreens/InvertoryScreen.dart';
import 'package:nextstore/Screens/HomeScreens/ProfileScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  final List<String> activity_title = const ["New Bill","Inventory", "History","Report"];
  final List<IconData> activity_icon =const [Icons.add,Icons.inventory, Icons.history,Icons.report];
  // finalint current_click = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("lib/assets/Icons/next_store_logo.png",height: 50,width: 60,),
                RichText(
                  text: TextSpan(

                    style: TextStyle(color: Colors.black, fontSize: 25),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Next',
                        style: TextStyle(color: Colors.orange.shade800, fontWeight: FontWeight.bold), // Colored word
                      ),
                      TextSpan(
                        text: 'Store',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Colored word

                      ),
                    ],
                  ),
                )

              ],
            ),

          ],

        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationScreen()));
              },
              child: Badge(
                child: Icon(CupertinoIcons.bell,
                size: 28,
                ),
                label: Text("11"),

              ),
            ),

          ),

        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              const Text(
                "Good Morning,",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Text(
                "Store Manager",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),

              Row(
                children: [

                  Expanded(
                    child: _buildSummaryCard(
                      title: "Daily Sales",
                      value: "৳ 1,798.39",
                      subValue: "+12% Growth",
                      color: const Color(0xFFE8F5E9),
                      textColor: Colors.green.shade700,
                      isChart: true,
                    ),
                  ),
                  const SizedBox(width: 15),

                  Expanded(
                    child: _buildSummaryCard(
                      title: "Low Stock",
                      value: "08 Items",
                      subValue: "Urgent Restock",
                      color: const Color(0xFFFFEBEE),
                      textColor: Colors.red.shade700,
                      isChart: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Activity",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {

                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> POSScreen()));
                      //
                      },
                    child: const Text("View All", style: TextStyle(color: Colors.orange)),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activity_title.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, i) {
                  bool isSpecial = (i == 0);

                  return ActivityCard(
                    icon: activity_icon[i],
                    label: activity_title[i],
                    bgColor: isSpecial ? Colors.orange : Colors.white,
                    iconColor: isSpecial ? Colors.white : Colors.grey.shade700,
                    textColor: isSpecial ? Colors.white : Colors.black87,
                    onTap: () {
                      if (i == 0) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const POSScreen()));
                      }
                      else if (i == 1) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Invertoryscreen()));
                      } else if (i == 2) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AnalysicsScreen()));
                      } else if (i == 3) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required String subValue,
    required Color color,
    required Color textColor,
    required bool isChart,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: textColor.withOpacity(0.8), fontSize: 14)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          if (isChart)
            Icon(Icons.show_chart, color: textColor, size: 30)
          else
            Text(subValue, style: TextStyle(color: textColor.withOpacity(0.7), fontSize: 12)),
        ],
      ),
    );
  }

}