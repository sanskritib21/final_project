import 'package:flutter/material.dart';
import 'package:final_project/utils/constants.dart';
import 'package:final_project/pages/register_page.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const SettingsPage(),
    );
  }

  Future<void> logOutUser(BuildContext context) async {
    await supabase.auth.signOut();
    Navigator.of(context)
        .pushAndRemoveUntil(RegisterPage.route(), (route) => false);
  }

  Future<void> deleteAccount(BuildContext context) async {
    final currentUser = supabase.auth.currentUser;
    if (currentUser != null) {
      try {
        await supabase.auth.admin.deleteUser(currentUser.id);
        await supabase.auth.signOut(); // Sign out after deleting the account
        Navigator.of(context)
            .pushAndRemoveUntil(RegisterPage.route(), (route) => false);
      } catch (error) {
        context.showErrorSnackBar(
            message: 'You are not allowed to delete your account 😈');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => logOutUser(context),
              child: const Text('Logout'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => deleteAccount(context),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text('Delete Account'),
            ),
          ],
        ),
      ),
    );
  }
}
