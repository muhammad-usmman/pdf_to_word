import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:pdf_to_word/model/premium_manager/premium_manager.dart';
import 'package:pdf_to_word/view/screens/home_scree/widgets/convert_from_pdf.dart';
import 'package:pdf_to_word/view/screens/home_scree/widgets/convert_to_pdf.dart';
import 'package:pdf_to_word/view/screens/home_scree/widgets/home.dart';
import 'package:pdf_to_word/view/screens/home_scree/widgets/pdf_tools.dart';
import 'package:pdf_to_word/view/screens/splash_screen.dart';
import 'package:pdf_to_word/view/shared/custom_app_bar.dart';
import 'package:pdf_to_word/view/shared/drawer_item.dart';

class HomeScreenRoot extends StatefulWidget {
  const HomeScreenRoot({super.key});

  @override
  State<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  final PageController pageController = PageController();
  int _currentPageIndex = 0;
  bool autoOpenClose = true;
  bool _isDrawerOpen = true;
  static const double smallScreenThreshold = 1400;
  final InAppPurchase inAppPurchase = InAppPurchase.instance;
  late PremiumManager premiumManager;
  late ProductDetails product;
  late StreamSubscription<List<PurchaseDetails>> _purchaseSubscription;

  @override
  void initState() {
    if (Platform.isIOS || Platform.isMacOS) {
      premiumManager = PremiumManager(inAppPurchase: inAppPurchase);
      final Stream<List<PurchaseDetails>> purchaseUpdated = inAppPurchase.purchaseStream;
      _purchaseSubscription = purchaseUpdated.listen(
        (List<PurchaseDetails> purchaseDetailsList) {
          premiumManager.listenToPurchaseUpdated(purchaseDetailsList, () {}, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => const SplashScreen()));
          });
        },
        onDone: () {
          _purchaseSubscription.cancel();
        },
      );
    }
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
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < smallScreenThreshold;

        if (isSmallScreen && _isDrawerOpen && autoOpenClose) {
          _isDrawerOpen = false;
        }
        if (!isSmallScreen) {
          _isDrawerOpen = true;
          autoOpenClose = true;
        }

        return Scaffold(
          appBar: CustomAppBar(
            leading: isSmallScreen
                ? IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      setState(() {
                        _isDrawerOpen = !_isDrawerOpen;
                        autoOpenClose = false;
                      });
                    },
                  )
                : SizedBox.shrink(),
          ),
          body: Row(
            children: [
              // Drawer Panel
              if (!isSmallScreen || _isDrawerOpen)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _isDrawerOpen
                      ? isSmallScreen
                          ? 0.35.sw
                          : 0.19.sw
                      : 0,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            DrawerItem(
                              svg: 'assets/svg/home icon.svg',
                              label: 'Home',
                              onTap: () {
                                pageController.jumpToPage(0);
                                log(_currentPageIndex.toString());
                                if (isSmallScreen) {
                                  setState(() => _isDrawerOpen = false);
                                }
                              },
                              selected: _currentPageIndex == 0,
                            ),
                            DrawerItem(
                              selected: _currentPageIndex == 1,
                              svg: 'assets/svg/convert to pdf.svg',
                              label: 'Convert To PDF',
                              onTap: () {
                                pageController.jumpToPage(1);
                                log(_currentPageIndex.toString());
                                if (isSmallScreen) {
                                  setState(() => _isDrawerOpen = false);
                                }
                              },
                            ),
                            DrawerItem(
                              selected: _currentPageIndex == 2,
                              svg: 'assets/svg/convert from pdf.svg',
                              label: 'Convert From PDF',
                              onTap: () {
                                pageController.jumpToPage(2);

                                log(_currentPageIndex.toString());
                                if (isSmallScreen) {
                                  setState(() => _isDrawerOpen = false);
                                }
                              },
                            ),
                            // DrawerItem(
                            //   selected: _currentPageIndex == 3,
                            //   svg: 'assets/svg/PDF editor.svg',
                            //   label: 'PDF Editor',
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (BuildContext context) => const PDFEditor(),
                            //       ),
                            //     );
                            //     log(_currentPageIndex.toString());
                            //     if (isSmallScreen) {
                            //       setState(() => _isDrawerOpen = false);
                            //     }
                            //   },
                            // ),
                            DrawerItem(
                              selected: _currentPageIndex == 4,
                              svg: 'assets/svg/PDF tools.svg',
                              label: 'PDF Tools',
                              onTap: () {
                                pageController.jumpToPage(4);
                                log(_currentPageIndex.toString());
                                if (isSmallScreen) {
                                  setState(() => _isDrawerOpen = false);
                                }
                              },
                            ),
                            DrawerItem(
                              selected: _currentPageIndex == 5,
                              svg: 'assets/svg/rate us.svg',
                              label: 'Rate Us',
                              onTap: () {
                                setState(() {
                                  _currentPageIndex = 5;
                                });
                              },
                            ),
                            DrawerItem(
                              selected: _currentPageIndex == 6,
                              svg: 'assets/svg/Support.svg',
                              label: 'Support',
                              onTap: () {
                                setState(() {
                                  _currentPageIndex = 6;
                                });
                              },
                            ),
                            DrawerItem(
                              selected: _currentPageIndex == 7,
                              svg: 'assets/svg/restore_purchase.svg',
                              label: 'Restore Purchase',
                              onTap: () {
                                setState(() {
                                  _currentPageIndex = 7;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 60.sp,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardTheme.color?.withOpacity(0.9) ??
                                  Theme.of(context).cardTheme.color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Upgrade to Pro",
                                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset(
                                  'assets/svg/pro icon.svg',
                                  fit: BoxFit.scaleDown,
                                  width: 30.sp,
                                  height: 30.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              // Main Content Area
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (newPage) {
                    _currentPageIndex = newPage;
                    setState(() {});
                  },
                  scrollDirection: Axis.vertical,
                  controller: pageController,
                  children: const [
                    Home(),
                    ConvertToPdf(),
                    ConvertFromPdf(),
                    SizedBox.shrink(),
                    PDFTools(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
