import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_example/components/home/modules/list_item.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
Widget build(BuildContext context) => SizeTransition(
  key: ValueKey(item.urlImage),
  sizeFactor: animation,
  child: buildItem(),);

Widget buildItem() =>Container(
  margin: EdgeInsets.all(8),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white,
     ),
  child: Stack(
      fit: StackFit.loose,
     children:[
       Container(
          child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 32,
            backgroundImage: NetworkImage(item.urlImage),
            
        ),
        
        title: Wrap(
           children: <Widget>[
             Column(
               
               children: [
                 Text(
            item.title,
           style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                              fontSize: 22,
                             
                            ),),
           SizedBox(width: 20,),
          SizedBox(height: 9,),
          Text(
            'Date',
           style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
          ),
               ],
             ),
          
          ]
        ),
        trailing: Wrap( 
               
            children: <Widget>[
            Column(
              children: [
                Text(  
                              item.timein ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            SizedBox(height: 9,),
            
             Text(
                          item.timeout ,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                          ),
                        ),
                          ],
            ),
             SizedBox(width: 20,),
                         IconButton(
                            
            icon: Icon(
              Icons.delete,
            ),
          iconSize :24.0,
            color: Colors.blueAccent,
            splashColor: Colors.amber[300],
            onPressed: onClicked,
            tooltip:'delete',
          ),
          ]
          ),
                        
                        
                        
          ),
          
                    ),
            // Container(
            //           margin: EdgeInsets.only( top: 10, left: 5),
            //           child: Align(
            //             alignment: Alignment.centerRight,
            //             child: Text(
            //               item.timein ,
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 14,
            //                 fontFamily: 'Roboto',
            //               ),
            //             ),
            //           ),
            //         ),
            //           Container(
            //           margin: EdgeInsets.only( top: 10, left: 5 ),
            //           child: Align(
            //             alignment: Alignment.centerRight,
            //             child: Text(
            //               item.timeout ,
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 14,
            //                 fontFamily: 'Roboto',
            //               ),
            //             ),
            //           ),
            //         )
    ]
  )
);
}

