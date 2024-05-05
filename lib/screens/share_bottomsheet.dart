import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key, this.controller});
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
        child: Container(
          color: const Color.fromRGBO(255, 255, 255, 0.09),
          padding: const EdgeInsets.symmetric(horizontal: 44),
          height: 300,
          child: _getContent(),
        ),
      ),
    );
  }

  Widget _getContent() {
    return GridView.builder(
        controller: controller,
        itemCount: 100,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(          
          crossAxisCount: 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (contex, index) {});
  }
}
