import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'add_image.dart';

class BreedResult extends StatefulWidget {

  final bool loading;
  final XFile picture;
  final List result;

   BreedResult({this.loading,this.picture,this.result});


  static String id = 'breed_result';


  @override
  _BreedResultState createState() => _BreedResultState();
}

class _BreedResultState extends State<BreedResult> {
  XFile pic;
  bool  picBool;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      pic=widget.picture;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar:  AppBar(
        backgroundColor: Colors.white,
        title: ListTile(leading:Icon(FontAwesomeIcons.listUl,color: Colors.black,),title: Text('Screen 3',style: TextStyle(color: Colors.black),),),
      ),
      body: widget.loading?Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ):Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            (widget.picture==null) ? Container():(Image.file(File(widget.picture.path))),
            SizedBox(height: 16,),
            widget.result == null? Text(""):Text("${widget.result[0]["label"]}",
              style: TextStyle(
                  color: Colors.black
              ),)
          ],
        ),
      ),
      // floatingActionButton: Center(
      //   child: FlatButton(
      //
      //     child: Text("Gallery",
      //       style: TextStyle(
      //         color: Colors.white,
      //       ),),
      //     color: Colors.black,
      //
      //
      //
      //
      //     onPressed: (){
      //       chooseImage();
      //     },
      //   ),
      // ),
    );
  }

}


