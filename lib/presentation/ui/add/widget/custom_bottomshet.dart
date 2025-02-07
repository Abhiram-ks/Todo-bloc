import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';
import '../../../core/widget/action_buttons.dart';

class CustomeBottmSheet extends StatelessWidget {
  final VoidCallback onConfirm;
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const CustomeBottmSheet({
    super.key,
    required this.onConfirm,
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close_sharp,
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  hight10,
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  hight10,
                  Text(
                    description,
                    textAlign: TextAlign.center,
                  ),
                  hight10,
                  Icon(icon, color: color, size: 30),
                ],
              ),
            ),
            const Spacer(),
            ActionButtons(
              onCancelPressed: () {
                Navigator.pop(context);
              },
              onSubmitPressed: onConfirm,
              cancelText: 'Cancel',
              submitText: 'Confirm',
            ),
           hight30
          ],
        ),
      ),
    );
  }
}
