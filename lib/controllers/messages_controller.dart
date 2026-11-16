import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MessagesController extends GetxController {
  RxList<Map<String, String>> messages = <Map<String, String>>[].obs;
  RxBool preMessagesVisible = true.obs;
  final TextEditingController messageController = TextEditingController();

  RxString searchText = ''.obs;

  RxList<String> usernames = <String>[].obs;
  RxList<String> lastMessages = <String>[].obs;

  RxList<String> filteredUsernames = <String>[].obs;
  RxList<String> filteredLastMessages = <String>[].obs;



  @override
  void onInit() {
    super.onInit();
    // Initialize the username and last message lists
    usernames.addAll([
      "Alice Henry",
      "Justin Mounkes",
      "Theresa Webb",
      "Darell Steward",
      "Kristin Watson",
      "Arlene McCoy",
      "Leslie Alexander",
    ]);

    lastMessages.addAll([
              "Dominion without whose fifth..",
          "Second in green subdue",
          "His Evening hath",
          "Let life him. Second Winged",
          "Which gathered lesser the own..",
          "Lights male second have djhjh khakbjh m xckjshi quhiwsdkx m kiq uhifsdcm uiwhegskdx igwsk dv k",
          "Dominion without whose...."
    ]);

    // Initialize the filtered lists
    filteredUsernames.addAll(usernames);
    filteredLastMessages.addAll(lastMessages);

    // Listen to changes in the search text
    searchText.listen((query) {
      filterMessages(query);
    });
  }




  final List<Map<String, String>> preDefinedMessages = [
    {"message": "Hello, how are you?", "sender": "receiver"},
    {"message": "I'm good, thanks for asking!", "sender": "receiver"},
    {"message": "Are you available for a call later?", "sender": "receiver"},
  ];

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      messages.add({"message": messageController.text, "sender": "user"});
      messageController.clear();
      preMessagesVisible.value = false; // Hide pre-defined messages when user sends a message
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }


   void filterMessages(String query) {
    if (query.isEmpty) {
      filteredUsernames.value = usernames;
      filteredLastMessages.value = lastMessages;
    } else {
      filteredUsernames.value = usernames
          .where((username) => username.toLowerCase().contains(query.toLowerCase()))
          .toList();

      filteredLastMessages.value = [];
      for (var username in filteredUsernames) {
        int index = usernames.indexOf(username);
        if (index != -1) {
          filteredLastMessages.add(lastMessages[index]);
        }
      }
    }
  }
}
