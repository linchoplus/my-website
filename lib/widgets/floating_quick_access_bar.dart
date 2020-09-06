import 'dart:html';
import 'package:flutter/material.dart';

import 'package:my_website/widgets/responsive.dart';

import 'package:my_website/settings/constants.dart';
import 'package:my_website/settings/list_floating_bar.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key key,
    @required this.screenSize,
    @required this.namedRoute,
  }) : super(key: key);

  final Size screenSize;
  final String namedRoute;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  List<String> nameOfRoute = lNameOfRoute;
  List _isHovering = lIsHovering;
  List<String> items = lItems;
  List<Widget> rowElements = [];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {
          Navigator.of(context).pushNamed(nameOfRoute[i]);
        },
        child: Column(
          children: [
            Text(
              items[i],
              style: TextStyle(
                fontSize: 20.0,
                color: _isHovering[i]
                    ? Theme.of(context).primaryTextTheme.button.decorationColor
                    : Theme.of(context).primaryTextTheme.button.color,
              ),
            ),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: nameOfRoute[i] == widget.namedRoute ? true : false,
              child: Column(
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 400),
                    opacity: nameOfRoute[i] == widget.namedRoute ? 1 : 0,
                    child: Container(
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: widget.screenSize.width / 50,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }
    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.height * 0.15
              : widget.screenSize.height * 0.35,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 21
              : widget.screenSize.width / 21,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 21
              : widget.screenSize.width / 21,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...Iterable<int>.generate(items.length).map(
                    (int pageIndex) => Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenSize.height / 80),
                      child: Card(
                        color: Theme.of(context).cardColor,
                        elevation: 5.0,
                        child: Padding(
                            padding: EdgeInsets.only(
                              top: widget.screenSize.height / 100,
                              bottom: widget.screenSize.height / 100,
                              left: widget.screenSize.width / 20,
                            ),
                            child: Row(
                              children: [
                                Visibility(
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: nameOfRoute[pageIndex] ==
                                          widget.namedRoute
                                      ? true
                                      : false,
                                  child: Column(
                                    children: [
                                      AnimatedOpacity(
                                        duration: Duration(milliseconds: 400),
                                        opacity: nameOfRoute[pageIndex] ==
                                                widget.namedRoute
                                            ? 1
                                            : 0,
                                        child: Image.asset(
                                          kWebsiteLogo,
                                          width: 20.0,
                                          height: 20.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: widget.screenSize.width / 20),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  onHover: (value) {
                                    setState(() {
                                      value
                                          ? _isHovering[pageIndex] = true
                                          : _isHovering[pageIndex] = false;
                                    });
                                  },
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(nameOfRoute[pageIndex]);
                                  },
                                  child: Text(
                                    items[pageIndex],
                                    style: TextStyle(
                                        color: _isHovering[pageIndex]
                                            ? Theme.of(context)
                                                .primaryTextTheme
                                                .button
                                                .decorationColor
                                            : Theme.of(context)
                                                .primaryTextTheme
                                                .button
                                                .color,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              )
            : Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widget.screenSize.height / 50,
                    bottom: widget.screenSize.height / 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateRowElements(),
                  ),
                ),
              ),
      ),
    );
  }
}
