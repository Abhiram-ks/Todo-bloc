import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constant/constant.dart';

class CustomTextFormFild extends StatelessWidget {
  final bool obscureText;
  final bool enabled;
  final String title;
  final String comment;
  final IconData icon;
  final Color color;
  final TextEditingController header;
  final TextEditingController description;

  const CustomTextFormFild({
    super.key,
    required this.header,
    required this.description,
    required this.color,
    required this.comment,
    required this.icon,
    required this.title,
    this.obscureText = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          hight10,
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 50,
                height: 60,
                child: Icon(
                  Icons.rocket_launch_rounded,
                  size: 30,
                  color: black,
                ),
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: TextFormField(
                  controller: header,
                  obscureText: obscureText,
                  validator: NameValidator.validate,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  enabled: enabled,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: grey)),
                    labelStyle: TextStyle(color: black),
                    errorBorder:
                        UnderlineInputBorder(borderSide: BorderSide(color: red)),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide(color: blue)),
                    hintStyle: TextStyle(color: grey),
                    labelText: 'Header',
                    hintText: 'Enter task Header',
                  ),
                ),
              ))
            ],
          ),
          hight10,
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 50,
                height: 60,
                child: Icon(
                  Icons.description_outlined,
                  size: 30,
                  color: black,
                ),
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: TextFormField(
                  controller: description,
                  obscureText: obscureText,
                  validator: NameValidator.validate,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  enabled: enabled,
                  minLines: 1,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: grey)),
                    labelStyle: TextStyle(color: black),
                    errorBorder:
                        UnderlineInputBorder(borderSide: BorderSide(color: red)),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide(color: blue)),
                    hintStyle: TextStyle(color: grey),
                    labelText: 'Describtion',
                    hintText: 'Enter task Describtion',
                  ),
                ),
              ))
            ],
          ),SizedBox.shrink(),hight30,
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
                  comment,
                  textAlign: TextAlign.center,
                ),
                hight10,
                Icon(icon, color: color, size: 30),
              ],
            ),
          ),
          hight10,
        ],
      ),
    );
  }
}

class NameValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Complite fileds';
    }
    if (value.startsWith(' ')) {
      return 'First letter must not be a space';
    }

    return null;
  }
}
