import 'package:flutter/cupertino.dart';
import 'package:user_profile_example/components/home/data/list_items.dart';
import 'package:user_profile_example/components/home/modules/list_item.dart';
import 'package:user_profile_example/components/home/screens/doctor_details_page.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_example/components/home/widget/list_item_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr/qr.dart';
import 'package:user_profile_example/components/home/widget/pretty_qr_code.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:user_profile_example/components/home/utils.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:user_profile_example/components/profile/profile.dart';

class HomePage extends StatefulWidget {
 // const HomePage({Key? key, required this.choice}) : super(key: key);
 // final Choice choice;
  @override
  State<StatefulWidget> createState() => HomePageState();
}


class HomePageState extends State<HomePage> {


  final image = NetworkImage('https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80');
  final listKey = GlobalKey<AnimatedListState>();
  final List<ListItem> items = List.from(listItems);
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  final qrKey = GlobalKey(debugLabel: 'QR');
  String _data ='';


   CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  //HomePageState(this.choice);
  //  QRViewController? ontroller;

  // @override
  // void dispose(){
  //   controller?.dispose();
  //   super.dispose();
  // }

_scan() async{
   await FlutterBarcodeScanner.scanBarcode(
    '#000000', 
    'cancel', 
    true, 
    ScanMode.BARCODE).then((value) => setState(()=>_data = value));
}




  @override
  Widget build(BuildContext context) {
    return initScreen();
  }



