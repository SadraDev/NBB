import 'package:flutter/material.dart';
import '../../const.dart';

class SellsManager extends StatelessWidget {
  const SellsManager({Key? key, this.onRefresh, required this.builder}) : super(key: key);
  final Future<void> Function()? onRefresh;
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: blackColor,
        strokeWidth: 2,
        onRefresh: onRefresh!,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Builder(
            builder: builder,
          ),
        ),
      ),
    );
  }
}

class SellsManagerViewArchive extends StatelessWidget {
  const SellsManagerViewArchive({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Archive',
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: onTap,
    );
  }
}

class SellsManagerLoading extends StatelessWidget {
  const SellsManagerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: const Center(child: CircularProgressIndicator(color: blackColor)),
    );
  }
}
