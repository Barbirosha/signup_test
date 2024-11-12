import 'package:clario_test/resources/colors.dart';
import 'package:clario_test/resources/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget? child;

  const BackgroundWidget({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _GradientWidget(),
        const _StarsWidget(),
        if (child != null) child!
      ],
    );
  }
}

class _GradientWidget extends StatelessWidget {
  const _GradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background1,
            AppColors.background2,
          ],
        ),
      ),
    );
  }
}

class _StarsWidget extends StatelessWidget {
  const _StarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          right: 55,
          child: SvgPicture.asset(
            AppIcons.star,
            height: 14,
            width: 14,
          ),
        ),
        Positioned(
          top: 137,
          right: 114,
          child: SvgPicture.asset(
            AppIcons.star,
            height: 14,
            width: 14,
          ),
        ),
        Positioned(
          top: 137,
          right: 114,
          child: SvgPicture.asset(
            AppIcons.star,
            height: 14,
            width: 14,
          ),
        ),
        Positioned(
          top: 162,
          left: 76,
          child: SvgPicture.asset(
            AppIcons.star,
            height: 21,
            width: 21,
          ),
        ),
        Positioned(
          top: 268,
          right: 68,
          child: SvgPicture.asset(
            AppIcons.star,
            height: 21,
            width: 21,
          ),
        ),
        Positioned(
          bottom: 235,
          left: 90,
          child: SvgPicture.asset(
            AppIcons.star,
            height: 27,
            width: 27,
          ),
        ),
        Positioned(
          bottom: 214,
          right: 94,
          child: SvgPicture.asset(
            AppIcons.star,
            height: 21,
            width: 21,
          ),
        ),
        Positioned(
          bottom: 36,
          left: 70,
          child: SvgPicture.asset(
            AppIcons.star,
            height: 14,
            width: 14,
          ),
        ),
      ],
    );
  }
}
