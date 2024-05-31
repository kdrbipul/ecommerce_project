import 'package:ecommerce_project/presentation/screens/home_screen.dart';
import 'package:ecommerce_project/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                const SizedBox(height: 24),
                const AppLogo(),
                const SizedBox(height: 16),
                Text(
                  'Complete Profile',
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(height: 6),
                Text(
                  'Get started with us with your details',
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(height: 18),
                buildCompleteProfileForm(),
                const SizedBox(height: 38),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Get.off(() => const HomeScreen());
                    }
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCompleteProfileForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameTEController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'First Name',
              labelText: 'First Name',
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter your first name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _lastNameTEController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Last Name',
              labelText: 'Last Name',
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter your last name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _mobileTEController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: 'Mobile',
              labelText: 'Mobile',
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter mobile number';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _cityTEController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'City',
              labelText: 'City',
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter your city';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _shippingAddressTEController,
            keyboardType: TextInputType.text,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Shipping Address',
              labelText: 'Shipping Address',
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter your address';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();
    super.dispose();
  }
}
