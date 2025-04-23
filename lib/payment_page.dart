import 'package:flutter/material.dart';
import 'package:khalti_example/khalti/khalti_service.dart';
import 'package:khalti_example/khalti/payment_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final KhaltiService _khaltiService = KhaltiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _khaltiService.makePayment(
              context,
              paymentModel: PaymentModel(
                amount: 10000,
                productId: 'product_id',
                productName: 'Product Name',
                productUrl: 'http://example.com/product',
              ),
            );
          },
          child: Text('Pay with Khalti'),
        ),
      ),
    );
  }
}
