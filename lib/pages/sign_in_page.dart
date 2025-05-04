import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const BookstoreApp());
}

class BookstoreApp extends StatelessWidget {
  const BookstoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookstore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Устанавливаем белый фон для Scaffold
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Круглые углы
            borderSide: const BorderSide(color: Color(0xFF3D3C3C)), // Цвет границы
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Круглые углы
            borderSide: const BorderSide(color: Color(0xFF3D3C3C)), // Цвет границы
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF676767)), // Цвет текста
          bodyMedium: TextStyle(color: Color(0xFF676767)), // Цвет текста
        ),
      ),
      home: const SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _validationError = '';
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
      _validationError = '';
    });

    // Basic validation
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _validationError = 'Please fill in all fields';
        _isLoading = false;
      });
      return;
    }

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // For demo purposes, just navigate after delay
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
      backgroundColor: Colors.white, // Устанавливаем белый фон для Scaffold
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white, // Устанавливаем белый фон для Container
            padding: const EdgeInsets.all(24.0),
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Unica One', // Шрифт Unica One
                      color: Color(0xFF676767), // Цвет текста
                    ),
                  ),
                ),

                // Dotted Border around the form
                DottedBorder(
                  color: const Color(0xFF3D3C3C), // Цвет пунктирной линии
                  strokeWidth: 2.0, // Толщина линии
                  dashPattern: [6, 4], // Длина точек и промежутков
                  borderType: BorderType.RRect, // Тип границы
                  radius: const Radius.circular(30), // Круглые углы
                  padding: const EdgeInsets.all(16.0), // Внутренний отступ
                  child: Container(
                    width: isMobile ? 300 : 600, // Увеличиваем ширину формы
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Белый фон
                      borderRadius: BorderRadius.circular(30.0), // Круглые углы
                    ),
                    child: Column(
                      children: [
                        // Email Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Enter your email',
                              style: TextStyle(color: Color(0xFF676767)), // Цвет текста
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: 'example@example.com',
                                hintStyle: TextStyle(color: Color(0xFF676767)), // Цвет подсказки
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
                              keyboardType: TextInputType.emailAddress, // Убедитесь, что это установлено
                              style: TextStyle(color: Color(0xFF676767)), // Цвет текста
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Password Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Enter your password',
                              style: TextStyle(color: Color(0xFF676767)), // Цвет текста
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                hintText: '********',
                                hintStyle: TextStyle(color: Color(0xFF676767)), // Цвет подсказки
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
                              obscureText: true, // Убедитесь, что это установлено
                              style: TextStyle(color: Color(0xFF676767)), // Цвет текста
                            ),
                          ],
                        ),

                        // Forgot Password
                        const SizedBox(height: 5), // Отступ сверху
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(color: Colors.blue), // Цвет ссылки
                            ),
                          ),
                        ),
                        const SizedBox(height: 5), // Отступ снизу

                        // Sign In Button with Solid Border
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF3D3C3C), // Цвет границы
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0), // Круглые углы
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _handleLogin,
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
                                    'Sign in',
                                    style: TextStyle(color: Color(0xFF676767)), // Цвет текста
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
                      "Don't registered yet?",
                      style: TextStyle(color: Color(0xFF676767)), // Цвет текста
                    ),
                    const SizedBox(height: 4),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(text: 'Create an account ',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text: 'in a few steps ->',
                              style: TextStyle(color: Color(0xFF676767)), // Цвет ссылки
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
