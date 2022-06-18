import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.center = false}) : super(key: key);

  final bool center;

  @override
  Widget build(BuildContext context) {
    return center
        ? Container(
            color: Colors.transparent,
            child: const Center(child: CircularProgressIndicator()))
        : const CircularProgressIndicator();
  }
}
