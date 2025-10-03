import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  final _confirmpwController = TextEditingController();

  void Function()? ontap;

  RegisterPage({super.key, required this.ontap});

  void register(BuildContext context) async {
    final auth = AuthService();

    if (_pwController.text == _confirmpwController.text) {
      try {
        await auth.signUpWithEmailAndPassword(
          _emailController.text.trim(),
          _pwController.text.trim(),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString(),
              style: GoogleFonts.poppins(),
            ),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Passwords do not match",
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
                // Logo
                Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                  size: 80,
                ),

                const SizedBox(height: 25),

                // Welcome text
                Text(
                  "Let's create an account for you!",
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 25),

                // Email TextField
                MyTextField(
                  hintText: 'Email',
                  obscureText: false,
                  controller: _emailController,
                  focusNode: null,
                ),

                const SizedBox(height: 10),

                // Password TextField
                MyTextField(
                  hintText: 'Password',
                  obscureText: true,
                  controller: _pwController,
                  focusNode: null,
                ),

                const SizedBox(height: 10),

                // Confirm Password TextField
                MyTextField(
                  hintText: 'Confirm Password',
                  obscureText: true,
                  controller: _confirmpwController,
                  focusNode: null,
                ),

                const SizedBox(height: 25),

                // Register button
                ElevatedButton(
                  onPressed: () => register(context),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Already have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: ontap,
                      child: Text(
                        " Sign In",
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
