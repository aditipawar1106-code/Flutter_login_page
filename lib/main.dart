import 'package:flutter/material.dart';
import 'screens/admin_dashboard.dart';

void main()
{
  runApp(const GovernmentPortalApp());
}

class GovernmentPortalApp extends StatelessWidget
{
  const GovernmentPortalApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Government Portal',
      home: AdminDashboard(),
    );
  }
}