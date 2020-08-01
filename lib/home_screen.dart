import 'package:flutter/material.dart';
import 'package:notepad/add_screen.dart';
import 'package:notepad/database/note_dao.dart';
import 'package:notepad/database/note_database.dart';
import 'package:notepad/styles.dart';
import 'package:notepad/view_screen.dart';

import 'database/note_entitty.dart';

// 111d49;
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Note> allNotes;
   NoteDao noteDao;

  @override
  void initState() {
    initDb();
    // TODO: implement initState
    super.initState();

    // allNotes = await noteDao.findAllNotes();
  }

   void initDb() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('note_database.db').build();
      

    noteDao = database.noteDao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 15.0, bottom: 8.0),
            child: Container(
                decoration: BoxDecoration(
                  color: kGreyBackgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: kTitleFontColor,
                    ),
                    onPressed: null)),
          ),
        ],
        title: Text(
          "MyNotes",
          style: kAppBarStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return AddScreen(addNoteDao: noteDao);
            }),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<Note>>(
          stream: noteDao.findAllNotes(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Text("Add Notes"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          print("tap");
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) {
                              return ViewScreen(note: snapshot.data[index]);
                            }),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              Text(
                                snapshot.data[index].noteTitle,

                                // "Note Title",
                                style: kFontTitleStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer(flex: 1),
                              IconButton(
                                icon: Icon(Icons.star_border,
                                    color: kTitleFontColor),
                                onPressed: () {},
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert,
                                  color: kTitleFontColor,
                                ),
                              )
                            ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(snapshot.data[index].noteDesc,
                                        style: kDescStyle, maxLines: 2),
                                  ),
                                  Text(
                                    snapshot.data[index].currentDate,
                                    style: kDateStyle,
                                  )
                                ]),
                            Divider()
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
