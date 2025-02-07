import 'package:flutter/material.dart';

import '../colors/colors.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onCancelPressed;
  final VoidCallback onSubmitPressed;
  final String cancelText;
  final String submitText;

  const ActionButtons({
    super.key,
    required this.onCancelPressed,
    required this.onSubmitPressed,
    required this.cancelText,
    required this.submitText,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.058,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: TextButton(
                onPressed: onCancelPressed,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: black),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  cancelText,
                  style: const TextStyle(
                    color: black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: TextButton(
                onPressed: onSubmitPressed,
                style: TextButton.styleFrom(
                  backgroundColor: black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  submitText,
                  style: const TextStyle(
                    color: white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}