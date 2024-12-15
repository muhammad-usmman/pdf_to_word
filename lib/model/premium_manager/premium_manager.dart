import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PremiumManager {
  final InAppPurchase inAppPurchase;

  PremiumManager({required this.inAppPurchase});

  Stream<List<PurchaseDetails>> get purchaseStream =>
      inAppPurchase.purchaseStream;

  Future<List<ProductDetails>> getAvailableProducts(Set<String> ids) async {
    try {
      bool available = await inAppPurchase.isAvailable();
      if (!available) throw Exception("IAP not available");

      final response = await inAppPurchase.queryProductDetails(ids);
      if (response.notFoundIDs.isNotEmpty) {
        // Handle missing products
      }
      return response.productDetails;
    } catch (e) {
      // Handle error
      return [];
    }
  }

  void buyProduct(ProductDetails product) {
    final purchaseParam = PurchaseParam(productDetails: product);
    inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> restorePurchases() async {
    if (await inAppPurchase.isAvailable()) {
      await inAppPurchase.restorePurchases();
    }
  }

  Future<bool> isPremiumUser() async {
    // Placeholder for receipt validation logic
    return true;
  }

  void listenToPurchaseUpdates() {
    purchaseStream.listen((purchases) {
      for (var purchase in purchases) {
        if (purchase.status == PurchaseStatus.purchased) {
          _verifyPurchase(purchase);
        } else if (purchase.status == PurchaseStatus.pending) {
          // Handle pending state (e.g., show a loading indicator)
        } else if (purchase.status == PurchaseStatus.error) {
          // Handle error
        }
      }
    });
  }

  bool _verifyPurchase(PurchaseDetails purchase){
    if(purchase.productID=="7_days"){
      purchase.

    }
    return true;
  }
}
