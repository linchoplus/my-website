import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:my_website/settings/list_carousel.dart';

import 'package:my_website/widgets/responsive.dart';

class DestinationCarouselPages extends StatefulWidget {
  @override
  _DestinationCarouselPagesState createState() =>
      _DestinationCarouselPagesState();
}

class _DestinationCarouselPagesState extends State<DestinationCarouselPages> {
  final CarouselController _controller = CarouselController();
  final List<String> images = lImagesCarousel;
  final List<String> places = lImagesNamesCarousel;

  List _isHovering = lIsHoveringCarousel;
  List _isSelected = lIsSelectedCarousel;

  int _current = 0;

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => Container(
            // padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                element,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: screenSize.width / 1,
          alignment: Alignment.center,
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                    ? PageScrollPhysics()
                    : NeverScrollableScrollPhysics(),
                enlargeCenterPage: true,
                aspectRatio: 18 / 8,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                    for (int i = 0; i < imageSliders.length; i++) {
                      if (i == index) {
                        _isSelected[i] = true;
                      } else {
                        _isSelected[i] = false;
                      }
                    }
                  });
                }),
            carouselController: _controller,
          ),
        ),
        ResponsiveWidget.isSmallScreen(context)
            ? Container()
            : AspectRatio(
                aspectRatio: 18 / 8,
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width / 5.5,
                        right: screenSize.width / 5.5,
                      ),
                      child: Card(
                        elevation: 5.0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height / 100,
                            bottom: screenSize.height / 100,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < places.length; i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[i] = true
                                              : _isHovering[i] = false;
                                        });
                                      },
                                      onTap: () {
                                        _controller.animateToPage(i);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: screenSize.height / 80,
                                          bottom: screenSize.height / 90,
                                        ),
                                        child: Text(
                                          places[i],
                                          style: TextStyle(
                                            color: _isHovering[i]
                                                ? Theme.of(context)
                                                    .primaryTextTheme
                                                    .button
                                                    .decorationColor
                                                : Theme.of(context)
                                                    .primaryTextTheme
                                                    .button
                                                    .color,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: _isSelected[i],
                                      child: AnimatedOpacity(
                                        duration: Duration(milliseconds: 400),
                                        opacity: _isSelected[i] ? 1 : 0,
                                        child: Container(
                                          height: 5.0,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          width: screenSize.width / 10,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
