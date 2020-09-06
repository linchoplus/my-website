import 'package:flutter/material.dart';

import 'package:my_website/widgets/responsive.dart';
import 'package:my_website/widgets/image_hero.dart';

import 'package:my_website/settings/list_carousel.dart';

class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...Iterable<int>.generate(lImagesCarousel.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              child: SizedBox(
                                height: screenSize.width / 2.5,
                                width: screenSize.width / 1.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: ImageHero(
                                    image: lImagesCarousel[pageIndex],
                                    tag: lImagesCarousel[pageIndex],
                                  ),
                                ),
                              ),
                              elevation: 5.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  lImagesNamesCarousel[pageIndex],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w900,
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1
                                        .color,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                            width: pageIndex < lImagesCarousel.length - 1
                                ? screenSize.width / 15
                                : null),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(lImagesCarousel.length).map(
                  (int pageIndex) => Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 3.5,
                        child: Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: ImageHero(
                              image: lImagesCarousel[pageIndex],
                              tag: lImagesCarousel[pageIndex],
                            ),
                          ),
                          elevation: 5.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            lImagesNamesCarousel[pageIndex],
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .subtitle1
                                  .color,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
