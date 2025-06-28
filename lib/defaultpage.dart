import 'package:flutter/material.dart';
import 'package:learningapp/API/quotes.dart';

class DefaultPage extends StatelessWidget {
  final String title;
  final Widget child;
  const DefaultPage({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w600),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 80,
                child: DrawerHeader(
                  child: Text(
                    "Menu",
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.black),
                title: const Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                leading: const Icon(Icons.add, color: Colors.black),
                title: const Text(
                  'New Task',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/newtask');
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                title: const Text(
                  'Account',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/account');
                },
              ),
              ListTile(
                leading: const Icon(Icons.info, color: Colors.black),
                title: const Text(
                  'About',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.black),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              const Divider(thickness: 1),
              ListTile(title: QuoteText()),
              const Divider(thickness: 1),
            ],
          ),
        ),
      ),
      body: Container(color: Colors.white, child: child),
    );
  }
}
