import 'package:flutter/material.dart';
import '../core/widgets/gradient.dart';
import '../main_scaffold.dart';

class ProfilePage extends StatefulWidget
{
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
{
  final TextEditingController _nameController = TextEditingController
    (text: "Aditi Pawar");
  final TextEditingController _emailController = TextEditingController
    (text: "aditi06@example.com");
  final TextEditingController _phoneController = TextEditingController
    (text: "+91 9876543210");
  final TextEditingController _addressController = TextEditingController
    (text: "123, Sitaram Lane, Satana, India");

  @override
  void dispose()
  {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return MainScaffold(title: "Profile",
      body: SingleChildScrollView(padding: const EdgeInsets.all(16.0),
        child: Column(children: [
            const SizedBox(height: 20), const CircleAvatar(
              radius: 60, backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 60, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            buildEditableCard("Name", _nameController),
            const SizedBox(height: 15),
            buildEditableCard("Email", _emailController),
            const SizedBox(height: 15),
            buildEditableCard("Phone", _phoneController),
            const SizedBox(height: 15),
            buildEditableCard("Address", _addressController),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: ()
              {
                print("Name: ${_nameController.text}");
                print("Email: ${_emailController.text}");
                print("Phone: ${_phoneController.text}");
                print("Address: ${_addressController.text}");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile updated successfully!")),
                );
              },
              child: const Text("Save Changes",style: TextStyle(fontSize: 18, color: Colors.white),
              ),),],),
      ),);}

  Widget buildEditableCard(String title, TextEditingController controller)
  {
    return Container(width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(gradient: AppGradients.primaryGradient,
        borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(color: Colors.grey.withAlpha((0.3 * 255).toInt()), blurRadius: 6, offset: const Offset(0, 3),
          ),],),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title, style: const TextStyle(color: Colors.white70, fontSize: 14),),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),),
        ],
      ),);
  }
}