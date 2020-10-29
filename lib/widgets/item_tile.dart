
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnTap = void Function();

class UserIconBar extends StatelessWidget {
  static const String defIcon =
      "https:\/\/thirdwx.qlogo.cn\/mmopen\/vi_32\/r26EqnO7icYZFNb0HKicuylQldR8iaHXwiby2uJapN8VORUkRa0gcGnIQhvdM95MgopkQzJk950CtdaxS1icB2aVHXQ\/132";
  final String title;
  final String userIcon;
  final Widget trailing;

  final OnTap onTap;

  UserIconBar(
      {this.title = "", this.userIcon = defIcon, this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        width: double.infinity,
        height: 60.w,
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16.sp),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: CircleAvatar(
                backgroundImage: NetworkImage(userIcon),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}

class LinearTextBar extends StatefulWidget {
  final String title;
  final String subTitle;
  final Widget trailing;
  final Color subTitleColor;
  final OnTap onTap;

  LinearTextBar(
      {this.title = "",
      this.subTitle = "",
      this.onTap,
      this.trailing,
      this.subTitleColor});

  @override
  _LinearTextBarState createState() => _LinearTextBarState();
}

class _LinearTextBarState extends State<LinearTextBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        width: double.infinity,
        height: 60.w,
        child: Row(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 16.sp),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Text(
                widget.subTitle,
                style: TextStyle(color: widget.subTitleColor, fontSize: 14.sp),
              ),
            ),
            widget.trailing,
          ],
        ),
      ),
    );
  }
}

class EditorLinearBar extends StatefulWidget {
  final String title;
  final OnTap onTap;
  final TextField editor;
  final String commit;

  EditorLinearBar({this.title = "", this.onTap, this.editor, this.commit=""});

  @override
  _EditorLinearBarState createState() => _EditorLinearBarState();
}

class _EditorLinearBarState extends State<EditorLinearBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        width: double.infinity,
        height: 60.w,
        child: Row(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 16.sp),
            ),
            Container(
              width: 160.w,
              child: editor(),
            ),
            commitNeeded(),
          ],
        ),
      ),
    );
  }

  Widget editor() {
    return widget.editor ?? SizedBox();
  }

  Widget commitNeeded() {
    if (widget.commit.isNotEmpty)
      return FlatButton(
        child: Text(widget.commit),
        onPressed: widget.onTap,
      );
    else
     return SizedBox();
  }
}
