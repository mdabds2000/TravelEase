import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  Function()? filterPress;
  final bool isEnabled;
  AppBarWidget({
    super.key,
    required this.title,
    this.filterPress,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.bgColor,
      title: Text(
        title,
        style: h3Style.copyWith(letterSpacing: .5),
      ),
      actions: [
        isEnabled
            ? IconButton(
                onPressed: filterPress,
                icon: SvgPicture.asset(AppAsset.filterIcon))
            : const SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
