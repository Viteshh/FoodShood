import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 237, 237, 237),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 15),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    labelStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: const Color.fromARGB(249, 104, 104, 104),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(250, 250, 74, 13),
                      ),
                    ),
                  ),
                  validator: (value) {
                    // Define your email validation logic using a regular expression (regex)
                    final emailRegex = RegExp(
                        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z\d-]{2,4}$');
                    if (value!.isEmpty) {
                      return 'Please enter an email address.';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address.';
                    }
                    return null; // Return null if the validation passes
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Color.fromARGB(249, 104, 104, 104),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(250, 250, 74, 13),
                      ),
                    ),
                  ),
                  obscureText: true, // Hide the entered text for password input
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password.';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long.';
                    }
                    return null; // Return null if the validation passes
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Color.fromARGB(249, 104, 104, 104),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(250, 250, 74, 13),
                      ),
                    ),
                  ),
                  obscureText: true, // Hide the entered text for password input
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password';
                    }

                    // ignore: unrelated_type_equality_checks
                    else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null; // Return null if the validation passes
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Perform login logic
                      // ...
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(250, 250, 74, 13),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.height * 0.06),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              "assets/image/google.png",
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.07,
                            )),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                    Card(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/image/meta.png",
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.12,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
