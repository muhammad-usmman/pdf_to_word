import 'package:bloc/bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:meta/meta.dart';
import 'package:pdf_to_word/model/premium_manager/premium_manager.dart';

part 'premium_state.dart';

class PremiumCubit extends Cubit<PremiumState> {
  PremiumCubit() : super(PremiumInitial());

  // Future<void> checkPremiumStatus() async {
  //   emit(PremiumLoading());
  //   try {
  //     final isPremium = await premiumManager.isPremiumUser();
  //     if (isPremium) {
  //       emit(PremiumActive());
  //     } else {
  //       emit(PremiumInactive());
  //     }
  //   } catch (e) {
  //     emit(PremiumError(e.toString()));
  //   }
  // }

  Future<void> initializeListener(PremiumManager premiumManager) async {
    await premiumManager.initialize();
  }

  Future<void> getProductDetails(PremiumManager premiumManager) async {
    emit(PremiumOptionsLoading());
    try {
      // var productDetails=await premiumManager.getAvailableProducts(productIds);
      // emit(PremiumOptionsLoaded(productDetails: productDetails));
      //Demo Data for testing
      emit(PremiumOptionsLoaded(productDetails: [
        ProductDetails(
            id: 'weekly',
            title: 'title',
            description: 'description',
            price: '1285',
            rawPrice: 1285,
            currencyCode: 'currencyCode'),
        ProductDetails(
            id: 'monthly',
            title: 'title',
            description: 'description',
            price: '1285',
            rawPrice: 1285,
            currencyCode: 'currencyCode'),
        ProductDetails(
            id: 'yearly',
            title: 'title',
            description: 'description',
            price: '1285',
            rawPrice: 1285,
            currencyCode: 'currencyCode'),
        ProductDetails(
            id: 'Lifetime',
            title: 'title',
            description: 'description',
            price: '1285',
            rawPrice: 1285,
            currencyCode: 'currencyCode'),
      ]));
    } catch (e) {
      emit(PremiumError(e.toString()));
    }
  }

// Future<void> purchaseProduct(ProductDetails product) async {
//   emit(PremiumLoading());
//   try {
//     premiumManager.buyProduct(product);
//     emit(PremiumActive());
//   } catch (e) {
//     emit(PremiumError(e.toString()));
//   }
// }
//
// Future<void> restorePurchases() async {
//   emit(PremiumLoading());
//   try {
//     await premiumManager.restorePurchases();
//     emit(PremiumActive());
//   } catch (e) {
//     emit(PremiumError(e.toString()));
//   }
// }
}
