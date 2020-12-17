import 'package:image_pickers/image_pickers.dart';
import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
void showImagePicker(BuildContext context ,void Function (String) forResult){
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

                //
                var file = await ImagePickers.openCamera();
                if(file!=null)
                forResult(file.path);
              },
            ),
            CupertinoActionSheetAction(
              child: Text("从相册选择"),
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context).pop();
                var file = await  ImagePickers.pickerPaths(
                  selectCount: 1
                );
                if(file!=null&& file.length>0)
                forResult(file[0].path);
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