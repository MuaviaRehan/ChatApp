import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final __emailController = TextEditingController();
  final _pwController = TextEditingController();

  // Callback for register button
  final void Function()? ontap;

  LoginPage({super.key, required this.ontap});

  // Login method
  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(
        __emailController.text,
        _pwController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
            style: GoogleFonts.poppins(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                  size: 80,
                ),

                const SizedBox(height: 25),

                // Welcome text
                Text(
                  "Welcome back, you've been missed!",
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 25),

                // Email field
                MyTextField(
                  hintText: 'Email',
                  obscureText: false,
                  controller: __emailController,
                  focusNode: null,
                ),

                const SizedBox(height: 15),

                // Password field
                MyTextField(
                  hintText: 'Password',
                  obscureText: true,
                  controller: _pwController,
                  focusNode: null,
                ),

                const SizedBox(height: 25),

                // Sign in button
                ElevatedButton(
                  onPressed: () => login(context),
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Register row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: ontap,
                      child: Text(
                        " Register Now",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
