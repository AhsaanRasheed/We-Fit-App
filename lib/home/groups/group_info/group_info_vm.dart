import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/services/we_store.dart';

class GroupInfoVM extends BaseViewModel {
  File? imgURL;
  String? img;
  onGetImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null) {
      setBusy(true);
      imgURL = File(image.path);
      img = await WeStore.uploadPhoto(image.name, imgURL!);
      setBusy(false);
    }
  }
}
