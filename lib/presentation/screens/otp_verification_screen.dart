import 'package:ecommerce_project/presentation/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/presentation/state_holders/verify_otp_controller.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/widgets/app_logo.dart';
import 'package:ecommerce_project/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({
    super.key,
    required this.email,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _count = 60.obs;

  @override
  void initState() {
    super.initState();
    timeDecrement();
  }

  void timeDecrement() async {
    while (_count.value > 0) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      _count.value--;
    }
  }

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
                GetBuilder<OtpVerificationController>(
                    builder: (otpVerificationController) {
                  if (otpVerificationController.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      final result = await otpVerificationController.verifyOtp(
                        widget.email,
                        _otpTEController.text,
                      );
                      if (result) {
                        Get.off(
                          () => const CompleteProfileScreen(),
                        );
                      } else {
                        Get.snackbar(
                          '',
                          otpVerificationController.errorMessage,
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
                          animationDuration: const Duration(milliseconds: 600),
                        );
                      }
                    },
                    child: const Text('Next'),
                  );
                }),
                const SizedBox(height: 34),
                buildResendCodeMessage(),
                Obx(
                  () => Visibility(
                    visible: _count.value == 0,
                    replacement: const SizedBox(),
                    child: TextButton(
                      onPressed: () {
                        _count.value = 10;
                        timeDecrement();
                      },
                      child: const Text('Resend Code'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildResendCodeMessage() {
    return Obx(
      () => RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          children: [
            const TextSpan(
              text: ('This code will be expire in '),
            ),
            TextSpan(
              text: ("${_count.value}s"),
              style: const TextStyle(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinField() {
    return Form(
      key: _formKey,
      child: PinCodeTextField(
        validator: (String? value) {
          if (value?.isEmpty ?? true) {
            return "Enter Your Email";
          } else {
            return null;
          }
        },
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
        enableActiveFill: true,
        appContext: context,
      ),
    );
  }

  @override
  void dispose() {
    _otpTEController.clear();
    super.dispose();
  }
}
