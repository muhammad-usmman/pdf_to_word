import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:pdf_to_word/utils/prefrences/user_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExamplePaymentQueueDelegate extends SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true; // Allow all transactions
  }

  @override
  bool shouldShowPriceConsent() {
    return false; // No price consent sheet needed
  }
}

class PremiumManager {
  final InAppPurchase inAppPurchase;

  // StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;
  PremiumManager({required this.inAppPurchase}) {
    initialize();
  }

  Future<void> initialize() async {
    log("PremiumManager initialization started");
    if (Platform.isIOS || Platform.isMacOS) {
      final iosPlatformAddition =
          inAppPurchase.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      log("iOS Platform Addition fetched");
      try {
        await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
        log("Delegate set successfully");
      } catch (e) {
        log("Error setting delegate: $e");
      }
    }
    // _purchaseSubscription = inAppPurchase.purchaseStream.listen(_listenToPurchaseUpdated);
    log("Purchase subscription initialized");

    await updateTrialStatus();
    log("Trial status updated");
  }

  Stream<List<PurchaseDetails>> get purchaseStream => inAppPurchase.purchaseStream;

  Future<List<ProductDetails>> getAvailableProducts(Set<String> ids) async {
    try {
      if (!await inAppPurchase.isAvailable()) {
        throw Exception("IAP not available");
      }
      final response = await inAppPurchase.queryProductDetails(ids);
      if (response.notFoundIDs.isNotEmpty) {
        log("Products not found: ${response.notFoundIDs}");
      }
      return response.productDetails;
    } catch (e) {
      log("Error fetching products: $e");
      return [];
    }
  }

  void buyProduct(ProductDetails product) {
    final purchaseParam = PurchaseParam(productDetails: product);
    inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  void buyLifeTimeProduct(ProductDetails product) {
    final purchaseParam = PurchaseParam(productDetails: product);
    inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
  }

  Future<void> restorePurchases() async {
    if (await inAppPurchase.isAvailable()) {
      await inAppPurchase.restorePurchases();
    }
  }

  Future<void> listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList, Function() ifValid, Function() ifNotValid) async {
    for (final purchase in purchaseDetailsList) {
      try {
        if (purchase.status == PurchaseStatus.purchased ||
            purchase.status == PurchaseStatus.restored) {
          final valid = await _verifyPurchase(purchase);
          if (valid) {
            UserPrefs.savePremiumStatus(true);
            ifValid;
          } else {
            ifNotValid;
          }
        }
        if (purchase.status == PurchaseStatus.pending) {
          await initializeTrial();
        }

        if (purchase.pendingCompletePurchase) {
          await inAppPurchase.completePurchase(purchase);
        }
      } catch (e) {
        log("Error processing purchase: $e");
      }
    }
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchase) async {
    // Check if the transaction date is null (indicating a trial)
    if (purchase.transactionDate == null) {
      final trialActive = await isTrialActive(5);
      if (trialActive) {
        UserPrefs.savePremiumStatus(true);
        return true; // Trial is active, grant premium access
      } else {
        return false; // Trial expired
      }
    }

    // Existing purchase verification logic
    final duration = await _getProductDuration(purchase.productID);
    if (duration == 0) {
      return false;
    } else if (duration == 0 && purchase.productID == 'lifetime_plan') {
      return true;
    }

    final transactionDate = DateTime.fromMillisecondsSinceEpoch(
      int.parse(purchase.transactionDate!),
    );

    final expiryDate = transactionDate.add(Duration(days: duration));
    return DateTime.now().isBefore(expiryDate);
  }

  Future<int> _getProductDuration(String productId) async {
    const productDurations = {
      '7_days_plan': 7,
      '30_days_plan': 30,
      '365_days_plan': 365,
    };
    return productDurations[productId] ?? 0;
  }

  Future<void> initializeTrial() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('trial_start_date')) {
      prefs.setString('trial_start_date', DateTime.now().toIso8601String());
    }
  }

  Future<bool> isTrialActive(int trialDays) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('trial_start_date')) {
      return false; // No trial started
    }

    final startDate = DateTime.parse(prefs.getString('trial_start_date')!);
    final expiryDate = startDate.add(Duration(days: trialDays));
    return DateTime.now().isBefore(expiryDate);
  }

  Future<void> updateTrialStatus() async {
    final trialActive = await isTrialActive(5);
    if (trialActive) {
      UserPrefs.savePremiumStatus(true);
    } else {
      UserPrefs.savePremiumStatus(false);
    }
  }

  void dispose() {
    if (Platform.isIOS) {
      inAppPurchase.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>().setDelegate(null);
    }
  }
}
