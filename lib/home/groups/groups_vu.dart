import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/utils/we_router.dart';
import '../../utils/loading_spinner.dart';
import '../contacts/contacts_vu.dart';
import '/home/groups/groups_vm.dart';
import '/utils/widgets.dart';

import '../../utils/constants.dart';
import 'group_chat/group_chat_vu.dart';
import 'group_info/group_info_vu.dart';

class GroupsScreen extends ViewModelBuilderWidget<GroupsVM> {
  const GroupsScreen({Key? key}) : super(key: key);
  // final HomeVUModel viewModel;
  @override
  Widget builder(BuildContext context, GroupsVM viewModel, Widget? child) {
    return LoadingSpinner(
      loading: viewModel.isBusy,
      showBGColor: false,
      child: WeScaffold(
        scrollable: false,
        body: !viewModel.isBusy && viewModel.groups.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/home.png', height: 280, width: 280),
                  WeButton(
                    lable: 'Create Group',
                    width: MediaQuery.of(context).size.width / 2.5,
                    onTap: () => weBottomSheet(context, viewModel),
                  )
                ],
              )
            : Column(
                children: [
                  WeTextField(
                    lable: 'Search',
                    searchable: true,
                    controller: viewModel.sController,
                    onChanged: viewModel.onSearchGroup,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Groups',
                        style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => weBottomSheet(context, viewModel),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: primaryColor,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 8,
                            child: Icon(Icons.add, size: 16, color: primaryColor),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  // viewModel.filteredGroups.isEmpty
                  //     ? const Center(
                  //         child: Text('No Records Found',
                  //             style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 18)),
                  //       )
                  //     :
                  Expanded(
                    child: ListView.builder(
                        itemCount: viewModel.sController.text.trim().isEmpty
                            ? viewModel.groups.length
                            : viewModel.filteredGroups.length,
                        itemBuilder: (context, index) {
                          final group = viewModel.sController.text.trim().isEmpty
                              ? viewModel.groups[index]
                              : viewModel.filteredGroups[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    group.groupName!,
                                    style: titleTextStyle.copyWith(fontSize: 14),
                                  ),
                                  leading: GestureDetector(
                                    onTap: () => WeRouter.push(
                                      context,
                                      GroupInfoScreen(
                                          title: group.groupName!,
                                          image: group.groupIcon!,
                                          groupMembers: group.groupMembers!),
                                    ),
                                    child: CircleAvatar(
                                      radius: 24,
                                      backgroundColor: primaryColor,
                                      backgroundImage: const AssetImage('assets/groupIcon.jpg'),
                                    ),
                                  ),
                                  onTap: () => WeRouter.push(context, GroupChatScreen(group.groupName!)),
                                ),
                              ),
                              const Divider(thickness: 0.4, color: Colors.grey)
                            ],
                          );
                        }),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  GroupsVM viewModelBuilder(BuildContext context) {
    GroupsVM vm = GroupsVM();
    vm.getGroups();
    return vm;
  }
}

//CUSTOM WIDGETS

Future weBottomSheet(BuildContext context, GroupsVM viewModel) {
  viewModel.enabled = false;
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            weAppBar('Create New Group', leading: const SizedBox.shrink()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WeTextField(
                controller: viewModel.nController,
                lable: 'Group Name',
                prefixIcon: Icon(Icons.group_add, color: primaryColor),
                onSaved: viewModel.onGroupNameSaved,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(
                  child: WeButton(
                    lable: 'Add Members',
                    onTap: () => WeRouter.push(context, const ContactsScreen(comeToSelect: true))
                        .then(viewModel.onGetGroupMembers),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: WeButton(
                    lable: 'Create',
                    onTap: () => viewModel.onCreateGroup(context),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    ),
  );
}
