import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _validationError = '';
  bool _isLoading = false;

  Future<void> _handleRegister() async {
    setState(() {
      _isLoading = true;
      _validationError = '';
    });

    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      setState(() {
        _validationError = 'Please fill in all fields';
        _isLoading = false;
      });
      return;
    } else if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _validationError = 'Passwords do not match';
        _isLoading = false;
      });
      return;
    } else {
      setState(() {
        _validationError = '';
      });
    }

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });
    Navigator.pushReplacementNamed(context, '/account');
  }

  void _handleGoogleSignIn() async {
    const googleAuthUrl = 'YOUR_LITRES_URL/signin/google'; // Replace with your URL
    final uri = Uri.parse(googleAuthUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch Google sign-in')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24.0),
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Unica One',
                      color: Color(0xFF676767),
                    ),
                  ),
                ),

                // Dotted Border around the form
                DottedBorder(
                  color: const Color(0xFF3D3C3C),
                  strokeWidth: 2.0,
                  dashPattern: [6, 4],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(30),
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: isMobile ? 300 : 600,
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        // Name Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Enter your name',
                              style: TextStyle(color: Color(0xFF676767)),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(color: Color(0xFF676767)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 16.0,
                                ),
                              ),
                              style: TextStyle(color: Color(0xFF676767)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Email Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Enter your email',
                              style: TextStyle(color: Color(0xFF676767)),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: 'example@example.com',
                                hintStyle: TextStyle(color: Color(0xFF676767)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 16.0,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Color(0xFF676767)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Password Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Type your password',
                              style: TextStyle(color: Color(0xFF676767)),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                hintText: '********',
                                hintStyle: TextStyle(color: Color(0xFF676767)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 16.0,
                                ),
                              ),
                              obscureText: true,
                              style: TextStyle(color: Color(0xFF676767)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Confirm Password Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Retype your password',
                              style: TextStyle(color: Color(0xFF676767)),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: _confirmPasswordController,
                              decoration: const InputDecoration(
                                hintText: '********',
                                hintStyle: TextStyle(color: Color(0xFF676767)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(color: Color(0xFF3D3C3C)),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 16.0,
                                ),
                              ),
                              obscureText: true,
                              style: TextStyle(color: Color(0xFF676767)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Sign Up Button with Solid Border
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF3D3C3C),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _handleRegister,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFDBF0F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: _isLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Continue',
                                    style: TextStyle(color: Color(0xFF676767)),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward, size: 18),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Validation Error
                        if (_validationError.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              _validationError,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Google Button and Registration
                Column(
                  children: [
                    // Google Button
                    SignInButton(
                      Buttons.Google,
                      onPressed: _handleGoogleSignIn,
                    ),

                    const SizedBox(height: 16),

                    // Registration Text
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Color(0xFF676767)),
                    ),
                    const SizedBox(height: 4),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signIn');
                      },
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(text: 'Sign in ->',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
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

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
