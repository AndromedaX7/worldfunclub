import 'dart:async';

import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';


class A extends StatefulWidget {
  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

abstract class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {

  @override
  ProviderState createState() => ProviderState<T>(this.params);

  final List<dynamic> params;

  ProviderWidget({this.params});


  Widget buildContent(BuildContext context,ChangeNotifier p);


}

class ProviderState<T extends ChangeNotifier> extends State<ProviderWidget> {

  final T mProvider;

  ProviderState(List<dynamic> params) :mProvider=inject<T>(params: params);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: mProvider,
      child: Consumer<T>(
        builder: (context, provider, _) =>
            widget.buildContent(context, provider),
      ),
    );
  }
}


abstract class ProviderWidgetWithState<T extends ChangeNotifier>
    extends StatefulWidget {
  final T mProvider;

  ProviderWidgetWithState({List<dynamic> params, Key key})
      : mProvider = inject<T>(params: params),
        super(key: key);

  @override
  _ProviderWidgetWithStateState createState() =>
      _ProviderWidgetWithStateState();

  Widget buildContent(BuildContext context);
}

class _ProviderWidgetWithStateState<T extends ChangeNotifier>
    extends State<ProviderWidgetWithState<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.mProvider,
      child: Consumer<T>(
        builder: (context, provider, _) => widget.buildContent(context),
      ),
    );
  }


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
