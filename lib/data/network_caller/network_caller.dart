import 'dart:convert';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/presentation/screens/email_verification_screen.dart';
import 'package:get/get.dart' as get_x;
import 'package:http/http.dart';

class NetworkCaller {

  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      final Response response = await get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          responseCode: response.statusCode,
          responseData: decodedData,
          isSuccess: true,
        );
      } else if (response.statusCode == 401) {
        _goToSignScreen;
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        responseCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      final Response response = await post(
        Uri.parse(url),
        body: body,
        headers: {
          'accept' : 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          responseCode: response.statusCode,
          responseData: decodedData,
          isSuccess: true,
        );
      } else if (response.statusCode == 401) {
        _goToSignScreen;
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        responseCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }


  static void _goToSignScreen() {
    /*Navigator.push(
      CraftyBay.navigatorKey.currentState!.context,
      MaterialPageRoute(
        builder: (context) => const EmailVerificationScreen(),
      ),
    );*/
    get_x.Get.to(() =>  const EmailVerificationScreen(),);
  }
}
