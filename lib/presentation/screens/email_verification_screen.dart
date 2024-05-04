import 'package:ecommerce_project/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 170),
            const AppLogo(),
            const SizedBox(height: 16),
            Text(
              'Welcome Back',
              style: textTheme.headlineLarge,
            ),
            const SizedBox(height: 6),
            Text(
              'Please Enter Your Email Address',
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 18),
            TextFormField(
              controller: _emailTEController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email'
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _emailTEController.clear();
    super.dispose();
  }
}
