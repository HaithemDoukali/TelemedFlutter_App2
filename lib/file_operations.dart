import 'package:flutter/material.dart';
import 'file_utils.dart';

class FileOperation extends StatefulWidget {
  FileOperation() : super();

  final String title = "File Operations";

  @override
  _FileOperationState createState() => _FileOperationState();
}

class _FileOperationState extends State<FileOperation> {
  final myController = TextEditingController();
  String fileContents = 'No Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: myController,
              ),
              RaisedButton(
                  child: Text('Save to File'),
                  onPressed: () {
                    FileUtils.saveToFile(myController.text);
                  }),
              RaisedButton(
                child: Text('Read from Fileo'),
                onPressed: () {
                  FileUtils.readFromFile().then((contents) {
                    setState(() {
                      fileContents = contents;
                    });
                  });
                },
              ),
              Text(fileContents)
            ]));
  }
}
