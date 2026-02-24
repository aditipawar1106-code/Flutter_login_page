import 'package:flutter/material.dart';
import 'gradient.dart';

AppBar appBar(
    BuildContext context, {
      required String title, VoidCallback? onMenuPressed,
      bool hamburger = true, bool logo = true,
    })
{
  return AppBar(elevation: 0, toolbarHeight: 70, leading: hamburger
        ? Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.menu),
        color: Colors.white,
        onPressed: onMenuPressed,
      ),
    )
        : null,
    flexibleSpace: Container(
      decoration: BoxDecoration(gradient: AppGradients.darkGradient),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (logo)
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.1 * 255).toInt()),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                "assets/images/logo.png",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        const SizedBox(width: 16),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ],
    ),
    centerTitle: true,
    automaticallyImplyLeading: false,
  );
}