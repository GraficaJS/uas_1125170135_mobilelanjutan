import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
 
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    // Ambil data user yang sedang login
    final User? user = FirebaseAuth.instance.currentUser;
    final authService = AuthService();
    final theme = Theme.of(context);
 
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      
      // ========== APP BAR ==========
      appBar: AppBar(
        title: const Text('Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          PopupMenuButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Logout'),

                  contentPadding: EdgeInsets.zero,
                ),
                onTap: () async {
                  await authService.logout();
                  // Navigasi otomatis oleh StreamBuilder
                },
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),

