import 'dart:async';

import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

abstract class ProviderWidget<T extends ChangeNotifier>
    extends StatelessWidget {
  final T mProvider;

  ProviderWidget({List<dynamic> params})
      : mProvider = inject<T>(params: params);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: mProvider,
      child: Consumer<T>(
        builder: (context, provider, _) => buildContent(context),
      ),
    );
  }

  Widget buildContent(BuildContext context);
}

abstract class ProviderWidget2<A extends ChangeNotifier,
    B extends ChangeNotifier> extends StatelessWidget {
  final A mProviderA;
  final B mProviderB;

  ProviderWidget2({List<dynamic> params})
      : mProviderA = inject<A>(params: params),
        mProviderB = inject<B>(params: params);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<A>.value(value: mProviderA),
        ChangeNotifierProvider<B>.value(value: mProviderB),
      ],
      child: Consumer2<A, B>(
        builder: (context, pa, pb, _) => buildContent(context),
      ),
    );
  }

  Widget buildContent(BuildContext context);
}

class BaseProvider with ChangeNotifier {
  CompositeSubscription compositeSubscription = CompositeSubscription();

  addSubscription(StreamSubscription streamSubscription) {
    compositeSubscription.add(streamSubscription);
  }

  @override
  void dispose() {
    if (!compositeSubscription.isDisposed) {
      compositeSubscription.dispose();
    }
    super.dispose();
  }
}
