import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class CustomStickyHeader extends StatelessWidget {
  final bool _isShow;

  const CustomStickyHeader(this._isShow, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildCustomScrollView();
  }

  Widget buildCustomScrollView() {
    return SizedBox(
      height: 800,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.amber,
            ),
          ),
          // SliverStickyHeader(
          //   header: Container(
          //     height: 60.0,
          //     color: Colors.lightBlue,
          //     padding: EdgeInsets.symmetric(horizontal: 16.0),
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       'Header #0',
          //       style: const TextStyle(color: Colors.white),
          //     ),
          //   ),
          //   sliver: SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //           (context, i) => ListTile(
          //         leading: CircleAvatar(
          //           child: Text('0'),
          //         ),
          //         title: Text('List tile #$i'),
          //       ),
          //       childCount: 4,
          //     ),
          //   ),
          // )
          SliverStickyHeader(
            header: Container(
              height: 100,
              color: Colors.red,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => !_isShow && index == 1
                      ? Container()
                      : Container(height: 1000, color: buildGreen(index)),
                  childCount: 2),
            ),
          ),
        ],
      ),
    );
  }

  Color buildGreen(int i) => i != 0 ? Colors.green : Colors.black;
}
