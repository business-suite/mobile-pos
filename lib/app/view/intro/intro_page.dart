
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:business_suite_mobile_pos/app/view/intro/intro_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../generated/locale_keys.g.dart';
import '../../module/res/colors.dart';
import '../../module/res/dimens.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../widget_utils//boarding/message_item.dart';
import '../widget_utils/boarding/on_boarding_animation_widget.dart';
import '../widget_utils/buttons/outline_button.dart';
import '../widget_utils/anims/animated_in_widget.dart';
import '../widget_utils/buttons/filled_button.dart';

class IntroPage extends PageProvideNode<IntroViewModel> {
  IntroPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _IntroContentPage(viewModel);
  }
}

class _IntroContentPage extends StatefulWidget {
  final IntroViewModel _introViewModel;

  _IntroContentPage(this._introViewModel);

  @override
  State<_IntroContentPage> createState() => _IntroContentState();
}

class _IntroContentState extends State<_IntroContentPage> {
  IntroViewModel get introViewModel => widget._introViewModel;

  List<String> get _onBoardingTitles => [
    LocaleKeys.on_boarding_title_1.tr(),
    LocaleKeys.on_boarding_title_2.tr(),
    LocaleKeys.on_boarding_title_3.tr(),
  ];

  List<String> get _onBoardingDescriptions => [
    LocaleKeys.on_boarding_desc_1.tr(),
    LocaleKeys.on_boarding_desc_2.tr(),
    LocaleKeys.on_boarding_desc_3.tr(),
  ];

  List<String> get _onBoardingUrl => [
    'assets/images/homepage_desktop.png',
    'assets/images/screens_mockup.png',
    'assets/images/market_position_update.png',
  ];

  final PageController _pageController = PageController();

  Widget _onBoardingAnimationWithMessage() {
    return AspectRatio(
      aspectRatio: 3.7 / 5,
      child: PageView.builder(
          controller: _pageController,
          itemCount: _onBoardingTitles.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                OnBoardingAnimationWidget(
                    initialStep: index,
                    url: _onBoardingUrl[index]
                ),
                MessageItem(
                  onBoardingTitle: _onBoardingTitles[index],
                  onBoardingDescription: _onBoardingDescriptions[index],
                ),
              ],
            );
          }),
    );
  }

  Widget _onBoardingButtonGroup() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size_24_w,
        vertical: size_24_h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBtnGetStarted(),
          Divider(
            height: size_12_h,
            color: Colors.transparent,
          ),
          _buildBtnHaveAccount(),
          // AnimatedInWidget(
          //   order: 5,
          //   child: _onBoardingSocialButtonGroup(),
          // ),
        ],
      ),
    );
  }

  Widget _pageIndicator() {
    return AnimatedInWidget(
      order: 3,
      child: SmoothPageIndicator(
        controller: _pageController, // PageController
        count: _onBoardingTitles.length,
        effect: WormEffect(
          dotWidth: 8,
          dotHeight: 8,
          spacing: size_10_w,
          dotColor: kColor332F858A,
          activeDotColor: kColor2F858A,
        ),
      ),
    );
  }

  Widget _page2() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _onBoardingAnimationWithMessage(),
          SizedBox(
            height: size_10_h,
          ),
          _pageIndicator(),
          _onBoardingButtonGroup(),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: _page2(),
    );
  }

  Consumer<IntroViewModel> _buildBtnGetStarted() {
    return Consumer<IntroViewModel>(
      builder: (context, value, child) {
        return FilledButton(
          color: kColor2F858A,
          text: LocaleKeys.on_boarding_btn_get_started.tr(),
          onPress: () {
            value.gotoSignIn();
          },
        );
      },
    );
  }

  Consumer<IntroViewModel> _buildBtnHaveAccount() {
    return Consumer<IntroViewModel>(
      builder: (context, value, child) {
        return AnimatedInWidget(
          order: 4,
          child: OutlineButton(
            text: LocaleKeys.on_boarding_btn_already_have_an_account.tr(),
            onPress: () {
              value.gotoSignUp();
            },
            color: kCBlack38,
            reversed: true,
          ),
        );
      },
    );
  }

}
