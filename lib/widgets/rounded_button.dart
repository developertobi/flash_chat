import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.color,
    this.isLoading = false,
  }) : super(key: key);

  final String buttonText;
  final void Function()? onPressed;
  final Color? color;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: isLoading
              ? const SizedBox(
                  height: 30, width: 30, child: CircularProgressIndicator())
              : Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
