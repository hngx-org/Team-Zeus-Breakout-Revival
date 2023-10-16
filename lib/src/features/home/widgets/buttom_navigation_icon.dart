import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationIcon extends StatelessWidget {
  final String text;

  final VoidCallback? onTap;
  const BottomNavigationIcon({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/${text.split('||')[0]}.svg',
          ),
          Positioned(
            bottom: 15,
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/svg/${text.split('||')[1]}.svg',
                  height: 30,
                ),
                Text(
                  text.split('||')[2],
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Digitalt',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
