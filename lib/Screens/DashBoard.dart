import 'package:NoteShare/Utilities/NavDrawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../Model/DashBoardModel.dart';
import 'package:get/get.dart';
import '../Utilities/AppRoutes.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Departments",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: DashBoardModel.dept.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  Get.toNamed(AppRoutes.SUBJECTPAGE, arguments: index);
                });
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      DashBoardModel.dept[index].iconData,
                      size: 40,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(DashBoardModel.dept[index].departMentName,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}


// //Creating a global Variable    
// Reference storageReference = FirebaseStorage.instance.ref();
// File _image;

// void getImage(){
//     _image = await ImagePicker.pickImage(source: ImageSource.gallery); 
// }

// void addImageToFirebase(){


//     //CreateRefernce to path.
//     Reference ref = storageReference.child("yourstorageLocation/");

//     //StorageUpload task is used to put the data you want in storage
//     //Make sure to get the image first before calling this method otherwise _image will be null.

//     Task storageUploadTask = ref.child("image1.jpg").putFile(_image);

//       storageUploadTask.whenComplete(()async {
//           String url =await ref.getDownloadURL();
//           print("The download URL is " + url);
//       }).catchError((onError) {
//     print(onError);
//     });

//     if (storageUploadTask.isInProgress) {

//           storageUploadTask.events.listen((event) {
//           double percentage = 100 *(event.snapshot.bytesTransferred.toDouble() 
//                                / event.snapshot.totalByteCount.toDouble());  
//           print("THe percentage " + percentage.toString());
//           });

//           StorageTaskSnapshot storageTaskSnapshot =await storageUploadTask.onComplete;
//           downloadUrl1 = await storageTaskSnapshot.ref.getDownloadURL();

//           //Here you can get the download URL when the task has been completed.
//           print("Download URL " + downloadUrl1.toString());

//      } else{
//           //Catch any cases here that might come up like canceled, interrupted 
//      }

// }