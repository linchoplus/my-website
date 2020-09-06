// ======== Layout page =========
// This page is just to reference
// TODO: Copy and paste this page with another name ('my_new_page.dart')

import 'package:flutter/material.dart';

import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:my_website/settings/constants.dart';

import 'package:my_website/widgets/drawer.dart';
import 'package:my_website/widgets/bottom_bar.dart';
import 'package:my_website/widgets/responsive.dart';
import 'package:my_website/widgets/web_scrollbar.dart';
import 'package:my_website/widgets/top_bar_contents.dart';
import 'package:my_website/widgets/floating_quick_access_bar.dart';

// TODO: Refactor/Rename LayoutPage with new name page ('MyNewPage')
class LayoutPage extends StatefulWidget {
  // TODO: Create new variable in settings/constants.dart (const String kMyNewPageRoute = '/new_page';)
  // TODO: Replace here kHomePageRoute with new constant 'kMyNewPageRoute'
  final String route = kLayoutPageRoute;

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
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
                      FloatingQuickAccessBar(
                        screenSize: screenSize,
                        namedRoute: widget.route,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width / 20,
                  vertical: 10.0,
                ),
                // TODO: Content of Page inside Column([...])
                child: Column(
                  children: [
                    SizedBox(
                      height: 1000.0,
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
