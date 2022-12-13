import 'package:flutter/material.dart';

class CreateAccountSection extends StatelessWidget {
  const CreateAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an Account ?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        TextButton(
            onPressed: () => Navigator.pushNamed(context, '/signup'),
            child: const Text(
              'Create Account',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 16,
              ),
            ))
      ],
    );
  }
}
