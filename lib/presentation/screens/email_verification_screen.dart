import 'package:ecommerce_project/presentation/screens/otp_verification_screen.dart';
import 'package:ecommerce_project/presentation/utils/constants.dart';
import 'package:ecommerce_project/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
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
                      labelText: 'Email',
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Your Email";
                      }
                      if(Constants.emailValidatorRegExp.hasMatch(value!) == false){
                        return "Enter Your Valid Email Address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(
                          () => OtpVerificationScreen(
                            email: _emailTEController.text,
                          ),
                        );
                      }
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ),
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
