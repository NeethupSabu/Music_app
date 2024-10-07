import 'package:flutter/material.dart';
import 'package:musicapp/bottomNav.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(''),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Vikashini vini',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  children: [
                    const ListTile(
                      title: Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white60,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                    ),
                    _buildProfileItem(context, 'Name'),
                    _buildProfileItem(context, 'Email'),
                    _buildProfileItem(context, 'Language'),
                    const SizedBox(height: 10),
                    const ListTile(
                      title: Text(
                        'About',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                    ),
                    _buildProfileItem(context, 'Privacy'),
                    _buildProfileItem(context, 'Storage'),
                    _buildProfileItem(context, 'Audio Quality'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget _buildProfileItem(BuildContext context, String title) {
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
      contentPadding: EdgeInsets.symmetric(vertical: 0),
      onTap: () {},
    );
  }
}
