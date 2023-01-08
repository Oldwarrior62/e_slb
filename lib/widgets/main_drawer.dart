import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/widgets/Email_item.dart';
import 'package:flutter_complete_guide/widgets/company_selected.dart';
import '../widgets/date_selected.dart';
import 'package:flutter_complete_guide/widgets/location_selected.dart';
import 'package:flutter_complete_guide/widgets/update_page.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  var _isDyslixec = false;
  var _isTwentyFourHour = false;

  Widget _buildListTileSwitch(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue as void Function(bool)?,
    );
  }

  Widget _buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler as void Function()?,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Security log book',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile('Header update', Icons.update, () {
            Navigator.of(context).pushReplacementNamed(UpdatePage.routeName);
          }),
          _buildListTile('Email', Icons.email, () {
            Navigator.of(context).pushReplacementNamed(Email.routeName);
          }),
          _buildListTile('Pesonal info', Icons.info, () {
            Navigator.of(context).pushReplacementNamed(DateSelected.routeName);
          }),
          _buildListTile('Pesonal info', Icons.info, () {
            Navigator.of(context)
                .pushReplacementNamed(CompanySelected.routName);
          }),
          _buildListTile('Pesonal info', Icons.info, () {
            Navigator.of(context)
                .pushReplacementNamed(LocationSelected.routeName);
          }),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Preferances',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildListTileSwitch(
                  'Dyslexic',
                  'May help reading',
                  _isDyslixec,
                  (newValue) {
                    setState(() {
                      _isDyslixec = newValue;
                    });
                  },
                ),
                _buildListTileSwitch(
                  '24 clock',
                  'select 24 hour or standard time.',
                  _isTwentyFourHour,
                  (newValue) {
                    setState(() {
                      _isTwentyFourHour = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
