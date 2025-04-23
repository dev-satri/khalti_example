import 'package:flutter/material.dart';
import 'package:khalti_example/khalti/payment_model.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KhaltiService {
  void makePayment(BuildContext context, {required PaymentModel paymentModel}) {
    KhaltiScope.of(context).pay(
      preferences: [PaymentPreference.khalti],
      config: PaymentConfig(
        amount: paymentModel.amount, // Amount in paisa (10000 paisa = Rs. 100)
        productIdentity: paymentModel.productId,
        productName: paymentModel.productName,
        productUrl: paymentModel.productUrl,
        additionalData: {
          'merchant_name': 'Your Business Name',
          'merchant_extra': 'Additional merchant data',
        },
      ),
      onSuccess: (PaymentSuccessModel success) {
        // Handle payment success
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment Successful: ${success.token}')),
        );

        // Verify payment on your server
        verifyPayment(success.token);
      },
      onFailure: (PaymentFailureModel failure) {
        // Handle payment failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment Failed: ${failure.message}')),
        );
      },
      onCancel: () {
        // Handle when user cancels payment
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Payment Cancelled')));
      },
    );
  }

  void verifyPayment(String token) async {
    // Send this token to your backend to verify the payment
    // Example API call (you need to implement your own server-side verification)
    /*
    final response = await http.post(
      Uri.parse('https://your-server.com/verify-payment'),
      body: {
        'token': token,
        'amount': 10000,
      },
    );
    
    // Handle verification response
    */
  }
}
