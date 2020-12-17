import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/withdraw_record_list_page_provider.dart';
import 'package:worldfunclub/widgets/list_wrapper.dart';

class WithdrawRecordListPage
    extends ProviderWidget<WithdrawRecordListPageProvider> {
  WithdrawRecordListPage() : super();

  @override
  Widget buildContent(
      BuildContext context, WithdrawRecordListPageProvider provider) {
    return _WithdrawRecordListPageContent(provider);
  }
}

class _WithdrawRecordListPageContent extends StatefulWidget {
  final WithdrawRecordListPageProvider provider;

  _WithdrawRecordListPageContent(this.provider);

  @override
  _WithdrawRecordListPageContentState createState() =>
      _WithdrawRecordListPageContentState();
}

class _WithdrawRecordListPageContentState
    extends State<_WithdrawRecordListPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.loadList(clearData: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("提现记录"),
      ),
      body: ListWrapper(
        data: widget.provider.data,
        child: ListView.builder(
          itemCount: widget.provider.data.length,
          itemBuilder: (c, i) => Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 4.w),
            child: ListTile(
              title: Text("${widget.provider.data[i].desc} "),
              subtitle: Text("${widget.provider.data[i].setTime} "),
              trailing: Text("${widget.provider.data[i].money} "),
            ),
          ),
        ),
      ),
    );
  }
}
