import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginSignup.dart';
// import 'Login.dart';
import 'Signup.dart';
import 'Home.dart';
import 'Profile.dart';
import 'Search.dart';
import 'dm.dart';
import 'insta_list.dart';
import 'Fav.dart';
import 'Upload.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';


int i = 1;

class UploadWidget extends StatefulWidget {
  // UploadWidget({Key? key,  required this.email}):super(key:key);
  String email='';
  String caption = '';
  String username = '';
  UploadWidget({Key? key,  required this.email, required this.username, required this.caption}):super(key:key);
  @override
  upload createState() => upload();
}

// class Data {
//   final String text ;
//   final String dateTime;
//   Data({ this.text ,  this.dateTime });
// }
//String caption = "";
class upload extends State<UploadWidget> {
  late String imageUrl;


  get _formKey => null;
  File imageFile = File("");
  final ImagePicker picker = ImagePicker();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          backgroundColor: Colors.white,

        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox.expand(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val){
                      widget.caption =val;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your caption: ',
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(
                          // color: Colors.redAccent,
                            width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(
                          // color: Colors.redAccent,
                            width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async{
                          try{
                            final pickedFile = await picker.getImage(
                              source: ImageSource.gallery,
                              maxHeight: 300.0,
                            );
                            setState(() {
                              imageFile = File(pickedFile!.path);
                            });
                          } catch (err){
                            //showAlert(context, err.toString());
                            print(err);
                          }
                        },
                        style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all(Colors.red),
                        ),
                        child: Text(
                            'Pick from gallery'
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async{
                          try{
                            final pickedFile = await picker.getImage(
                              source: ImageSource.camera,
                              maxHeight: 300.0,
                            );
                            setState(() {
                              imageFile = File(pickedFile!.path);
                            });
                          } catch (err){
                            //showAlert(context, err.toString());
                            print(err);
                          }
                        },
                        style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all(Colors.red),
                        ),
                        child: Text(
                            'Take a photo'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.check,
            ),
            // backgroundColor: Colors.red,
            onPressed: ()  async{
              try{
                await FirebaseStorage.instance
                    .ref('folderName/imageName')
                    .putFile(imageFile);
                url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
                //ScaffoldMessenger.of(context).showSnackBar(mySnackBar(context, 'Edit successful. Restart app to see changes.'));
                CollectionReference users = FirebaseFirestore.instance.collection('users');
                DocumentSnapshot ds= await users.doc (widget.email).get();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile(fullname:ds.get('fullname'),  username: ds.get('username'), Bio: ds.get('Bio'), email: ds.get('email'), Website: ds.get('Website'))));
              } on FirebaseException catch (err){
                //showAlert(context, err.toString());
                print(err);
              }
              // onPressed: () async {
              //   url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
              //   Navigator.pushNamed(context, '/profile');
              // },
              FirebaseFirestore.instance.collection('users')
                  .doc(widget.email)
                  .update({
                'caption' : widget.caption,
              });
              b.insert(1,'${widget.username}');
              c.insert(1, 'goa');
              d.insert(1, "https://i.ibb.co/RhzNgYr/1620213159399.jpg");
              e.insert(1, "${url}");
            }
        ),

        //showAlert(context, err);
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 80.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            child: new Row(
              // alignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  onPressed: () async {
                    //url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
                    e[1] = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
                    Navigator.pushNamed(context, '/Home');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search_outlined,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Search');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Upload');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Fav');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.account_box,
                  ),
                  onPressed: () async {
                    url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
                    CollectionReference users = FirebaseFirestore.instance.collection('users');
                    DocumentSnapshot ds= await users.doc (widget.email).get();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile(fullname:ds.get('fullname'),  username: ds.get('username'), Bio: ds.get('Bio'), email: ds.get('email'), Website: ds.get('Website'))));
                  },
                ),
              ],
            ),
          ),
        )
    );

  }

// return Scaffold(
//     appBar: AppBar(
//       leading: BackButton(
//           color: Colors.black
//       ),
//       backgroundColor: Colors.white,
//
//     ),
//   body: Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // (imageUrl != null)
//         // //Image.network(imageUrl)
//         //     ? Navigator.pushNamed(context, '/profile')
//         //     : Placeholder(fallbackHeight: 200.0,fallbackWidth: double.infinity),
//              Container(
//               child: new Wrap(
//                 children: <Widget>[
//                   new ListTile(
//                       leading: new Icon(Icons.photo_library),
//                       title: new Text('Photo Library'),
//                       onTap: () {
//                         uploadImage();
//                         Navigator.of(context).pop();
//                       }),
//                   new ListTile(
//                     leading: new Icon(Icons.photo_camera),
//                     title: new Text('Camera'),
//                     onTap: () {
//                       _imgFromCamera();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//       ]
//     ),
//   ),
//     bottomNavigationBar: new Container(
//       color: Colors.white,
//       height: 80.0,
//       alignment: Alignment.center,
//       child: new BottomAppBar(
//         child: new Row(
//           // alignment: MainAxisAlignment.spaceAround,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             new IconButton(
//               icon: Icon(
//                 Icons.home_outlined,
//               ),
//               onPressed: () async {
//                 //url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
//                 e[1] = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
//                 Navigator.pushNamed(context, '/home');
//               },
//             ),
//             new IconButton(
//               icon: Icon(
//                 Icons.search_outlined,
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/search');
//               },
//             ),
//             new IconButton(
//               icon: Icon(
//                 Icons.add_box_outlined,
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/upload');
//               },
//             ),
//             new IconButton(
//               icon: Icon(
//                 Icons.favorite_border,
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/like');
//               },
//             ),
//             new IconButton(
//               icon: Icon(
//                 Icons.account_box,
//               ),
//               onPressed: () async {
//                 url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
//                 Navigator.pushNamed(context, '/profile');
//               },
//             ),
//           ],
//         ),
//       ),
//     )
// );
}

