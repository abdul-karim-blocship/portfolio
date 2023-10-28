import 'package:DeveloperFolio/configure/navigation_service.dart';
import 'package:DeveloperFolio/include/navbar/drawer/drawernav.dart' as dr;
import 'package:DeveloperFolio/include/navbar/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:DeveloperFolio/configure/routing.dart';

import '../include/navbar/navigationbar.dart' as nb;

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        endDrawer: dr.NavigationDrawer(),
        endDrawerEnableOpenDragGesture: false,
        body: Column(
          children: <Widget>[
            nb.NavigationBar(),
            Expanded(
              child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: HomeRoute,
              ),
            )
          ],
        ),
      ),
    );
  }
}
