import 'package:graphql/client.dart';

class XShopConfig {
  /// Your own unique access key found on your XShop dashboard under apps -> manage private apps -> your-app-name .
  static String _storefrontAccessToken;

  /// Your store url.
  ///
  /// eg: "shopname.myxshop.com"
  static String _storeUrl;

  /// The version of the Storefront API.
  ///
  /// Default is set to 2020-04.
  static String _storefrontApiVersion = '2021-03';

  /// Sets the config.
  ///
  /// IMPORTANT: preferably call this inside the main function or at least before instantiating other xshop classes.
  static void setConfig(String storefrontAccessToken, String storeUrl, String storefrontApiVersion){
    _storefrontAccessToken ??= storefrontAccessToken;
    _storeUrl ??= storeUrl;
    _storefrontApiVersion = storefrontApiVersion != null ? storefrontApiVersion : _storefrontApiVersion;
  }

  /// The GraphQlClient used for communication with the Storefront API.
  static final GraphQLClient graphQLClient = GraphQLClient(
    link: HttpLink(
        headers: {'X-XShop-Storefront-Access-Token':'$_storefrontAccessToken'},
        uri: 'https://$_storeUrl/api/$_storefrontApiVersion/graphql.json'
    ),
    cache: NormalizedInMemoryCache(
      dataIdFromObject: typenameDataIdFromObject,
    ),
  );
}
