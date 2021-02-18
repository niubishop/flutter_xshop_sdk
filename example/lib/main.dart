import 'package:flutter/material.dart';
import 'package:flutter_xshop_sdk/flutter_xshop_sdk.dart';

void main() {
  XShopConfig.setConfig(
    "STOREFRONT-API-ACCESS-TOKEN",
    "YOUR-XSHOP-WEBSITE",
    "v1",
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    XShopStore.instance.getProductsAfterCursor(10, null);
    
    return MaterialApp(
      home: Stack(
        children: [
          Text('haha')
        ]
      )
    );
  }
}