// _imgFromCamera() async {
//   final _storage = FirebaseStorage.instance;
//   final _picker = ImagePicker();
//   PickedFile image;
//   image = (await _picker.getImage(source: ImageSource.camera))!;
//   //  image = (await ImagePicker.pickImage(
//   //     source: ImageSource.camera, imageQuality: 50
//   // )) as PickedFile;
//
//    var file = File(image.path);
//
//    if (image != null){
//      //Upload to Firebase
//      var snapshot = await _storage.ref()
//          .child('folderName/imageName')
//          .putFile(file);
//
//
//      var downloadUrl = await snapshot.ref.getDownloadURL();
//
//      setState(() {
//        imageUrl = downloadUrl;
//      });
//      // final data = Data(
//      //     //dateTime: DateFormat(“dd/MM/yyyy —   HH:mm:ss:S”).format(DateTime.now()),
//      //     dateTime: "xxx",
//      //     text: imageUrl);
//      //String url;
//      Navigator.pushNamed(context, '/profile', arguments: {
//        //data: data
//        url = imageUrl
//      });
//    } else {
//      print('No Path Received');
//    }
// }
//
// uploadImage() async {
//   final _storage = FirebaseStorage.instance;
//   final _picker = ImagePicker();
//   PickedFile image;
//
//
//   //Check Permissions
//   await Permission.photos.request();
//
//   var permissionStatus = await Permission.photos.status;
//
//   if (permissionStatus.isGranted){
//     //Select Image
//     image = (await _picker.getImage(source: ImageSource.gallery))!;
//     var file = File(image.path);
//
//     if (image != null){
//       //Upload to Firebase
//       var snapshot = await _storage.ref()
//           .child('folderName/imageName')
//           .putFile(file);
//
//
//       var downloadUrl = await snapshot.ref.getDownloadURL();
//
//       setState(() {
//         imageUrl = downloadUrl;
//       });
//       // final data = Data(
//       //     //dateTime: DateFormat(“dd/MM/yyyy —   HH:mm:ss:S”).format(DateTime.now()),
//       //     dateTime: "xxx",
//       //     text: imageUrl);
//       //String url;
//       //ElevatedButton(onPressed: (){
//       //                     showDialog(
//       //                         context: context,
//       //                         builder: (BuildContext context) {
//       //                           return AlertDialog(
//       //                             backgroundColor: Colors.brown[100],
//       //                             content: Stack(
//       //                               overflow: Overflow.visible,
//       //                               children: <Widget>[
//       //                                 Positioned(
//       //                                   right: -40.0,
//       //                                   top: -40.0,
//       //                                   child: InkResponse(
//       //                                     onTap: () {
//       //                                       Navigator.of(context).pop();
//       //                                     },
//       //                                     child: CircleAvatar(
//       //                                       child: Icon(Icons.close,color: Colors.white,),
//       //                                       backgroundColor: Colors.brown,
//       //                                     ),
//       //                                   ),
//       //                                 ),
//       //                                 Form(
//       //                                   key: _formKey,
//       //                                   child: Column(
//       //                                     mainAxisSize: MainAxisSize.min,
//       //                                     children: <Widget>[
//       //                                       Padding(
//       //                                         padding: EdgeInsets.all(8.0),
//       //                                         child: TextFormField(
//       //                                           onChanged: (val){
//       //                                             grpname = val;
//       //                                           },
//       //                                           cursorColor: Colors.brown,
//       //                                           decoration: InputDecoration(
//       //                                               border: UnderlineInputBorder(),
//       //                                               labelText: 'Group Name',
//       //                                               labelStyle: TextStyle(color: Colors.brown[800],fontWeight: FontWeight.bold,fontSize: 20.0),
//       //                                               fillColor: Colors.brown
//       //                                           ),
//       //                                         ),
//       //                                       ),
//       //
//       //                                       Padding(
//       //                                         padding: const EdgeInsets.all(8.0),
//       //                                         child: RaisedButton(
//       //                                           child: Text("Create Group"),
//       //                                           onPressed: () async {
//       //                                             // CollectionReference users = FirebaseFirestore.instance.collection('users');
//       //                                             // DocumentSnapshot ds= await users.doc (widget.email).get();
//       //                                             FirebaseFirestore.instance.collection('users')
//       //                                                 .doc(widget.email)
//       //                                                 .set({
//       //                                               'caption' : grpname,
//       //                                             });
//       //                                             Navigator.pushNamed(context, '/profile', arguments: {
//       //                                               url = imageUrl
//       //                                             });
//       //                                           },
//       //                                         ),
//       //                                       )
//       //                                     ],
//       //                                   ),
//       //                                 ),
//       //                               ],
//       //                             ),
//       //                           );
//       //                         }
//       //                     );
//       // },
//       //   style: ElevatedButton.styleFrom(shape:  RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.circular(30.0),
//       //   ),
//       //     primary: Colors.brown[900],
//       //     elevation: 10.0,
//       //   ),
//       //   child: Text('Create Group'),
//       //
//       // );
//       Navigator.pushNamed(context, '/profile', arguments: {
//         url = imageUrl
//       });
//     } else {
//       print('No Path Received');
//     }
//
//   } else {
//     print('Grant Permissions and try again');
//   }
// }
//}