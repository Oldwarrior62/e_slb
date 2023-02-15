import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/Bloc/User/userCubit.dart';

import 'package:flutter_complete_guide/widgets/add_company.dart';
import 'package:flutter_complete_guide/widgets/main_log_entry.dart';
import 'package:flutter_complete_guide/widgets/updateProfile.dart';
import 'package:flutter_complete_guide/widgets/view_notes.dart';

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
      child: ListView(
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
          _buildListTile('Home', Icons.house, () {
            Navigator.of(context).pushReplacementNamed(MainLogEntry.routeName);
          }),
          _buildListTile('Update Profile', Icons.update, () {
            Navigator.of(context).pushReplacementNamed(UpdateProfile.routeName);
          }),
          _buildListTile('Add Company', Icons.house, () {
            Navigator.of(context)
                .pushReplacementNamed(AddCompanyScreen.routeName);
          }),
          _buildListTile('View Notes', Icons.view_agenda, () {
            Navigator.of(context).pushReplacementNamed(ViewNotes.routeName);
          }),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Preferances',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Builder(builder: (context) {
                  return SwitchListTile(
                    title: Text('Show Lisence'),
                    onChanged: (bool value) {
                      context.read<UserCubit>().setIsLisence(value);
                    },
                    value: context.watch<UserCubit>().state.islisence,
                  );
                }),
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
