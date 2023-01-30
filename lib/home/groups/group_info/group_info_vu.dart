import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/utils/constants.dart';
import 'package:wefit/utils/we_router.dart';
import '../group_info/group_info_vm.dart';
import '/utils/widgets.dart';

class GroupInfoScreen extends ViewModelBuilderWidget<GroupInfoVM> {
  final String title;
  final String image;
  final List groupMembers;
  const GroupInfoScreen({
    super.key,
    required this.title,
    required this.image,
    required this.groupMembers,
  });

  @override
  Widget builder(BuildContext context, GroupInfoVM viewModel, Widget? child) {
    return WeScaffold(
      padding: 0,
      scrollable: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          groupProfile(context, image, viewModel),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Group Members', style: TextStyle(fontSize: 16)),
            ),
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListView.builder(
                itemCount: groupMembers.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(groupMembers[index]['name']),
                  subtitle: Text(groupMembers[index]['email']),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  GroupInfoVM viewModelBuilder(BuildContext context) {
    return GroupInfoVM();
  }
}

Widget groupProfile(BuildContext context, String image, GroupInfoVM viewModel) {
  return Padding(
    padding: const EdgeInsets.all(24),
    child: CircleAvatar(
      radius: 75,
      backgroundColor: primaryColor,
      child: viewModel.isBusy
          ? Center(child: CircularProgressIndicator(color: whiteColor))
          : viewModel.img == null
              ? CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(image),
                  child: Center(
                      child: CircleAvatar(
                    backgroundColor: primaryColor.withOpacity(0.3),
                    radius: 25,
                    child: IconButton(
                      onPressed: () => imagePickerOptionsSheet(context, viewModel),
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )),
                )
              : CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(viewModel.img!),
                  child: Center(
                      child: CircleAvatar(
                    backgroundColor: primaryColor.withOpacity(0.3),
                    radius: 25,
                    child: IconButton(
                      onPressed: () => imagePickerOptionsSheet(context, viewModel),
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )),
                ),
    ),
  );
}

Future<dynamic> imagePickerOptionsSheet(BuildContext context, GroupInfoVM viewModel) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    label: Text(
                      'Camera',
                      style: TextStyle(color: blackColor),
                    ),
                    onPressed: () {
                      viewModel.onGetImage(ImageSource.camera);
                      WeRouter.pop(context);
                    },
                    icon: const Icon(Icons.photo_camera)),
                TextButton.icon(
                    label: Text(
                      'Gallery',
                      style: TextStyle(color: blackColor),
                    ),
                    onPressed: () {
                      viewModel.onGetImage(ImageSource.gallery);
                      WeRouter.pop(context);
                    },
                    icon: const Icon(Icons.photo_rounded)),
              ],
            ),
          ));
}
