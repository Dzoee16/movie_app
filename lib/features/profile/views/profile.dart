import 'package:flutter/material.dart';
import 'package:movie_stream/core/global_component/colors.dart';
import 'package:movie_stream/core/global_component/images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.mainColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(ImageConstants.profile),
          ),
          const SizedBox(height: 16),
          const Text(
            "Dzoe", // Nama pengguna
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorConstants.secondaryColor,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "dzoe@example.com", // Email pengguna
            style: TextStyle(
              fontSize: 16,
              color: ColorConstants.secondaryColor,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white70), // Garis pemisah
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Edit Profile"),
            onTap: () {
              // Navigasi ke halaman edit profile atau tampilkan modal edit
            },
          ),
          const Divider(color: Colors.white70), // Garis pemisah
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: null, // Disabled
          ),
          const Divider(color: Colors.white70), // Garis pemisah
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: null, // Disabled
          ),
        ],
      ),
    );
  }
}
