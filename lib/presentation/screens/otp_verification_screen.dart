import 'package:ecommerce_project/presentation/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email,});

  @override
  State<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 170),
                const AppLogo(),
                const SizedBox(height: 16),
                Text(
                  'Enter Otp Code',
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(height: 6),
                Text(
                  'A 6 digit OTP code have been send',
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(height: 18),
                _buildPinField(),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const CompleteProfileScreen(),);
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 34),
                buildResendCodeMessage(),
                TextButton(onPressed: (){}, child: const Text('Resend Code'),),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildResendCodeMessage() {
    return RichText(
            text: const TextSpan(
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(text: ('This code will be expire in')),
                  TextSpan(
                      text: ('100s'),
                      style: TextStyle(color: AppColors.primaryColor))
                ]),
          );
  }
  Widget _buildPinField() {
    return PinCodeTextField(
      controller: _otpTEController,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: Colors.transparent,
      ),
      animationDuration: const Duration(milliseconds: 300),
      // backgroundColor: Colors.blue.shade50,
      enableActiveFill: true,
      // errorAnimationController: errorController,
      // controller: textEditingController,
      appContext: context,
    );
  }

  @override
  void dispose() {
    _otpTEController.clear();
    super.dispose();
  }
}
