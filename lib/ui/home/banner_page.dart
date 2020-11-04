import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/vm/banner_page_provider.dart';

class BannerPage extends ProviderWidget<BannerPageProvider> {
  final num width;
  final num height;
  final String categoryId;
  final String rotationType;
  final bool self;

  BannerPage(this.width, this.height, this.categoryId, this.rotationType,
      {this.self})
      : super(params: [categoryId,rotationType]);

  @override
  Widget buildContent(BuildContext context) {
    return _BannerPageContent(mProvider, width, height, self);
  }
}

class _BannerPageContent extends StatefulWidget {
  final BannerPageProvider provider;
  final num width;
  final num height;
  final bool self;

  _BannerPageContent(this.provider, this.width, this.height, this.self);

  @override
  _BannerPageContentState createState() => _BannerPageContentState();
}

class _BannerPageContentState extends State<_BannerPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.banner();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Swiper(
        itemCount: widget.provider.data.length,
        itemBuilder: (b, i) => GestureDetector(
          child: Image.network(
            widget.provider.data[i].img_url,
            width: widget.width,
            height: widget.height,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
