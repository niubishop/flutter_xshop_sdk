
import 'package:flutter_xshop_sdk/flutter_xshop_sdk.dart';

abstract class XShopStoreApi {
  Future<List<Product>> getProductsAfterCursor(int limit, String cursor, {
    bool deleteThisPartOfCache = false,
    bool reverse = false
  });
}