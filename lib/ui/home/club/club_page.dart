import 'package:flutter/material.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/club_page_provider.dart';

class ClubPage extends ProviderWidget<ClubPageProvider> {
  ClubPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _ClubPageContent(mProvider);
  }
}

class _ClubPageContent extends StatefulWidget {
  final ClubPageProvider provider;

  _ClubPageContent(this.provider);

  @override
  _ClubPageContentState createState() => _ClubPageContentState();
}

class _ClubPageContentState extends State<_ClubPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("社区"),
      ),
    );
  }
}
