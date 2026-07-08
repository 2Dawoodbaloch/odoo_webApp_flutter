import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class USnackBarHelpers {
  /// Custom floating toast (requires context)
  static void customToast({
    required BuildContext context,
    required String message,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      content: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.amber,
        ),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Warning Orange Snack bar
  static void warningSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Iconsax.warning_2, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (message.isNotEmpty)
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.orange,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Success Green Snack bar
  static void successSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Iconsax.check, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (message.isNotEmpty)
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: APPColors.primary, // Make sure UColors.primary exists
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Error Red Snack bar
  static void errorSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Iconsax.warning_2, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (message.isNotEmpty)
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red.shade600,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}