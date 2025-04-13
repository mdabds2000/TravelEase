import 'package:flutter/material.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_const.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/view/screen/home/components/appbar.dart';
import 'package:travel_ease/src/view/screen/profile/components/tile_builder.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBarWidget(
        isEnabled: false,
        title: 'Help Center',
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            3.vSpace,
            TileBuilderWidget(
              onTap: () {},
              title: 'FAQ',
            ),
            2.vSpace,
            TileBuilderWidget(
              onTap: () {},
              title: 'Ask a question',
            ),
            2.vSpace,
            TileBuilderWidget(
              onTap: () {},
              title: 'Call customer service',
            ),
            2.vSpace,
            TileBuilderWidget(
              onTap: () {},
              title: 'Report a problem',
            ),
            2.vSpace,
          ],
        ),
      ),
    );
  }
}
