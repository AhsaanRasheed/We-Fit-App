import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  final Widget child;
  final bool loading;
  final bool showBGColor;
  const LoadingSpinner(
      {super.key,
      this.loading = false,
      required this.child,
      this.showBGColor = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        loading
            ? Container(
                alignment: Alignment.center,
                color: showBGColor ? Colors.black12 : null,
                child: const CircularProgressIndicator(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
