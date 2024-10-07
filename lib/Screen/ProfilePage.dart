import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Apply gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffec24f0),
              Color.fromARGB(255, 92, 73, 218),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Profile Section
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage(''), // Replace with your profile image path
                  ),
                  SizedBox(height: 5), // Reduced height
                  Text(
                    'Vikashini vini', // Replace with dynamic name if needed
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Settings Section
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  children: [
                    // Personal Information Section
                    const ListTile(
                      title: Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white60,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0), // Remove padding
                    ),
                    _buildSettingsItem(context, 'Name'),
                    _buildSettingsItem(context, 'Email'),
                    _buildSettingsItem(context, 'Language'),
                    const SizedBox(height: 10), // Reduced height
                    // About Section
                    const ListTile(
                      title: Text(
                        'About',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0), // Remove padding
                    ),
                    _buildSettingsItem(context, 'Privacy'),
                    _buildSettingsItem(context, 'Storage'),
                    _buildSettingsItem(context, 'Audio Quality'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, // Set this to the correct index for the profile icon
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  // Helper method to build a settings item with an arrow
  Widget _buildSettingsItem(BuildContext context, String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 20,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 0), // Remove padding
      onTap: () {
        // Handle navigation for each item here
      },
    );
  }
}
