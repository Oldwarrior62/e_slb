import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/Bloc/Notes/notesCubit.dart';
import 'package:flutter_complete_guide/Bloc/Notes/notesState.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class ViewNotes extends StatelessWidget {
  static const routeName = '/viewnotes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Notes"),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.lstNotes.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Notes:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          state.lstNotes[index].date.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(state.lstNotes[index].note.toString()),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
