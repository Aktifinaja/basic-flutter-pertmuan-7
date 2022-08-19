// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seventh_meet/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.route,
      routes: {
        MyHomePage.route: (context) => const MyHomePage(),
        SecondScreen.route: (context) => const SecondScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const String route = '/main_screen';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textController = TextEditingController();
  final FocusNode textFocus = FocusNode();
  DateTime date_value = DateTime.now();
  TimeOfDay time_value = TimeOfDay.now();
  bool switch_value = false;
  bool checkbox_value = false;
  String dropdown_value = 'Yanto';
  List<String> dropdown_list = ['Yanto', 'Arif', 'Rudi', 'Andi'];
  double slider_value = 90;

  // ! Select Date Method
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: date_value,
      firstDate: DateTime(1945),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null && selectedDate != date_value) {
      setState(() {
        date_value = selectedDate;
      });
    }
  }

  // ! Select Time Method
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: time_value,
    );

    if (selectedTime != null && selectedTime != time_value) {
      setState(() {
        time_value = selectedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input & Notification Widget'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ! TextFormField
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                child: TextFormField(
                  controller: textController,
                  focusNode: textFocus,
                  cursorColor: Colors.amber,
                  cursorWidth: 1,
                  // inputFormatters: [
                  //   LengthLimitingTextInputFormatter(5), // * Batas maksimal karakter
                  //   FilteringTextInputFormatter.allow(filterPattern) // * Karakter yang dapat digunakan
                  //   FilteringTextInputFormatter.deny(filterPattern) // * Karakter yang tidak dapat digunakan
                  // ],
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  style: const TextStyle(color: Colors.red),
                  decoration: const InputDecoration(
                    // border: UnderlineInputBorder( // Not Focused
                    //   borderSide: BorderSide(color: Colors.red, width: 2, )
                    // ),
                    // focusedBorder: UnderlineInputBorder( // When Focused
                    //   borderSide: BorderSide(color: Colors.red, width: 2, )
                    // ),
                    // enabledBorder: UnderlineInputBorder( // Already Focused
                    //   borderSide: BorderSide(color: Colors.red, width: 4, )
                    // ),
                    border: OutlineInputBorder(
                      // Not Focused
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // When Focused
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      // Already Focused
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    hintText: 'Ketik Nama Anda!',
                    // contentPadding: EdgeInsets.all(2), // * Untuk memberi jarak antara content dan batas
                    hintStyle: TextStyle(
                      color: Colors.green,
                    ),
                    isDense: true,
                  ),
                ),
              ),
              // ! DatePicker
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(date_value.toString()),
                ),
              ),
              // ! TimePicker
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text(time_value.toString()),
                ),
              ),
              // ! Switch
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Switch(
                  value: switch_value,
                  onChanged: (value) {
                    setState(() {
                      switch_value = value;
                    });
                  },
                ),
              ),
              // ! CheckBox
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Checkbox(
                  value: checkbox_value,
                  onChanged: (value) {
                    setState(() {
                      checkbox_value = value!;
                    });
                  },
                ),
              ),
              // ! DropDown
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: DropdownButton(
                  value: dropdown_value,
                  items: dropdown_list
                      .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdown_value = value.toString();
                    });
                  },
                ),
              ),
              // ! Slider
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Slider(
                  value: slider_value,
                  min: 0,
                  max: 100,
                  // divisions: 10, // * Kelipatan
                  activeColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      slider_value = value;
                    });
                  },
                ),
              ),
              // ! AlertDialog
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Aktifin!'),
                        content: const Text('Ini Dialog!'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OKE!'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Show Dialog!'),
                ),
              ),
              // ! SnackBar
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                      content: Text('Halo Akfitin!'),
                    ));
                  },
                  child: const Text('Show SnackBar!'),
                ),
              ),
              // ! ModalBottomSheet
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: const Text('Modal Bottom Sheet!'),
                      ),
                    );
                  },
                  child: const Text('Show ModalBottomSheet!'),
                ),
              ),
              // ! Push Navigation
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(SecondScreen.route),
                  child: const Text('Push!'),
                ),
              ),
              // ! PushReplacement Navigation
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacementNamed(SecondScreen.route),
                  child: const Text('PushReplacement!'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
