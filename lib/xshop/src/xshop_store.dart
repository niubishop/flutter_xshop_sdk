import 'package:flutter_xshop_sdk/mixins/xshop_error.dart';
import 'package:flutter_xshop_sdk/xshop/src/xshop_store_api.dart';
import 'package:flutter_xshop_sdk/xshop_config.dart';
import 'package:graphql/client.dart';
import 'package:flutter_xshop_sdk/graphql/queries/get_products_after_cursor.dart';
import 'package:flutter_xshop_sdk/models/src/product.dart';

class XShopStore with XShopError implements XShopStoreApi {
  XShopStore._();

  static final XShopStoreApi instance = XShopStore._();

  GraphQLClient _graphQLClient = XShopConfig.graphQLClient;

  @override
  Future<List<Product>> getProductsAfterCursor(int limit, String cursor, {
    bool deleteThisPartOfCache = false,
    bool reverse = false
  }) async {
    List<Product> productList = [];
    Products tempProduct;

    WatchQueryOptions _options = WatchQueryOptions(
      documentNode: gql(getProductsAfterCursorQuery),
      variables: {
        'cursor': cursor,
        'reverse': reverse,
      }
    );

    final QueryResult result = await _graphQLClient.query(_options);
    checkForError(result);
    tempProduct = Products.fromJson((result?.data ?? const {})['products'] ?? {});
    productList += tempProduct?.productList ?? const [];
    if(deleteThisPartOfCache) {
      _graphQLClient.cache.write(_options.toKey(), null);
    }
    return productList;
  }
}
