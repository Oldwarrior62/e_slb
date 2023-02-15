// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/Bloc/Company/company_state.dart';
import 'package:flutter_complete_guide/Bloc/Notes/notesCubit.dart';
import 'package:flutter_complete_guide/Bloc/Notes/notesState.dart';
import 'package:flutter_complete_guide/DatabaseHandler/DbHelper.dart';
import 'package:flutter_complete_guide/models/company_model.dart';
import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:sqflite/sqflite.dart';

import '../Bloc/Company/company_cubit.dart';
import '../Bloc/User/userCubit.dart';
//import 'package:flutter/services.dart';
//import 'package:geolocator/geolocator.dart';

class HeaderInfo extends StatefulWidget {
  HeaderInfo(
      {required this.lstcompany,
      required this.location,
      required this.weather});
  List<Company> lstcompany = [];
  String location;
  String weather;

  @override
  State<HeaderInfo> createState() => _HeaderInfoState();
}

class _HeaderInfoState extends State<HeaderInfo> {
  // final Geolocator geolocator = Geolocator();
  final String date = DateFormat.yMMMMd().format(DateTime.now());

  List<DropdownMenuItem<Company>> getitems() {
    return widget.lstcompany
        .map((e) => DropdownMenuItem(
              child: Text(e.companyName.toString()),
              value: e,
            ))
        .toList();
  }

  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //     currentLocation = await geolocator.getCurrentPosition(
        // desiredAccuracy: LocationAccuracy.best);

        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'UserName: ${BlocProvider.of<UserCubit>(context).state.userModel!.name.toString()}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14 //* curScaleFactor,
                    ),
              ),

              //display for current year month day is submitted
              Text(
                date,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12, //* curScaleFactor,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child:
                  //display weather bottom left of header_info
                  //currently hard coded in
                  Text(
                'Weather: ${widget.weather}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child:
                  //display weather bottom left of header_info
                  //currently hard coded in
                  Text(
                'Company:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: 90,
                child: BlocBuilder<CompanyCubit, CompanyState>(
                    builder: (context, state) {
                  return DropdownButton<Company>(
                    items: getitems(),
                    isExpanded: true,
                    onChanged: (value) {
                      context.read<CompanyCubit>().setCompany(value!);
                    },
                    value: state.company,
                  );
                }),
              ),
            )
          ],
        ),
        context.watch<UserCubit>().state.islisence
            ? Builder(builder: (context) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Security Lisence: ${context.read<UserCubit>().state.userModel!.securityLicense.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14 //* curScaleFactor,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'OFA: ${context.read<UserCubit>().state.userModel!.ofa.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14 //* curScaleFactor,
                            ),
                      ),
                    ],
                  ),
                );
              })
            : const Padding(padding: EdgeInsets.zero),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Row(
            children: [
              Text(
                'Location: ${widget.location}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14 //* curScaleFactor,
                    ),
              ),
            ],
          ),
        ),

        BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
          return state.notes != null && state.isedit == false
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: Offset(0, 7),
                              blurRadius: 7,
                              spreadRadius: 3)
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Notes:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(state.notes!.note.toString()),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            notesController.text = context
                                .read<NotesCubit>()
                                .state
                                .notes!
                                .note
                                .toString();
                            context.read<NotesCubit>().setIsEdit(true);
                          },
                          child: Text("Edit"))
                    ],
                  ),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextFormField(
                          controller: notesController,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              label: Text("Notes"),
                              hintText: "Notes",
                              border: OutlineInputBorder()),
                          maxLines: null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          state.notes != null
                              ? state.notes!.ontap == true
                                  ? ElevatedButton(
                                      onPressed: () {
                                        DbHelper db = DbHelper.instance;
                                        if (notesController.text.isNotEmpty) {
                                          Notes notes = Notes(
                                              note: notesController.text,
                                              date: DateTime.now()
                                                  .toString()
                                                  .split(' ')[0],
                                              ontap: true);
                                          db.updateNotes(notes).then((value) =>
                                              BlocProvider.of<NotesCubit>(
                                                      context)
                                                  .setNote(notes));
                                          BlocProvider.of<NotesCubit>(context)
                                              .setIsEdit(false);
                                        }
                                      },
                                      child: Text("Update"))
                                  : ElevatedButton(
                                      onPressed: () {
                                        DbHelper db = DbHelper.instance;
                                        if (notesController.text.isNotEmpty) {
                                          Notes notes = Notes(
                                              note: notesController.text,
                                              date: DateTime.now()
                                                  .toString()
                                                  .split(' ')[0],
                                              ontap: true);
                                          db.insertNotes(notes).then((value) =>
                                              BlocProvider.of<NotesCubit>(
                                                      context)
                                                  .setNote(notes));
                                        }
                                      },
                                      child: Text("Save"))
                              : ElevatedButton(
                                  onPressed: () {
                                    DbHelper db = DbHelper.instance;
                                    if (notesController.text.isNotEmpty) {
                                      Notes notes = Notes(
                                          note: notesController.text,
                                          date: DateTime.now()
                                              .toString()
                                              .split(' ')[0],
                                          ontap: true);
                                      db.insertNotes(notes).then((value) =>
                                          BlocProvider.of<NotesCubit>(context)
                                              .setNote(notes));
                                    }
                                  },
                                  child: Text("Save")),
                        ],
                      ),
                    )
                  ],
                );
        }),
      ],
    );
  }
}
