import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeus_breakout_rivival/utils/flame_utils.dart';

extension PaddingExtension on Widget {
  /// Adds padding to the widget with all sides having the same padding value.
  Widget padAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this, // 'this' refers to the current widget.
    );
  }

  /// Adds horizontal padding to the widget.
  Widget padHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  /// Adds vertical padding to the widget.
  Widget padVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  /// Adds symmetric padding to the widget.
  Widget padSymmetric({double vertical = 0, double horizontal = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  /// Adds left padding to the widget.
  Widget padLeft(double padding) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: this,
    );
  }

  /// Adds right padding to the widget.
  Widget padRight(double padding) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: this,
    );
  }

  /// Adds top padding to the widget.
  Widget padTop(double padding) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: this,
    );
  }

  /// Adds bottom padding to the widget.
  Widget padBottom(double padding) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: this,
    );
  }

  Widget padOnly({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 0,
        right: right ?? 0,
        top: top ?? 0,
        bottom: bottom ?? 0,
      ),
      child: this,
    );
  }
}

extension CustomSizedBox on num {
  /// Creates a SizedBox with the width set to the value.
  SizedBox get wi {
    return SizedBox(
      width: toDouble(),
    );
  }

  /// Creates a SizedBox with the height set to the value.
  SizedBox get hi {
    return SizedBox(
      height: toDouble(),
    );
  }

  /// Creates a SizedBox with both width and height set to the value.
  SizedBox get wh {
    return SizedBox(
      width: toDouble(),
      height: toDouble(),
    );
  }

  /// Creates a SizedBox with the specified width and height.
  SizedBox size({required double width, required double height}) {
    return SizedBox(
      width: width.toDouble(),
      height: height.toDouble(),
    );
  }
}

extension FilePaths on String {
  String get svg => 'assets/svg/$this.svg';
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get jpeg => 'assets/images/$this.jpeg';
  String get gif => 'assets/images/$this.gif';
  String get json => 'assets/lottie/$this.json';

  Text get textSmall => Text(
        this,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      );

  Text get textMedium => Text(
        this,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      );

  Text get textLarge => Text(
        this,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      );

  SvgPicture get svgPicture => SvgPicture.asset(
        'assets/svg/$this.svg',
      );

  GestureDetector imageWithTap({
    required VoidCallback onTap,
    bool isMainSound = false,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
        if (!isMainSound) {
          FlameUtils.playBgmWithDelay(
            'click.mp3',
            volume: 0.2,
            delayMilliseconds: 300,
          );
        }
      },
      child: svgPicture,
    );
  }
}
