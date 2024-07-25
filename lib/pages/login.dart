import 'package:agrichapchap/pages/buyers_products_grid.dart';
import 'package:agrichapchap/pages/forgot_password.dart';
import 'package:agrichapchap/pages/home_screen.dart';
import 'package:agrichapchap/pages/register_buyer.dart';
import 'package:agrichapchap/pages/register_farmer.dart';
import 'package:flutter/material.dart';
import 'package:agrichapchap/constants/app_colors.dart';
import 'package:agrichapchap/constants/button_styles.dart';
import 'package:agrichapchap/constants/form_field_decoration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Username Field
                TextFormField(
                  controller: _usernameController,
                  decoration: formFieldDecoration('Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: formFieldDecoration("Password").copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.mintGreenText,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  style: ButtonStyles.loginButtonStyle,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Logging in...')),
                      );

                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 250),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 100),
                          pageBuilder:
                              ((context, animation, secondaryAnimation) =>
                                  ScaleTransition(
                                    alignment: Alignment.bottomCenter,
                                    scale: animation,
                                    child: const ProductsGrid(),
                                  )),
                        ),
                      );
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text('Login'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.login, size: 24),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("Register as a buyer "),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 250),
                                reverseTransitionDuration:
                                    const Duration(milliseconds: 100),
                                pageBuilder:
                                    ((context, animation, secondaryAnimation) =>
                                        ScaleTransition(
                                          alignment: Alignment.bottomCenter,
                                          scale: animation,
                                          child: RegisterBuyer(),
                                        )),
                              ),
                            );
                          },
                          child: const Text(
                            'create here',
                            style: TextStyle(
                              color: AppColors.mintGreenText,
                              fontSize: 12.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Register as a farmer? "),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 250),
                                reverseTransitionDuration:
                                    const Duration(milliseconds: 100),
                                pageBuilder:
                                    ((context, animation, secondaryAnimation) =>
                                        ScaleTransition(
                                          alignment: Alignment.bottomCenter,
                                          scale: animation,
                                          child: const Register(),
                                        )),
                              ),
                            );
                          },
                          child: const Text(
                            'create here',
                            style: TextStyle(
                              color: AppColors.mintGreenText,
                              fontSize: 12.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Text("Forgot Password? "),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPassword()),
                            );
                          },
                          child: const Text(
                            'reset here',
                            style: TextStyle(
                              color: AppColors.mintGreenText,
                              fontSize: 12.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
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
