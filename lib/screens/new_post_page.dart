import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: GoogleFonts.montserrat(fontSize: 72, fontWeight: FontWeight.bold, letterSpacing: -3),
          displayMedium: GoogleFonts.montserrat(fontSize: 48, fontWeight: FontWeight.bold, letterSpacing: -2),
          displaySmall: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.normal, letterSpacing: 0),
          headlineLarge: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: -2),
          headlineSmall: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.normal, letterSpacing: 0),
          bodyMedium: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.normal, letterSpacing: 0),
          bodySmall: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 0),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NewPostConfirmScreen(),
    );
  }
}

class NewPostConfirmScreen extends StatefulWidget {
  const NewPostConfirmScreen({super.key});

  @override
  State<NewPostConfirmScreen> createState() => _NewPostConfirmScreenState();
}

class _NewPostConfirmScreenState extends State<NewPostConfirmScreen> {
  DateTime? _selectedDate;

  // Function to show the date picker
  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(), 
      lastDate: DateTime(2101),
    );
    if (pickedDate == null) return;

    if (!context.mounted) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDate ?? DateTime.now()),
    );
    if (pickedTime == null) return;

    setState(() {
      _selectedDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        leading: Icon(Icons.chevron_left, size: 32,),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
        elevation: 0,
      ),
      body: Column(
        spacing: 10,
        children: [

          //Image Input
          Container(
            height: 343,
            width: 343,
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('assets/images/mike.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),

          //Title Text Input
          Container(
            height: 47,
            width: 343,
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Container(
              height: 47,
              margin: EdgeInsets.only(left: 9),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintText: "Title",
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: InputBorder.none,
                ),
              ),
            )),
          ),

          //Description Text Input
          Container(
            height: 130,
            width: 343,
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Container(
              margin: EdgeInsets.only(left: 9, right: 4),
              height: 130,
              child: TextField(
                maxLines: 4,
                maxLength: 120,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintText: "Description",
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: InputBorder.none,
                ),
              ),
            )),
          ),

          //Location Box
          Container(
            height: 47,
            width: 343,
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 4),
              child: Row(
                children: [
                  Icon(Icons.location_pin, color: Theme.of(context).colorScheme.onTertiaryContainer,),
                  Align(alignment: Alignment.centerLeft,child: Text("Location")),
                ],
              ),
            ),
          ),

          //Lasts until button
          GestureDetector(
            onTap: () => _selectDateTime(context),
            child: Container(
              height: 47,
              width: 343,
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      'Lasts Until:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      child: Text(
                        _selectedDate == null
                            ? 'Select a date'
                            : DateFormat('MM/dd/yyyy hh:mma').format(_selectedDate!),
                        style: _selectedDate == null
                            ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6)
                              )
                            : Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Spacer to push Post Button to bottom
          Spacer(),

          //Post Button
          Container(
            height: 47,
            margin: EdgeInsets.only(bottom: 19, left: 25, right: 25),
            child: Center(child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                minimumSize: Size(343, 47),
              ),
              child: Text('Post'),
            )),
          ),
        ],
      ),
    );
  }
}