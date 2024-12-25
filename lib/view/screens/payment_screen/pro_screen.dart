import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:pdf_to_word/controller/cubits/premium_cubit/premium_cubit.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/model/premium_manager/premium_manager.dart';
import 'package:pdf_to_word/utils/colors.dart';
import 'package:pdf_to_word/utils/themes.dart';
import 'package:pdf_to_word/view/screens/home_scree/home_screen_root.dart';
import 'package:pdf_to_word/view/screens/payment_screen/widgets/pro_features.dart';
import 'package:pdf_to_word/view/screens/payment_screen/widgets/subscription_tiles.dart';
import 'package:pdf_to_word/view/shared/custom_button.dart';

class ProScreen extends StatefulWidget {
  const ProScreen({super.key});

  @override
  State<ProScreen> createState() => _ProScreenState();
}

class _ProScreenState extends State<ProScreen> {
  int index = 1;
  final InAppPurchase inAppPurchase = InAppPurchase.instance;
  late PremiumManager premiumManager;
  late ProductDetails product;
  late StreamSubscription<List<PurchaseDetails>> _purchaseSubscription;

  @override
  void initState() {
    premiumManager = PremiumManager(inAppPurchase: inAppPurchase);

    if (Platform.isIOS || Platform.isMacOS) {
      premiumManager = PremiumManager(inAppPurchase: inAppPurchase);

      final Stream<List<PurchaseDetails>> purchaseUpdated = inAppPurchase.purchaseStream;

      _purchaseSubscription = purchaseUpdated.listen(
        (List<PurchaseDetails> purchaseDetailsList) {
          premiumManager.listenToPurchaseUpdated(purchaseDetailsList, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => const HomeScreenRoot()));
          }, () {});
        },
        // onDone: () {
        //   _purchaseSubscription.cancel();
        // },
      );
      context.read<PremiumCubit>().getProductDetails(premiumManager);
    }
    context.read<PremiumCubit>().getProductDetails(premiumManager);

    super.initState();
  }

  @override
  void dispose() {
    if (Platform.isIOS || Platform.isMacOS) {
      premiumManager.dispose();
      _purchaseSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.read<ThemeCubit>().state.themeData == AppThemes.light
          ? const Color(0xffd47474)
          : const Color(0xff5a5a5a),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 70),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: context.read<ThemeCubit>().state.themeData == AppThemes.light
                      ? const Color(0xffEEEEEE)
                      : const Color(0xff1a1a1a),
                  borderRadius: BorderRadius.circular(8)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    10.verticalSpace,
                    const Text(
                      "PDF TO WORD",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "CONVERTER",
                      style: TextStyle(
                        fontSize: 22,
                        wordSpacing: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    5.verticalSpace,
                    const Text(
                      "Get Access to All Premium Features",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    15.verticalSpace,
                    const ProFeatures(),
                    15.verticalSpace,
                    BlocConsumer<PremiumCubit, PremiumState>(
                      listener: (context, state) {
                        if (state is PremiumOptionsLoaded) {
                          product = state.productDetails[1];
                        }
                      },
                      builder: (context, state) {
                        if (state is PremiumOptionsLoaded) {
                          return SizedBox(
                            width: 0.8.sw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SubscriptionTiles(
                                  onTap: () {
                                    index = 0;
                                    product = state.productDetails[0];
                                    setState(() {});
                                  },
                                  active: index == 0,
                                  planName: state.productDetails[0].title,
                                  planDuration: 'Weekly',
                                  planDiscountedPrice: state.productDetails[0].price,
                                  planPrice: state.productDetails[0].currencySymbol +
                                      calculateOriginalPrice(state.productDetails[0].price, '0.286')
                                          .toString(),
                                  lineThroughText: true,
                                ),
                                SubscriptionTiles(
                                  onTap: () {
                                    index = 1;
                                    product = state.productDetails[1];
                                    setState(() {});
                                  },
                                  active: index == 1,
                                  planName: state.productDetails[1].title,
                                  planDuration: 'Monthly',
                                  planDiscountedPrice: state.productDetails[1].price,
                                  planPrice:
                                      '${state.productDetails[1].currencySymbol}${calculateWeeklyPrice(double.parse(state.productDetails[1].price), 4)} /week',
                                  lineThroughText: false,
                                ),
                                SubscriptionTiles(
                                  onTap: () {
                                    index = 2;
                                    product = state.productDetails[2];
                                    setState(() {});
                                  },
                                  active: index == 2,
                                  planName: state.productDetails[2].title,
                                  planDuration: 'Yearly Plan',
                                  planDiscountedPrice: state.productDetails[2].price,
                                  planPrice:
                                      '${state.productDetails[2].currencySymbol}${calculateWeeklyPrice(double.parse(state.productDetails[1].price), 52)} /week',
                                  lineThroughText: false,
                                ),
                                SubscriptionTiles(
                                  onTap: () {
                                    index = 3;
                                    product = state.productDetails[3];
                                    setState(() {});
                                  },
                                  active: index == 3,
                                  planName: state.productDetails[3].title,
                                  planDuration: 'Yearly Plan',
                                  planDiscountedPrice: state.productDetails[3].price,
                                  planPrice:
                                      '${state.productDetails[3].currencySymbol}${calculateOriginalPrice(state.productDetails[3].price, '0.50')}',
                                  lineThroughText: true,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SpinKitCircle(
                            color: AppColors.red,
                          );
                        }
                      },
                    ),
                    10.verticalSpace,
                    CustomButton(
                        title: 'Start your Free Trail',
                        onTap: () {
                          if (product.id == 'lifetime_plan') {
                            premiumManager.buyLifeTimeProduct(product);
                          } else {
                            premiumManager.buyProduct(product);
                          }
                        },
                        height: 75,
                        width: 467),
                    10.verticalSpace,
                    const Text(
                      "5 Days Free Trail, then 2000 \$ / Month",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                    10.verticalSpace,
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => const HomeScreenRoot()));
                      },
                      child: const Text(
                        'Continue with Free Plan',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.grey,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    15.verticalSpace,
                    SizedBox(
                      width: 0.8.sw,
                      child: const Text(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nisi velit, eleifend et dolor ut, egestas pellentesque odio. Sed non fermentum est, id placerat dolor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla aliquam eleifend ante at convallis. Aliquam commodo sodales sem. Cras id consequat orci. Nullam scelerisque diam ornare sagittis vulputate. Nam tincidunt, mauris ac lobortis egestas.''',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    15.verticalSpace,
                    SizedBox(
                        width: 0.8.sw,
                        child: const Divider(
                          color: AppColors.grey,
                        )),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        const Text(
                          "Terms of Use",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.grey),
                        ),
                        10.horizontalSpace,
                        const Text(
                          "Privace Policy",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.grey),
                        ),
                        10.horizontalSpace,
                        TextButton(
                          onPressed: () {
                            premiumManager.restorePurchases();
                          },
                          child: const Text(
                            "Restore Purchases",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.grey),
                          ),
                        ),
                        const Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => const HomeScreenRoot()));
                },
                child: const Icon(
                  Icons.close_sharp,
                  color: AppColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double calculateOriginalPrice(String discountedPrice, String discountPercentage) {
  // Convert String to double
  double discountedPriceValue = double.parse(discountedPrice);
  double discountPercentageValue = double.parse(discountPercentage);

  // Calculate the original price
  return (discountedPriceValue / (1 - discountPercentageValue)).floorToDouble();
}

double calculateWeeklyPrice(double totalPrice, int durationInWeeks) {
  return (totalPrice / durationInWeeks).floorToDouble();
}
