// ignore_for_file: use_build_context_synchronously

import 'package:final_practice/constants.dart';
import 'package:final_practice/screens/friendsList_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [Color(0xffffd89b), Color(0xff19547b)])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, screenWidth * 0.2, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.rotate(
                      angle: -1.5708,
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.white70),
                      ),
                    ),
                    const Text(
                      "A world of\npossibility in an\napp",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenWidth * 0.1,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(screenWidth * 0.1, 0, 20, 0),
                child: reusableTextField(
                    "Email", Icons.email, false, _emailController),
              ),
              SizedBox(
                height: screenWidth * 0.1,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(screenWidth * 0.1, 0, 20, 0),
                child: reusableTextField(
                    "Password", Icons.password, true, _passwordController),
              ),
              SizedBox(
                height: screenWidth * 0.6,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(screenWidth * 0.50, 0, 20, 0),
                child: loginButtonNew(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextField reusableTextField(String text, IconData icon, bool isPasswordType,
      TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      decoration: InputDecoration(
        suffixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        labelText: text,
        labelStyle: const TextStyle(color: Colors.black),
        // filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
    );
  }

  Container loginButtonNew(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.width * 0.12,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: [Color(0xFFFFD89B), Color(0xFF19547B)],
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GestureDetector(
        onTap: () async {
          if (!_emailController.text.isValidEmail()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Please enter a valid email address"),
              ),
            );
            return;
          }

          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FriendsListScreen(),
              ),
            );
          } on FirebaseAuthException catch (error) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error.message.toString())));
          }
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(width: 8), // Add some spacing between text and arrow
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
