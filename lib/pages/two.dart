import 'package:flutter/material.dart';

import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:my_website/settings/constants.dart';

import 'package:my_website/widgets/drawer.dart';
import 'package:my_website/widgets/bottom_bar.dart';
import 'package:my_website/widgets/responsive.dart';
import 'package:my_website/widgets/image_hero.dart';
import 'package:my_website/widgets/web_scrollbar.dart';
import 'package:my_website/widgets/top_bar_contents.dart';
import 'package:my_website/widgets/floating_quick_access_bar.dart';

class PageTwo extends StatefulWidget {
  final String route = kPageTwoRoute;

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              toolbarHeight: screenSize.width / 8,
              leadingWidth: 80.0,
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.brightness_6),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        DynamicTheme.of(context).setBrightness(
                            Theme.of(context).brightness == Brightness.dark
                                ? Brightness.light
                                : Brightness.dark);
                        print(Theme.of(context).brightness);
                      },
                    ),
                    SizedBox(
                      width: 20.0,
                    )
                  ],
                ),
              ],
              title: Text(
                kWebsiteName,
                style: TextStyle(
//                  color: Colors.blueGrey[100],
                  color: Colors.white,
                  fontSize: screenSize.width / 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: SideDrawer(),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: SizedBox(
                      height: ResponsiveWidget.isSmallScreen(context)
                          ? screenSize.height * 0.20
                          : screenSize.height * 0.40,
                      width: screenSize.width,
                      child: Image.asset(
                        kHeaderImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      FloatingQuickAccessBar(screenSize: screenSize,  namedRoute: widget.route,),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width / 20,
                  vertical: 10.0,
                ),
                // TODO: Content of Page Two inside Column([...])
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Page Two',
                      style: TextStyle(
                        fontSize: 40.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      // padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(3, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: ImageHero(image: kPage2Image, tag: kPage2Image),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(
                        kTextExample,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 15 + screenSize.width / 200,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200.0,
                    )
                  ],
                ),
              ),
              SizedBox(height: screenSize.height / 10),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
