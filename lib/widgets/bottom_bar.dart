import 'package:flutter/material.dart';

import 'package:my_website/settings/constants.dart';

import 'package:my_website/widgets/social_networks.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: screenSize.width / 20,
      ),
      color: Theme.of(context).bottomAppBarColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact:',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Text(
                      kContactEmail,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                CreateBottomNetworks(screenSize: screenSize),
              ],
            ),
            SizedBox(height: 25.0),
            Container(
              color: Colors.blueGrey,
              width: double.maxFinite,
              height: 1,
            ),
            SizedBox(height: 20.0),
            Text(
              kCopyright + kWebsiteName.toUpperCase(),
              style: TextStyle(
                color: Colors.blueGrey[300],
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: Colors.blueGrey,
              width: double.maxFinite,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
