import 'package:flutter/material.dart';
import 'screens/login_page.dart';

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
      home: LoginPage(),
    );
  }
}