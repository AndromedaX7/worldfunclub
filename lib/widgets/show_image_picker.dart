import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
void showImagePicker(BuildContext context ,void Function (File) forResult){
  showCupertinoModalPopup(
    context: context,
    builder: (b) =>
        CupertinoActionSheet(
          title: Text("更换头像"),
          message: Text("上传照片"),
          actions: [
            CupertinoActionSheetAction(
              child: Text("拍照上传"),
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context).pop();
                var file =
                await ImagePicker.pickImage(
                    source: ImageSource.camera);
                if(file!=null)
                forResult(file);
              },
            ),
            CupertinoActionSheetAction(
              child: Text("从相册选择"),
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context).pop();
                var file = await ImagePicker.pickImage(
                    source: ImageSource.gallery);
                if(file!=null)
                forResult(file);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            isDefaultAction: true,
            child: Text("取消"),
          ),
        ),
  );
}