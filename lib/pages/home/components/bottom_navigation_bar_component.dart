import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              icon: Icon(
                Feather.home,
                size: 22,
                color: Colors.grey[850],
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Feather.credit_card,
                size: 22,
                color: Colors.grey[850],
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: Icon(
                    Feather.plus,
                    size: 22,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                MaterialIcons.attach_money,
                size: 22,
                color: Colors.grey[850],
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Feather.user,
                size: 22,
                color: Colors.grey[850],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
