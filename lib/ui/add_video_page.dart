import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import 'package:preco/login/widgets/standard_elevated_button.dart';
import 'package:preco/model/video_files.dart';
import 'package:preco/model/video_folder.dart';

class AddVideoPage extends StatefulWidget {
  final String docId;
  const AddVideoPage({
    Key? key,
    required this.docId,
  }) : super(key: key);

  @override
  State<AddVideoPage> createState() => _AddVideoPageState();
}

class _AddVideoPageState extends State<AddVideoPage> {
  final codeController = TextEditingController();
  final desController = TextEditingController();
  final linkController = TextEditingController();
  final titleController = TextEditingController();
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Video',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: codeController,
                      decoration: InputDecoration(
                          labelText: 'Enter Code', border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          labelText: 'Enter Title', border: InputBorder.none),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: desController,
                      decoration: InputDecoration(
                          labelText: 'Enter Description',
                          border: InputBorder.none),
                      maxLines: 10,
                      minLines: 10,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: linkController,
                      decoration: InputDecoration(
                          labelText: 'Enter Link', border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  StandardElevatedButton(
                    labelText: 'Add Video',
                    onTap: () async {
                      if (codeController.text.isEmpty ||
                          titleController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Please enter code and title');
                      } else if (isSubmitting == false) {
                        isSubmitting = true;
                        await FirebaseFirestore.instance
                            .collection('VideoFolder')
                            .doc(widget.docId)
                            .get()
                            .then(
                          (value) async {
                            VideoFolder folder =
                                VideoFolder.fromMap(value.data()!);
                            VideoFiles videoFiles = VideoFiles(
                                title: titleController.text,
                                code: codeController.text,
                                link: linkController.text,
                                content: desController.text);
                            List<VideoFiles> ls = folder.videos;
                            ls.add(videoFiles);
                            VideoFolder newfolder = folder.copyWith(videos: ls);
                            await FirebaseFirestore.instance
                                .collection('VideoFolder')
                                .doc(widget.docId)
                                .set(newfolder.toMap())
                                .then((value) {
                              Fluttertoast.showToast(msg: 'Video Added');
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            });
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
