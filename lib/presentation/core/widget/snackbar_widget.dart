import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';


class CustomeSnackBar {
  static void show({
    required BuildContext context,
    required String title,
    required String description,
    required Color backgroundColor,
    required IconData icon,
  }){
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: TweenAnimationBuilder<double>(tween: Tween(begin: 0.0, end: 1.0), duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
         builder: (context, value, child) {
           return Transform.translate(
            offset: Offset(0, 20*(1 - value)),
            child: child,
            );
         },
         child: Row(
          children: [
            Icon(icon, color: white, size: 28),
            Expanded(child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                      title,
                      style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        // ignore: deprecated_member_use
                        color: white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
          ],
         ),
         ),
         duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          elevation: 3,
          backgroundColor: backgroundColor,
           shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
         ),
         
    );
  }
}