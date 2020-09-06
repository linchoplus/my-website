import 'package:flutter/material.dart';

class ImageHero extends StatelessWidget {
  const ImageHero(
      {Key key,
      @required this.image,
      @required this.tag,
      this.onTap,
      this.width})
      : super(key: key);

  final String image;
  final String tag;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
