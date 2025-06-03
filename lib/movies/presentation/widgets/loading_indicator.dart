import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
