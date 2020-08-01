import 'package:flutter/material.dart';
import 'package:notepad/database/note_entitty.dart';
import 'package:notepad/styles.dart';
import 'package:intl/intl.dart';
import 'database/note_dao.dart';

class AddScreen extends StatefulWidget {
   final NoteDao addNoteDao;

  const AddScreen({Key key, this.addNoteDao}) : super(key: key);
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String noteTitleInput = "";
  String noteDescInput = "";

 


  void addNote(){
    var newDt = new DateFormat.yMMMMd('en_US').add_jm().format(DateTime.now());
    widget.addNoteDao.insertNote(new Note(null,noteTitleInput,noteDescInput,newDt.toString())).whenComplete(() => print("sucess"));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, right: 15.0, bottom: 15.0, left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                                              child: Container(
                          decoration: BoxDecoration(
                            color: kGreyBackgroundColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Icon(Icons.chevron_left,size: 30, color: kTitleFontColor),
                        ),
                      ),
                      Container(
                        child: FlatButton.icon(
                          onPressed: (){
                       
                              addNote();
                          },
                          icon: Icon(Icons.save, color: kTitleFontColor),
                          label: Text(
                            "Save",
                            style: TextStyle(color: kTitleFontColor),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kGreyBackgroundColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: kGreyBackgroundColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 15.0, bottom: 15.0, left: 15.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            onChanged: (value) {
                              noteTitleInput = value;
                            },
                            style: kAddTitleStyle,
                            decoration: InputDecoration(
                                hintText: "Title", border: InputBorder.none),
                          ),
                          Divider(),
                          TextField(
                            onChanged: (value) {
                              noteDescInput = value;
                            },
                            maxLines: 25,
                            style: kDescAddStyle,
                            decoration: InputDecoration(
                                hintText: "Note", border: InputBorder.none),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
