import 'package:agrichapchap/constants/app_colors.dart';
import 'package:agrichapchap/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:agrichapchap/constants/button_styles.dart';
import 'package:agrichapchap/constants/form_field_decoration.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _selectedCounty;
  String? _selectedConstituency;

  bool _obscureText = true;
  bool _confirmObscureText = true;

  // Dummy data for counties and constituencies
  final Map<String, List<String>> _counties = {
    'County A': ['Constituency 1', 'Constituency 2'],
    'County B': ['Constituency 3', 'Constituency 4'],
  };

  List<String> _filteredConstituencies = [];

  @override
  void initState() {
    super.initState();
    _filteredConstituencies = _counties.values.first;
  }

  void _onCountyChanged(String? newCounty) {
    setState(() {
      _selectedCounty = newCounty;
      _filteredConstituencies = _counties[newCounty] ?? [];
      _selectedConstituency = null; // Reset constituency
    });
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.length != 10 || !RegExp(r'^\d+$').hasMatch(value)) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create an account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // First Name Field
                  TextFormField(
                    controller: _firstNameController,
                    decoration: formFieldDecoration('First Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  // Last Name Field
                  TextFormField(
                    controller: _lastNameController,
                    decoration: formFieldDecoration('Last Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: formFieldDecoration('Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Simple email validation
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  // Phone Number Field
                  TextFormField(
                    controller: _phoneController,
                    decoration: formFieldDecoration('Phone Number'),
                    keyboardType: TextInputType.phone,
                    validator: _validatePhone,
                  ),
                  const SizedBox(height: 16.0),
                  // County Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedCounty,
                    decoration: formFieldDecoration('County'),
                    items: _counties.keys.map((county) {
                      return DropdownMenuItem<String>(
                        value: county,
                        child: Text(county),
                      );
                    }).toList(),
                    onChanged: _onCountyChanged,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a county';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  // Constituency Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedConstituency,
                    decoration: formFieldDecoration('Constituency'),
                    items: _filteredConstituencies.map((constituency) {
                      return DropdownMenuItem<String>(
                        value: constituency,
                        child: Text(constituency),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedConstituency = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a constituency';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: formFieldDecoration('Password').copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration:
                        formFieldDecoration('Confirm Password').copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.mintGreenText,
                        ),
                        onPressed: () {
                          setState(() {
                            _confirmObscureText = !_confirmObscureText;
                          });
                        },
                      ),
                    ),
                    obscureText: _confirmObscureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  // Register Button
                  ElevatedButton(
                    style: ButtonStyles.loginButtonStyle,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Registering...')),
                        );
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text('Register'), // Centered text
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.app_registration, size: 24),
                        ), // Icon at the end
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          const Text("Already have an account? "),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 250),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 100),
                                  pageBuilder: ((context, animation,
                                          secondaryAnimation) =>
                                      ScaleTransition(
                                        alignment: Alignment.bottomCenter,
                                        scale: animation,
                                        child: const Login(),
                                      )),
                                ),
                              );
                            },
                            child: const Text(
                              'login here',
                              style: TextStyle(
                                color: AppColors.mintGreenText,
                                fontSize: 12.0, // Smaller font size
                                decoration:
                                    TextDecoration.underline, // Underline
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
