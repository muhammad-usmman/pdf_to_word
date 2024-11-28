import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      context
          .read<ThemeCubit>()
          .state
          .themeData == AppThemes.light
          ? const Color(0xffd47474)
          : const Color(0xff5a5a5a), // todo: add colors here
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 70),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: context.read<ThemeCubit>().state.themeData == AppThemes.light?const Color(0xffEEEEEE):const Color(0xff1a1a1a),
                  borderRadius: BorderRadius.circular(8)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    10.verticalSpace,
                    const Text(
                      "PDF TO WORD",
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
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
                    SizedBox(
                      width: 0.8.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              index = 0;
                              setState(() {});
                            },
                            child: SubscriptionTiles(
                              active: index == 0,
                              planName: 'Basic',
                              planDuration: 'Weekly',
                              planPrice: '870',
                              planDiscountedPrice: '2740',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              index = 1;
                              setState(() {});
                            },
                            child: SubscriptionTiles(
                              active: index == 1,
                              planName: 'Popular',
                              planDuration: 'Monthly',
                              planPrice: '870',
                              planDiscountedPrice: '2740',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              index = 2;
                              setState(() {});
                            },
                            child: SubscriptionTiles(
                              active: index == 2,
                              planName: '50% off',
                              planDuration: 'Yearly',
                              planPrice: '870',
                              planDiscountedPrice: '2740',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              index = 3;
                              setState(() {});
                            },
                            child: SubscriptionTiles(
                              active: index == 3,
                              planName: '60%off',
                              planDuration: 'Lifetime Plan',
                              planPrice: '870',
                              planDiscountedPrice: '2740',
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    CustomButton(title: 'Start your Free Trail', onTap: (){}, height: 75, width: 467),
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
                            context, MaterialPageRoute(builder: (
                            BuildContext context) =>   const HomeScreen()));
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
                    10.verticalSpace,
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
                    SizedBox(
                        width: 0.8.sw,
                        child: const Divider(
                          color: AppColors.grey,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        const Text(
                          "Terms of Use",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.grey),
                        ),
                        10.horizontalSpace,
                        const Text(
                          "Privace Policy",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.grey),
                        ),
                        10.horizontalSpace,
                        const Text(
                          "Restore Purchases",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.grey),
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
