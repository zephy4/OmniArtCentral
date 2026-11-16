import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:onmi_art_central/controllers/messages_controller.dart';
import 'package:onmi_art_central/utill/constants/asset_manager.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';
import 'package:onmi_art_central/utill/constants/string_manager.dart';
import 'package:onmi_art_central/widgets/common/omni_appbar.dart';

class ChatScreen extends GetView<MessagesController> {
  final String? username;
  @override
  final MessagesController controller = Get.put(MessagesController());

  ChatScreen({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: const OmniAppbar(
        title: StringManager.messages,
        titleColor: ColorsManager.primaryColor,
      ),
      body: Column(
        children: [
          Obx(() {
            if (controller.preMessagesVisible.value) {
              return Column(
                children: controller.preDefinedMessages.map((message) {
                  return _buildMessageBubble(
                    message["message"]!,
                    message["sender"]!,
                  );
                }).toList(),
              );
            }
            return const SizedBox.shrink();
          }),
          Expanded(
            child: Obx(
              () => ListView.builder(
                reverse: true,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  var message = controller.messages[index];
                  return _buildMessageBubble(
                    message["message"]!,
                    message["sender"]!,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.w,
              right: 16.w,
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 50.h,
                    child: Row(
                      children: [
                        SizedBox(width: 8.w),
                        _getMessageChip(StringManager.good, textTheme),
                        SizedBox(width: 4.w),
                        _getMessageChip(
                            StringManager.whenWillYouReach, textTheme),
                        SizedBox(width: 4.w),
                        _getMessageChip(StringManager.omw, textTheme),
                        SizedBox(width: 4.w),
                        _getMessageChip(StringManager.onTime, textTheme),
                        SizedBox(width: 4.w),
                        _getMessageChip(StringManager.nice, textTheme),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: SizedBox(
                    height: 52.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.messageController,
                            decoration: InputDecoration(
                              hintText: StringManager.typeMessage,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: ColorsManager.searchBorderColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: ColorsManager.searchBorderColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: ColorsManager.searchBorderColor,
                                ),
                              ),
                              prefixIcon: GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.0.w, right: 8.0.w),
                                  child: SvgPicture.asset(
                                    AssetManager.linkIcon,
                                    width: 24.sp,
                                    height: 24.sp,
                                    colorFilter: const ColorFilter.mode(
                                      ColorsManager.lightTextColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              prefixIconConstraints: BoxConstraints(
                                minWidth: 24.sp,
                                minHeight: 24.sp,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () => controller.sendMessage(),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.0.w, right: 8.0.w),
                                  child: SvgPicture.asset(
                                    AssetManager.sendIcon,
                                    width: 24.sp,
                                    height: 24.sp,
                                    // colorFilter: const ColorFilter.mode(ColorsManager.black, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                minWidth: 24.sp,
                                minHeight: 24.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getMessageChip(String message, TextTheme textTheme) {
    return GestureDetector(
      onTap: () {
        controller.messageController.text = message;
      },
      child: Chip(
        shape: const StadiumBorder(),
        color: const WidgetStatePropertyAll(ColorsManager.white),
        label: Text(
          message,
          style: textTheme.bodySmall?.copyWith(
            color: ColorsManager.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String message, String sender) {
    bool isUser = sender == "user";
    final textTheme = Theme.of(Get.context!).textTheme;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: isUser
              ? ColorsManager.primaryColor
              : ColorsManager.messageTileBackground,
          borderRadius: isUser
              ? BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                )
              : BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                ),
        ),
        child: Text(
          message,
          style: isUser
              ? textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500)
              : textTheme.bodySmall?.copyWith(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
