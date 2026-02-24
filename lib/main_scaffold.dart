import 'package:flutter/material.dart';
import '../core/widgets/gradient.dart';
import '../core/widgets/appbar.dart';
import '../screens/profile_page.dart';
import '../screens/reset_password_page.dart';


class MainScaffold extends StatefulWidget
{
  final Widget body;
  final String title;
  const MainScaffold({
    super.key,
    required this.body,
    required this.title,
  });
  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold>
{
  bool isMenuOpen = false;
  void toggleMenu()
  {
    setState(() => isMenuOpen = !isMenuOpen);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final menuWidth = width * 0.65;
    return Scaffold(body: Stack(
        children: [Scaffold(
            appBar: appBar(context, title: widget.title, hamburger: true, onMenuPressed: toggleMenu,
            ),
            body: widget.body,),

          if (isMenuOpen)
            GestureDetector(
              onTap: toggleMenu, child: Container(
                width: double.infinity, height: double.infinity,
                color: Colors.black.withAlpha((0.4 * 255).toInt()),
              ),),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isMenuOpen ? 0 : -menuWidth,
            top: 0, bottom: 0, child: Container(
              width: menuWidth, decoration: BoxDecoration(
                gradient: AppGradients.glowGradient,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(20),
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 15),
                ],),
              child: SafeArea(child: Column(
                  children: [
                    const SizedBox(height: 20), const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    const Text("User Name", style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Divider(color: Colors.white),

                    menuItem(Icons.analytics_rounded,"Dashboard", () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }),
                    menuItem(Icons.person,"Profile",() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:(_) => const ProfilePage()),
                      );
                    }),
                    menuItem(Icons.admin_panel_settings_outlined,"Reset Password",()
                    {
                      Navigator.push(context,
                        MaterialPageRoute(builder:(_) => const ResetPasswordPage()),
                      );
                    }),
                    menuItem(Icons.article, "Complaints", () {}),
                    menuItem(Icons.all_inbox_rounded, "Complaint History", () {}),
                    menuItem(Icons.assignment_turned_in_rounded, "Resolved Issues", () {}),

                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {}, child: Padding(
                        padding: const EdgeInsets.all(10), child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.logout_rounded, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),),
                          ],
                        ),),),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        toggleMenu();
        onTap();
      },
    );
  }
}