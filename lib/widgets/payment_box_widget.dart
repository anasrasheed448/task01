import 'package:flutter/material.dart';
import '../models/user_model_provider.dart';

class PaymentBoxWidget extends StatelessWidget {
  const PaymentBoxWidget({
    required this.width,
    required this.height,
    required this.userData,
  });
  final double width;
  final double height;
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.02),
      width: width * 0.45,
      height: height * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.02),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment:",
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Container(
                padding: EdgeInsets.all(width * 0.002),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                ),
                child: Text(
                  userData.status ? "Paid" : "Unpaid",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(height: 0.01 * height),
          Center(
            child: Text(
              userData.depositeAmount.toString(),
              style: TextStyle(
                  fontSize: height * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
