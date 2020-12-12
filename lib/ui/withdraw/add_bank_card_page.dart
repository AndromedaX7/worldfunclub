import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/add_bank_card_page_provider.dart';

class AddBankCardPage extends ProviderWidget<AddBankCardPageProvider> {
  AddBankCardPage() : super();

  @override
  Widget buildContent(BuildContext context, AddBankCardPageProvider provider) {
    return _AddBankCardPageContent(provider);
  }
}

class _AddBankCardPageContent extends StatefulWidget {
  final AddBankCardPageProvider provider;

  _AddBankCardPageContent(this.provider);

  @override
  _AddBankCardPageContentState createState() => _AddBankCardPageContentState();
}

class _AddBankCardPageContentState extends State<_AddBankCardPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("添加银行卡"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 8.w),
            sliver: SliverToBoxAdapter(
              child: ListTile(
                tileColor: Colors.white,
                leading: Text.rich(
                  TextSpan(
                    text: "*",
                    style: TextStyle(color: Colors.red),
                    children: [
                      TextSpan(
                        text: "持卡人",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                title: TextField(
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    hintText: "请绑定持卡人本人的银行卡",
                    border: InputBorder.none,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              tileColor: Colors.white,
              leading: Text.rich(
                TextSpan(
                  text: "*",
                  style: TextStyle(color: Colors.red),
                  children: [
                    TextSpan(
                      text: "卡号",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),
              title: TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  hintText: "请输入银行卡号",
                  border: InputBorder.none,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              tileColor: Colors.white,
              leading: Text.rich(
                TextSpan(
                  text: "*",
                  style: TextStyle(color: Colors.red),
                  children: [
                    TextSpan(
                      text: "手机号",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),
              title: TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  hintText: "请输入手机号",
                  border: InputBorder.none,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              tileColor: Colors.white,
              leading: Text.rich(
                TextSpan(
                  text: "*",
                  style: TextStyle(color: Colors.red),
                  children: [
                    TextSpan(
                      text: "银行",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),
              title: TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                    hintText: "填写银行卡所属银行", border: InputBorder.none),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              tileColor: Colors.white,
              leading: Text.rich(
                TextSpan(
                  text: "开户行",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              title: TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                    hintText: "请填写银行卡开户行(选填）", border: InputBorder.none),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 16.w, left: 16.w, bottom: 32.w),
            sliver: SliverToBoxAdapter(
                child: Text(
              "当前仅支持添加储蓄卡",
              style: TextStyle(color: Colors.black26),
            )),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverToBoxAdapter(
              child: InkWell(
                onTap: () {},
                child: Container(
                  child: Center(
                    child: Text(
                      "保存",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(24.w)),
                  height: 48.w,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
