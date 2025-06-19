import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:st_cv_website/main_layout.dart';
import 'l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String error = '';
  bool _obscurePassword = true;

  Future<void> login(final localizations) async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final email = '$username@mycv.com';

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigate to the next page after successful login
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      setState(() {
        error = localizations.loginFailed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Inside your build method:
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(
            // Add this
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderWithAvatar(
                  mainText: localizations.greeting,
                  lowerText: localizations.profession,
                ),
                const SizedBox(height: 40),
                Text(localizations.loginDescription),
                const SizedBox(height: 24),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                  cursorColor: Color(0xFF2D6045),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscurePassword,
                  cursorColor: Color(0xFF2D6045),
                ),
                const SizedBox(height: 20),
                if (error.isNotEmpty)
                  Text(error, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => login(localizations),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
