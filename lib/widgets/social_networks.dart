import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'dart:html';

import 'package:my_website/settings/list_social_networks.dart';

final List<String> socialNames = lSocialNames;
final List<String> socialURLTittle = lSocialURLTittle;
final List<String> socialURLLogo = lSocialURLLogo;
final List<String> socialURL = lSocialURL;

class CreateDrawerNetworks extends StatelessWidget {
  final List<Widget> rowElements = [];

  List<Widget> generateColumnElements() {
    rowElements.clear();
    for (int i = 0; i < socialNames.length; i++) {
      Widget elementTile = InkWell(
        onTap: () {
          js.context.callMethod("open", [socialURL[i]]);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              socialNames[i],
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Text(
              socialURLTittle[i],
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      );
      Widget spacer = Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Divider(
          color: Colors.blueGrey[400],
          thickness: 2,
        ),
      );
      rowElements.add(elementTile);
      if (i < socialNames.length) {
        rowElements.add(spacer);
      }
    }
    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: generateColumnElements(),
    );
  }
}

class CreateTopNetworks extends StatefulWidget {
  const CreateTopNetworks({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
  @override
  _CreateTopNetworksState createState() => _CreateTopNetworksState();
}

class _CreateTopNetworksState extends State<CreateTopNetworks> {
  List<bool> _isHovering = lIsHovering;
  List<Widget> rowElements = [];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < socialNames.length; i++) {
      Widget elementTile = InkWell(
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {
          js.context.callMethod("open", [
            lSocialURL[i],
          ]);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Image.asset(
              lSocialURLLogo[i],
              width: 35.0,
            ),
            SizedBox(height: 5),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: _isHovering[i],
              child: Container(
                height: 2,
                width: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
      Widget spacer = SizedBox(width: widget.screenSize.width / 50);
      rowElements.add(elementTile);
      if (i < socialNames.length) {
        rowElements.add(spacer);
      }
    }
    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: generateRowElements(),
    );
  }
}

class CreateBottomNetworks extends StatelessWidget {
  CreateBottomNetworks({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
  final List<Widget> rowElements = [];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < socialNames.length; i++) {
      Widget elementTile = InkWell(
        onTap: () {
          js.context.callMethod("open", [
            socialURL[i],
          ]);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Image.asset(
              socialURLLogo[i],
              width: 35.0,
            ),
            SizedBox(height: 5),
          ],
        ),
      );
      Widget spacer = SizedBox(width: screenSize.width / 50);
      rowElements.add(elementTile);
      if (i < socialNames.length - 1) {
        rowElements.add(spacer);
      }
    }
    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: generateRowElements(),
    );
  }
}