  Widget initScreen() {
    Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;
   // final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return DefaultTabController(
         length: 4,
      child: Scaffold(
        backgroundColor: Color(0xff053F5E),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xff053F5E),
          centerTitle: true,
          title: Text(
            " Home",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              color: Colors.grey[100],
            ),
          ),
          leading:  Column(
            children: <Widget>[
                SizedBox(height: 15,),
              GestureDetector(
              onTap: () {
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfileMain()),
  );
  SizedBox(height: 10,);
              },
              child:Center(
                      child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.dehaze_outlined,
                  color: Colors.white60,
                ),
              ),
                    ),
              )],
          ),
          actions: [
            // GestureDetector(
            //   child: Container(
            //     margin: EdgeInsets.only(right: 7),
            //     child: Icon(
            //       Icons.notifications_active_outlined,
            //       color: Colors.white60,
            //     ),
            //   ),
            // ),
            
             GestureDetector(
              child: Center(
                child: CircleAvatar(
                          child: ClipOval(
                            child: Image.network('https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,),
                          ),
                        ),
              ),
            ),
            SizedBox(width: 10,),
          ],
        ),
        body: Container(
          
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Hi, Sarah",
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 25,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20, bottom: 40),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                    Hero(
                      tag:'image',
                      child: Center(
                            child: ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              child: Ink.image(
                                image: image,
                                fit: BoxFit.cover,
                                width: 400,
                                height: 400,
                               // child: InkWell(onTap: onClicked),
                              ),
                            ),
                            ),
                          ),
                    ),
                             Container(
                    width: size.width,
                    margin: EdgeInsets.only(top: 40, ),
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                      
                        Center(
                          child: Container(
                            child: Text(
                              'your QR CODE',
                              style: TextStyle(
                                color: Color(0xff363636),
                                fontSize: 15,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        ]),),
                        // Container(
                        // margin: EdgeInsets.only(bottom: 20),
                        //   child:Center(
                        //     child: QrImage(
                        //       padding: EdgeInsets.all(15),
                        //       backgroundColor:Colors.white,
                        //     data: items.toString(),
                        //     version: QrVersions.auto,
                        //     size: 150.0,
                        // ),
                        //   ),
                        // ),
    
                       Container(
                          child:Center(
              child: PrettyQr(
                  size: 170,
                  data: items.toString(),
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                  roundEdges: true)),
                        ),
                        Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top:25.0, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary:Color(0xff00444f),
                                    ),
                                    onPressed: ()=> _scan(),
    
                                    child: Text('Scan your Qr Code',)),
                                    Text(_data),
                                ],
                              ),
                            ),
                          ),
                        ),
    
                          Container(
                             height: 281.840,
                             child: Column(
                              children: <Widget>[
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "Memories",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                ],
                                                        ),
                               const SizedBox(
                                  height: 10,
                                ),
                                AnimatedOpacity(
                                duration: const Duration(milliseconds: 200),
                               opacity: closeTopContainer?0:1,
                               child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: size.width,
                                                   alignment: Alignment.topCenter,
                                                   height: closeTopContainer?0:categoryHeight,
                                                   child: categoriesScroller),
                                             ),
                                                   Expanded(
                                               child: ListView.builder(
                                                 controller: controller,
                                                   itemCount: items.length,
                                                   physics: BouncingScrollPhysics(),
                                                   itemBuilder: (context, index) {
                                                     double scale = 1.0;
                                                     if (topContainer > 0.5) {
                              scale = index + 0.5 - topContainer;
                              if (scale < 0) {
                                scale = 0;
                              } else if (scale > 1) {
                                scale = 1;
                              }
                                                     }
                                                     return Opacity(
                              opacity: scale,
                              child: Transform(
                                transform:  Matrix4.identity()..scale(scale,scale),
                                alignment: Alignment.bottomCenter,
                                child: Align(
                                    heightFactor: 0.7,
                                    alignment: Alignment.topCenter,
                                   ),
                              ),
                                                     );
                                                   })),
                              ]
                             ),
                          ),
                        
                               
                                Container(
                                    color:Colors.white70,
                                    child: TabBar(
                                      
                                      labelColor:Colors.black,
                                      indicatorColor:Colors.black,
                                      tabs: [
                                        Tab(text:"Recently", ),
                                         Tab(text:"Weekly"),
                                          Tab(text:"Monthly"),
                                           Tab(text:"Year"),
                                      ],
                                      
                                      ),
                                  ),

                                  Container(
                                    height:500,
                                    child: TabBarView(
            children: <Widget>[
              Center(
                child: Container(
                          margin: EdgeInsets.fromLTRB(8, 0, 8, 20),
                          height:700,
                            child: AnimatedList(
                              key:listKey,
                              scrollDirection: Axis.vertical,
                              initialItemCount: items.length,
                                     itemBuilder: (context,index,animation)=>ListItemWidget(
                                       item: items[index],
                                       animation: animation,
                                       onClicked:()=>removeItem(index),
                                     )
                              
                            ),
                ),
                        ),
                        Center(child: Container(
                          color: Colors.transparent,
                            margin: EdgeInsets.fromLTRB(8, 0, 8, 60),
                          height:500,
                child:SfCalendar(
                   backgroundColor:Colors.transparent,
          view: CalendarView.week,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ),
              )),
              Center(child:TableCalendar(
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        calendarFormat: _calendarFormat,
        rangeSelectionMode: _rangeSelectionMode,
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              _rangeStart = null; // Important to clean those
              _rangeEnd = null;
              _rangeSelectionMode = RangeSelectionMode.toggledOff;
            });
          }
        },
        onRangeSelected: (start, end, focusedDay) {
          setState(() {
            _selectedDay = null;
            _focusedDay = focusedDay;
            _rangeStart = start;
            _rangeEnd = end;
            _rangeSelectionMode = RangeSelectionMode.toggledOn;
          });
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),),
              
             Center(child: Container(
                margin: EdgeInsets.fromLTRB(8, 0, 8, 60),
                          height:500,
                          child: SfCalendar(
                          backgroundColor:Colors.transparent,
      view: CalendarView.schedule,
      initialDisplayDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
    )
              )),
            ],
          ),
                                  ),
    
                                  
                                  
                                  //  Padding(
                                  //    padding: const EdgeInsets.all(8.0),
                                  //    child: Container(
    
                                  //    ),
                                  //  ),
                                
                            
    
    
                   
                      // Text(
                      //   'Recent locations',
                      //   style: TextStyle(
                      //     color: Color(0xff363636),
                      //     fontSize: 20,
                      //     fontFamily: 'Roboto',
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      // ),
                        
                       
    
                        // Container(
                        //   margin: EdgeInsets.fromLTRB(8, 0, 8, 20),
                        //   height:700,
                        //     child: AnimatedList(
                        //       key:listKey,
                        //       scrollDirection: Axis.vertical,
                        //       initialItemCount: items.length,
                        //              itemBuilder: (context,index,animation)=>ListItemWidget(
                        //                item: items[index],
                        //                animation: animation,
                        //                onClicked:()=>removeItem(index),
                        //              )
                              
                        //     ),
                          
                        // )
                       
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
   List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
        Meeting('PopOut', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

// Widget buildQrView(BuildContext context)=>QRView(
//   key: qrKey, 
//   onQRViewCreated: onQRViewCreated,
//   );

// void onQRViewCreated(QRViewController controller){
//   setState(() =>
//     this.controller = controller
//   );
// }
  

void removeItem (int index){
  final removeItem = items[index];
  items.removeAt(index);
  listKey.currentState!.removeItem(
    index,
    (context,animation)=>ListItemWidget(
      item: removeItem, 
      animation: animation,
       onClicked: (){},
       ),
       duration: Duration(milliseconds: 600),
  );
}

  Widget demoCategories(String img, String name, String drCount) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Color(0xff107163),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(img),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Color(0xffd9fffa).withOpacity(0.07),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              drCount,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();
  

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Yesterday\ndate",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "MEST Africa",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Last Week\ndate",
                          style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Ecobank",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.lightBlueAccent.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Last Month\ndate",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Emirates",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}


@override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
        Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }


class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}