import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_todo/utils/fade_in_button.dart';
import 'components/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'controllers/manager_controller.dart'; // Ensure you import your CustomTextField widget

class InputTaskScreen extends StatefulWidget {
  @override
  _InputTaskScreenState createState() => _InputTaskScreenState();
}

class _InputTaskScreenState extends State<InputTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedPriority;

  // List of priorities
  final List<String> priorities = ['High', 'Medium', 'Low'];

  String formatDate(DateTime? date) {
    if (date == null) {
      return ''; // Return empty if the date is null
    }
    return DateFormat('d MMM, yy').format(date); // Format to '26 Sept, 24'
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveTask(TodoProvider todoProvider) {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    // Validation
    if (title.isEmpty) {
      _showErrorMessage("Please enter a title.");
      return;
    }
    if (description.isEmpty) {
      _showErrorMessage("Please enter a description.");
      return;
    }
    if (_selectedDate == null) {
      _showErrorMessage("Please select a date.");
      return;
    }
    if (_selectedPriority == null) {
      _showErrorMessage("Please select a priority.");
      return;
    }

    // Add your save logic here
    print('Title: $title');
    print('Description: $description');
    print('Deadline: $_selectedDate');
    print('Priority: $_selectedPriority');

    todoProvider.onSave(title,description,formatDate(_selectedDate),_selectedPriority??'Low', context);
  }

  void _showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff1C1C1C),
      body: SingleChildScrollView(
        // Use SingleChildScrollView here
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
            children: [
              const SizedBox(height: 50), // Add some space at the top
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                child: Align(
                  alignment: Alignment.centerLeft, // Align the image to the left
                  child: SizedBox(
                    height: 100, // Set the desired height
                    child: Image.asset(
                      "lib/images/img_2.png",
                      fit: BoxFit.fitHeight, // You can adjust this as needed
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add some space at the top
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  child: Text(
                    "Create Task",
                    style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Title TextField
              CustomTextField(
                controller: _titleController,
                onTextChanged: (text) {},
                hintText: 'Title',
              ),
              const SizedBox(height: 16),

              // Description TextField
              CustomTextField(
                controller: _descriptionController,
                onTextChanged: (text) {},
                hintText: 'Description',
                maxLines: 8, // Set max lines for description
              ),
              const SizedBox(height: 16),

              // Date Picker Container
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: InkWell(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white70),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'Select a date'
                              : '${_selectedDate!.toLocal()}'.split(' ')[0],
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ),
                        Icon(
                          Icons.calendar_today,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Priority Dropdown
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Priority',
                    labelStyle: GoogleFonts.montserrat(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedPriority,
                      hint: Text(
                        'Select priority',
                        style: GoogleFonts.montserrat(color: Colors.white54),
                      ),
                      items: priorities.map((String priority) {
                        return DropdownMenuItem<String>(
                          value: priority,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              priority,
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                          ),
                        );
                      }).toList(),
                      dropdownColor: Color(0xff1C1C1C),
                      iconEnabledColor: Colors.white,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPriority = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Spacer to push buttons down
              SizedBox(height: 20),

              FadeInButtonDemo(
                isVisible: true,
                title: "Save",
                onTap: () => _saveTask(todoProvider), // Call _saveTask instead
              ),
              const SizedBox(height: 10), // Add some spacing between buttons
              FadeInButtonDemo(
                isVisible: true,
                title: "Cancel",
                buttonColor: Colors.transparent,
                borderColor: Colors.white70,
                titleColor: Colors.white70,
                onTap: () {
                  // Handle cancel action
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
