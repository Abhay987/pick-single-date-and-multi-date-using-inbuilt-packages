import 'package:flutter/material.dart';
class DateRange extends StatefulWidget {
  const DateRange({Key? key}) : super(key: key);

  @override
  State<DateRange> createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> {
  DateTime initalDate=DateTime.now();
  DateTimeRange selectedDate = DateTimeRange(start: DateTime.now(), end:DateTime.now());

  selectDate(BuildContext context)async{
    final DateTimeRange? selected=await showDateRangePicker(context: context,
        helpText: 'Select Leaves',
       saveText: 'Submit',
        errorFormatText: "Enter a Valid Date",
        initialEntryMode: DatePickerEntryMode.calendar,
        firstDate: DateTime(initalDate.year,initalDate.month,initalDate.day),
        lastDate: DateTime(initalDate.year,initalDate.month+1,initalDate.day));
    if (selected != null && selected != selectedDate)
    {
      setState(() {
        selectedDate = selected;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Date Range',
          style: TextStyle(color: Colors.black),),
      ),
      body: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                selectDate(context);
              }, child: const Text("Choose Date")),
              const SizedBox(height: 40,),
             // Text("Date is : ${selectedDate.day} : ${selectedDate.month} : ${selectedDate.year}"),
              Text("Date Range is : ${selectedDate.start} : ${selectedDate.end}")
            ],
          ),
        ),
      ));

  }
}
