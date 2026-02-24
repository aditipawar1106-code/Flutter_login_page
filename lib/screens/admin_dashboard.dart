import 'package:flutter/material.dart';
import '../main_scaffold.dart';
import '../core/widgets/gradient.dart';

class AdminDashboard extends StatelessWidget
{
  const AdminDashboard({super.key});
  @override
  Widget build(BuildContext context)
  {
    return MainScaffold(title: "Dashboard",
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildStatCard("Total Complaints", "120"),
            const SizedBox(height: 15),
            buildStatCard("In Progress", "45"),
            const SizedBox(height: 15),
            buildStatCard("Completed", "75"),
          ],
        ),
      ),
    );
  }

  Widget buildStatCard(String title, String count) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        gradient: AppGradients.primaryGradient,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((0.3 * 255).toInt()),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.bar_chart, color: Colors.white, size: 40),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title,
                    style: const TextStyle(color: Colors.white,
                      fontSize: 16,
                    )),
                const SizedBox(height: 5),
                Text(count,
                    style: const TextStyle(
                      color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
        ],
      ),
    );
  }
}