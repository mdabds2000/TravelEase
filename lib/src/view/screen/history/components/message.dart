import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_ease/core/app_asset.dart';
import 'package:travel_ease/core/app_color.dart';
import 'package:travel_ease/core/app_style.dart';
import 'package:travel_ease/extension/extension_sizebox.dart';
import 'package:travel_ease/src/controller/chat_controller.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({
    super.key,
    required this.chatController,
  });

  final ChatController chatController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 10.sp),
          itemCount: chatController.messages.length,
          itemBuilder: (context, index) {
            var chatMessage = chatController.messages[index];
            return Align(
              alignment: chatMessage.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                constraints: BoxConstraints(maxWidth: 70.w),
                margin: EdgeInsets.symmetric(vertical: 5.sp),
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  color: chatMessage.isSentByMe
                      ? AppColor.primaryColor.withOpacity(0.85)
                      : Colors.white,
                  borderRadius: chatMessage.isSentByMe
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        )
                      : const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        chatMessage.message,
                        style: h3Style.copyWith(
                          color: chatMessage.isSentByMe
                              ? Colors.white
                              : Colors.black,
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(height: .5.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '15:22',
                          style:
                              h4Style.copyWith(color: const Color(0xffC1C7D0)),
                        ),
                        1.hSpace,
                        SvgPicture.asset(AppAsset.tick),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => 1.vSpace,
        );
      }),
    );
  }
}
