import 'package:ecommerce_project/presentation/screens/otp_verification_screen.dart';
import 'package:ecommerce_project/presentation/state_holders/verify_email_controller.dart';
import 'package:ecommerce_project/presentation/utils/constants.dart';
import 'package:ecommerce_project/widgets/app_logo.dart';
import 'package:ecommerce_project/widgets/centered_circular_progress_indicator.dart';
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter Your Email";
                      }
                      if (Constants.emailValidatorRegExp.hasMatch(value!) ==
                          false) {
                        return "Enter Your Valid Email Address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 18),
                  GetBuilder<EmailVerificationController>(
                      builder: (emailVerificationController) {
                    if (emailVerificationController.inProgress) {
                      return const CenteredCircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          emailVerificationController
                              .verifyEmail(
                                _emailTEController.text.trim(),
                              )
                              .then(
                                (result) => {
                                  if (result)
                                    {
                                      Get.to(
                                        () => OtpVerificationScreen(
                                          email: _emailTEController.text,
                                        ),
                                      ),
                                    }
                                  else
                                    {
                                      Get.snackbar(
                                        '',
                                        emailVerificationController
                                            .errorMessage,
                                        snackPosition: SnackPosition.TOP,
                                        showProgressIndicator: true,
                                        backgroundColor: Colors.orange,
                                        colorText: Colors.white,
                                        borderRadius: 5,
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(5),
                                        icon: const Icon(
                                          Icons.ac_unit,
                                          color: Colors.white,
                                        ),
                                        isDismissible: false,
                                        duration: const Duration(seconds: 3),
                                        animationDuration:
                                            const Duration(milliseconds: 600),
                                      ),
                                    }
                                },
                              );
                        }
                      },
                      child: const Text('Next'),
                    );
                  }),
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
