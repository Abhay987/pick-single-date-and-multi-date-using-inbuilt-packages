import 'package:date_pickrt/date_range_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  DateTime initalDate=DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              selectDate(context);
            }, child: const Text("Choose Date")),
            const SizedBox(height: 40,),
            Text("Date is : ${selectedDate.day} : ${selectedDate.month} : ${selectedDate.year}"),
            const SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const DateRange()));
              }, child: const Text('Second Page')),
          ],
        ),
      ),
    );
  }
  selectDate(BuildContext context)async{
    final DateTime? selected=await showDatePicker(context: context, initialDate: initalDate,
        helpText: 'Select Leaves',
        confirmText: 'Submit',
        fieldHintText: "MONTH/DATE/YEAR",
        fieldLabelText: "Leaves",
        errorFormatText: "Enter a Valid Date",
        firstDate: DateTime(initalDate.year,initalDate.month,initalDate.day),
        lastDate: DateTime(initalDate.year,initalDate.month+1,initalDate.day));
    if (selected != null && selected != selectedDate)
      {
        setState(() {
          selectedDate = selected;
        });
      }

  }
}

