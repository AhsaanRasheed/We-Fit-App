import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:linkwell/linkwell.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/utils/constants.dart';

import '../../../utils/widgets.dart';
import 'chat_model.dart';
import 'group_chat_vm.dart';

class GroupChatScreen extends ViewModelBuilderWidget<GroupChatViewModel> {
  final String title;
  const GroupChatScreen(this.title, {super.key});

  @override
  Widget builder(BuildContext context, GroupChatViewModel viewModel, Widget? child) {
    return WeScaffold(
      scrollable: false,
      appBar: weAppBar(title),
      body: Column(
        children: [
          // LIST OF MESSAGES
          messagesList(viewModel),
          Row(
            children: [
              // TEXT BOX TO COMPOSE MESSAGE
              messageComposer(viewModel),
              // SOME SPACING
              const SizedBox(width: 8),
              // BUTTON FOR MESSAGE SENDING
              sendButton(viewModel),
            ],
          ),
        ],
      ),
    );
  }

  @override
  GroupChatViewModel viewModelBuilder(BuildContext context) {
    return GroupChatViewModel();
  }
}

Widget messagesList(GroupChatViewModel viewModel) {
  return Expanded(
    child: GroupedListView<Chat, DateTime>(
      stickyHeaderBackgroundColor: Colors.transparent,
      reverse: true,
      useStickyGroupSeparators: true,
      order: GroupedListOrder.DESC,
      elements: viewModel.messages,
      groupBy: (message) => DateTime(message.dateTime!.day, message.dateTime!.month, message.dateTime!.year),
      groupHeaderBuilder: (message) => SizedBox(
        height: 40,
        child: Center(
          child: Card(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(DateFormat.yMMMd().format(message.dateTime!), style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
      itemBuilder: (context, message) => Align(
        alignment: message.isMe! ? Alignment.centerRight : Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: message.isMe! ? 74 : 0, right: message.isMe! ? 0 : 72, top: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: message.isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                    color: message.isMe! ? primaryColor : Colors.grey[800],
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: Radius.circular(message.isMe! ? 16 : 0),
                      bottomRight: Radius.circular(message.isMe! ? 0 : 16),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: LinkWell(
                    message.message!,
                    linkStyle: TextStyle(color: Colors.greenAccent[100]),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Text(
                DateFormat('h:mm a').format(message.dateTime!),
                style: const TextStyle(color: Colors.grey, fontSize: 10),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget sendButton(GroupChatViewModel viewModel) {
  return GestureDetector(
    onTap: viewModel.onSendMessage,
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.send,
        color: viewModel.msg.isEmpty ? Colors.grey[400] : whiteColor,
      ),
    ),
  );
}

Widget messageComposer(GroupChatViewModel viewModel) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(shape: const StadiumBorder(), color: Colors.grey[300]),
      child: TextField(
        controller: viewModel.controller,
        enableSuggestions: true,
        decoration: const InputDecoration(
          hintText: 'Send Message',
          border: InputBorder.none,
        ),
        onChanged: viewModel.onChanged,
      ),
    ),
  );
}
