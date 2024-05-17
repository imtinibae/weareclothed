import 'package:flutter/material.dart';
import 'package:weareclothed/components/my_button.dart';
import 'package:weareclothed/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final void Function ()? onTap;
  LoginPage({super.key, required this.onTap});

  //text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() {}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //logo
        children: [
          const Icon(
            Icons.person,
            size: 80,
          ),

          //app name
          const Text("weareclothed", style: TextStyle(fontSize: 20)),

          const SizedBox(height: 50),

          //email textified
          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: emailController,
          ),

          const SizedBox(height: 10),
          //password

          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: passwordController,
          ),

          //forgot password
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Forgot Password ? "),
            ],
          ),

          //sign in button
          MyButton(
            text: "Login",
            onTap: login,
          ),
          const SizedBox(height: 25),

          //don't have an account ? Register here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account ? "),
              GestureDetector(
                onTap: onTap,
                child: const Text(
                  "Register Here ! ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    )));
  }
}
