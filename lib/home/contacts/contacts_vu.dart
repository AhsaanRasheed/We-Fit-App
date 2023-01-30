import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/home/contacts/contacts_vm.dart';

import '../../utils/constants.dart';
import '../../utils/loading_spinner.dart';
import '../../utils/we_router.dart';
import '../../utils/widgets.dart';

class ContactsScreen extends ViewModelBuilderWidget<ContactsVM> {
  final bool comeToSelect;
  const ContactsScreen({super.key, this.comeToSelect = false});

  @override
  Widget builder(BuildContext context, ContactsVM viewModel, Widget? child) {
    return WeScaffold(
      scrollable: false,
      padding: 0,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => WeRouter.pop(context),
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 12),
                const Expanded(child: WeTextField(lable: 'Search', searchable: true)),
              ],
            ),
          ),
          viewModel.selectedContacts.isNotEmpty ? selectionBanner(viewModel, context) : const SizedBox.shrink(),
          Expanded(
            child: LoadingSpinner(
              showBGColor: false,
              loading: viewModel.users.isEmpty,
              child: usersList(viewModel, comeToSelect),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ContactsVM viewModelBuilder(BuildContext context) {
    ContactsVM vm = ContactsVM();
    vm.getUsers();
    return vm;
  }
}

//CUSTOM WIDGETS
Widget createGroup(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'assets/home.png',
        height: 280,
        width: 280,
      ),
      WeButton(
        lable: 'Create Group',
        width: MediaQuery.of(context).size.width / 2.5,
      )
    ],
  );
}

Widget usersList(ContactsVM viewModel, bool comeToSelect) {
  return ListView.builder(
      itemCount: viewModel.users.length,
      itemBuilder: (context, index) {
        final user = viewModel.users[index];
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: ListTile(
                onTap: () => comeToSelect ? viewModel.onMultiSelection(index) : null,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  user.name!,
                  style: titleTextStyle.copyWith(fontSize: 14),
                ),
                trailing: Visibility(
                  visible: user.selected,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                    child: const Icon(Icons.check, color: Colors.white, size: 15),
                  ),
                ),
                leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: primaryColor,
                    backgroundImage: const AssetImage('assets/groupIcon.jpg')),
              ),
            ),
            const Divider(thickness: 0.4, color: Colors.grey)
          ],
        );
      });
}

Widget selectionBanner(ContactsVM viewModel, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Row(
      children: [
        Text("${viewModel.selectedContacts.length}", style: mediumTextStyle.copyWith(color: primaryColor)),
        const Spacer(),
        CircleAvatar(
          backgroundColor: primaryColor.withOpacity(0.1),
          child: GestureDetector(
            child: Icon(Icons.close, color: primaryColor),
            onTap: () => viewModel.onDeSelection(),
          ),
        ),
        const SizedBox(width: 12),
        CircleAvatar(
          backgroundColor: primaryColor.withOpacity(0.1),
          child: GestureDetector(
            child: Icon(Icons.check, color: primaryColor),
            onTap: () => WeRouter.pop(context, viewModel.selectedContacts),
          ),
        ),
      ],
    ),
  );
}
