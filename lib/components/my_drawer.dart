import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  
void logout() {
  // get auth service
  final auth = AuthService();
  auth.signOut();
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              DrawerHeader(
                  child: Center(
                      child: Icon(Icons.message,
                          size: 50,
                          color: Theme.of(context).colorScheme.primary))),
              // home list tile
              Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(

                      // pop the drawer
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      leading: Icon(Icons.home,
                          color: Theme.of(context).colorScheme.primary),
                      title: Text('H O M E',
                          style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.primary)))),
              // setting list tile
              Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(

                      // pop the drawer
                      onTap: () {
                        Navigator.of(context).pop();
                        // navigate to settings page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ),
                        );
                      },
                      leading: Icon(Icons.settings,
                          color: Theme.of(context).colorScheme.primary),
                      title: Text('S E T T I N G S ',
                          style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.primary)))),
            ],
          ),
          // logout list tile
          Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25),
              child: ListTile(
                  // pop the drawer

                  onTap: logout  ,
                  leading: Icon(Icons.logout,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text('L O G  O U T ',
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.primary))))
        ],
      ),
    );
  }
}
