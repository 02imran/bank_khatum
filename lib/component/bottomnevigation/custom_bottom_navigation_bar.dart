import 'package:flutter/material.dart';

import '../../constants.dart';
import 'CustomBottomNavigationBarItem.dart';
import 'CustomBottomNavigationBarItemTile.dart';

class CustomBottomNavigationBar extends StatefulWidget {
    CustomBottomNavigationBar({
    required this.items,
    this.backgroundColor = const Color(0XFF003051),
    this.itemBackgroudnColor = const Color(0XFF003051),
    this.itemOutlineColor = uploadBackground,
    this.selectedItemColor = const Color(0XFFFFFFFF),
    this.unselectedItemColor = const Color(0XFFFFFFFF),
     Key? key,
    required this.onTap,
  })  : assert(items != null),
        assert(items.length > 1 && items.length < 6);

  final List<CustomBottomNavigationBarItem> items;
  final Color backgroundColor;
  final Color itemBackgroudnColor;
  final Color itemOutlineColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final ValueChanged<int> onTap;

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildBackground(),
        _buildItems(),
      ],
    );
  }

  Widget _buildBackground() {
    return Container(

      decoration:BoxDecoration(border:Border.all(color: stroke),color: widget.backgroundColor,borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20) )),
      width: double.infinity,
      height: 68.0,

    );
  }

  Widget _buildItems() {
    return SizedBox(
      height: 85.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.items.map((item) {
          int index = widget.items.indexOf(item);
          return CustomBottomNavigationBarItemTile(
            item,
            widget.selectedItemColor,
            widget.unselectedItemColor,
            widget.itemOutlineColor,
            widget.backgroundColor,
            widget.itemBackgroudnColor,
            index,
            _changeCurrentIndex,
            _currentIndex,
          );
        }).toList(),
      ),
    );
  }

  void _changeCurrentIndex(int index) {
    widget.onTap(index);
    setState(() {
      _currentIndex = index;
    });
  }
}
