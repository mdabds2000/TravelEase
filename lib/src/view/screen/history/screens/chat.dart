import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck_ease/core/app_asset.dart';
import 'package:truck_ease/core/app_color.dart';
import 'package:truck_ease/core/app_const.dart';
import 'package:truck_ease/core/app_style.dart';
import 'package:truck_ease/extension/extension_sizebox.dart';
import 'package:truck_ease/src/controller/chat_controller.dart';
import 'package:truck_ease/src/view/screen/history/components/message.dart';
import 'package:truck_ease/src/view/screen/history/screens/agent_profile.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor.withOpacity(.9),
      appBar: AppBar(
        toolbarHeight: 10.h,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: InkWell(
              onTap: () => Get.to(() => const AgentProfileScreen()),
              child: CircleAvatar(radius: 20.sp)),
          title:
              Text('Austin Arthur', style: h3Style.copyWith(fontSize: 15.5.sp)),
          subtitle: Text('Active 19m ago',
              style:
                  h3Style.copyWith(fontSize: 14.sp, color: AppColor.greyDark)),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, size: 20.sp),
          ),
        ],
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            MessagesWidget(chatController: chatController),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      chatController.update();
                    },
                    controller: chatController.messageController,
                    decoration: InputDecoration(
                      hintText: 'Message',
                      hintStyle:
                          h3Style.copyWith(fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.sp),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.grey[500],
                        ),
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(AppAsset.paperPin),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppAsset.camera),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.sp),
                GetBuilder<ChatController>(
                  init: ChatController(),
                  initState: (_) {},
                  builder: (_) {
                    return IconButton(
                        onPressed: chatController.sendMessage,
                        icon: CircleAvatar(
                          backgroundColor:
                              AppColor.primaryColor.withOpacity(.85),
                          child: SvgPicture.asset(
                            chatController.messageController.text.trim().isEmpty
                                ? AppAsset.mic
                                : AppAsset.send,
                          ),
                        ));
                  },
                ),
              ],
            ),
            2.vSpace,
          ],
        ),
      ),
    );
  }
}
