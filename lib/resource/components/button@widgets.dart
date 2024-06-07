import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final bool isLoading;

  const ElevatedButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonColor=Colors.green,
      this.textColor=Colors.white,
      this.isLoading=false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: buttonColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          )
          ),
      
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
              ),
      ),
    );
  }
}
