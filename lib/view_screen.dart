import 'package:flutter/material.dart';
import 'package:notepad/database/note_entitty.dart';
import 'package:notepad/styles.dart';

class ViewScreen extends StatelessWidget {
 final Note note;

  const ViewScreen({Key key, this.note}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold (
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, right: 15.0, bottom: 15.0, left: 15.0),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              }
               ,
                          child: Container(

                decoration: BoxDecoration(
                  color: kGreyBackgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Icon(Icons.chevron_left,size: 30, color: kTitleFontColor),
              ),
            ),
          ),

          Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: kGreyBackgroundColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 15.0, bottom: 15.0, left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         Text(note.noteTitle,style: kAddTitleStyle,),
                          Divider(),
                         Expanded(child: Text(note.noteDesc,style: kDescAddStyle,maxLines: 25,)),
                         Text(note.currentDate,style:kDateStyle)
                        ],
                      ),
                    ),
                  ),
                ),
        ]),
      ),
    );
  }
}
