class ApiPath {
  static String products() => 'products/';
  static String deliveryMethods() => 'deliveryMethods/';
  static String user(String uid) => 'users/$uid';
  static String shippingAddress(String uid) => 'users/$uid/shippingAddresses/';
  static String saveAddress(String uid,String addressId) => 'users/$uid/shippingAddresses/$addressId';
  static String addToCart(String uid , String addToCartId) => 'users/$uid/cart/$addToCartId';
  static String getCartProducts(String uid) => 'users/$uid/cart/';
}