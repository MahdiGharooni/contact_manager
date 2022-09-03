import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer(
      {this.width = double.infinity,
      this.height = double.infinity,
      this.borderRadius = 0,
      this.margin,
      Key? key})
      : super(key: key);

  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ThemeManager.darkCursorColor.shade400,
      highlightColor: ThemeManager.darkCursorColor.shade300,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: ThemeManager.darkCursorColor.shade400,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }
}
