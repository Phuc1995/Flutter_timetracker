import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';

abstract class PlatformWidget extends StatelessWidget {

  Widget buildCupertinoWidget(BuildContext context);
  Widget buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS){
      return buildCupertinoWidget(context);
    }
    return buildMaterialWidget(context);
  }
}