import 'package:flutter/material.dart';
import 'package:weareclothed/components/my_button.dart';
import 'package:weareclothed/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
 final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});
  //text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  //register method
  void register() {}

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

                  //uswername textified
                  MyTextField(
                    hintText: "Username",
                    obscureText: false,
                    controller: usernameController,
                  ),

                  const SizedBox(height: 10),

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

                  //confirm password
                  MyTextField(
                    hintText: "Confirm Password",
                    obscureText: true,
                    controller: confirmPwController,
                  ),

                  //forgot password
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password ? "),
                    ],
                  ),

                  //register button
                  MyButton(
                    text: "Login",
                    onTap: register,
                  ),
                  const SizedBox(height: 25),

                  //don't have an account ? Register here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account ? "),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          "Login Here ! ",
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
