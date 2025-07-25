import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final TextEditingController _usernameRegister = TextEditingController();
  // final TextEditingController _emailRegister = TextEditingController();
  // final TextEditingController _passwordRegister = TextEditingController();
  // final TextEditingController _konfirPasswordRegister = TextEditingController();

  bool enablePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(148, 230, 150, 1),
              Color.fromRGBO(109, 238, 70, 1),
            ],
            begin: Alignment.topLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo-brand.png", fit: BoxFit.cover),

                SizedBox(height: 70),

                TextField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Username",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.green,
                      size: 20,
                    ),
                  ),
                ),

                SizedBox(height: 30),

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Email",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.green,
                      size: 20,
                    ),
                  ),
                ),

                SizedBox(height: 30),

                TextField(
                  obscureText: enablePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.green, size: 20),
                    suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          enablePassword = !enablePassword;
                        });
                      },
                      icon: Icon(
                        enablePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                TextField(
                  obscureText: enablePassword,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.green, size: 20),
                    suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          enablePassword = !enablePassword;
                        });
                      },
                      icon: Icon(
                        enablePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LoginScreen()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.only(top: 18, bottom: 18),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          // fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => LoginScreen(),
                                //   ),
                                // );
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
