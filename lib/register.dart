import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weareclothed/components/my_button.dart';
import 'package:weareclothed/components/my_textfield.dart';

import 'helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
 final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPwController = TextEditingController();

  //register method
  void registerUser() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) =>
      const Center (
        child: CircularProgressIndicator(),
      ),
    );

// make sure passwords match
if (passwordController.text != confirmPwController.text) {
  //pop loading circle
  Navigator.pop(context);

  //show error message to user
  displayMessageToUser ("Passwords don't match", context);
}
//try creating the user
  
  try {
  //create the user 
    UserCredential?userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email : emailController.text, password: passwordController.text);

    //pop loading circle
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    //pop loading circle
    Navigator.pop(context);
    
    //display error message to User
    displayMessageToUser(e.code, context);

  }



  }

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

                  const SizedBox(height: 30),

                  //uswername textified
                  MyTextField(
                    hintText: "Username",
                    obscureText: false,
                    controller: usernameController,
                  ),

                  const SizedBox(height: 5),

                  //email textified
                  MyTextField(
                    hintText: "Email",
                    obscureText: false,
                    controller: emailController,
                  ),

                  const SizedBox(height: 5),

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
                    onTap: registerUser,
                  ),
                  const SizedBox(height: 15),

                  //don't have an account ? Register here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account ? "),
                      GestureDetector(
                        onTap: widget.onTap,
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
