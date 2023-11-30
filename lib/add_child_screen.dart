import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:santa_test/children_notifier.dart';
import 'package:santa_test/home_screen.dart';
import 'package:santa_test/app_state.dart';
import 'package:santa_test/model/user_model.dart';

class AddChildScreen extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AddChildScreen({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final bool isNice = ref.watch(naughtyNiceProvider);
    final selectedCountry = ref.watch(selectedCountryProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Add New Kid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextFormField for entering child's name

              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter  name';
                  }
                  return null; // Return null for valid input
                },
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, ref, child) {
                  return Row(
                    children: [
                      const Text("Select country:"),
                      const SizedBox(
                        width: 40,
                      ),
                      // DropdownButton for selecting the country
                      DropdownButton(
                        hint: const Text('Gender'),
                        value: selectedCountry,
                        items: ['India', 'America', 'Japan', 'Dubai']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          ref.read(selectedCountryProvider.notifier).state =
                              value!; // Update the state when a country is selected
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text("Status"),
              // Radio buttons for selecting 'Nice' or 'Naughty'
              RadioListTile<bool>(
                title: const Text('Nice'),
                value: true,
                groupValue: isNice,
                onChanged: (value) {
                  ref.read(naughtyNiceProvider.notifier).setNaughtyNice(
                      value ?? true); // Update the state for 'Nice'
                },
              ),
              RadioListTile<bool>(
                title: const Text('Naughty'),
                value: false,
                groupValue: isNice,
                onChanged: (value) {
                  ref.read(naughtyNiceProvider.notifier).setNaughtyNice(
                      value ?? false); // Update the state for 'Naughty'
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // Button to add the child
              Center(
                child: SizedBox(
                  height: 45,
                  width: 200,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orangeAccent)),
                    onPressed: () {
                      final String name = nameController.text.trim();
                      final String country = ref.watch(selectedCountryProvider);
                      final bool selectedIsNice =
                          ref.watch(naughtyNiceProvider);
                      if (_formKey.currentState!.validate()) {
                        // Create a Child object with the selected isNice value
                        final Child newChild = Child(
                          name: name,
                          country: country,
                          isNice: selectedIsNice,
                        );

                        // Call the provider to add the new child
                        ref.read(childrenProvider.notifier).addChild(newChild);

                        // Navigate back to the home screen
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                            (route) => false);
                        ref.read(naughtyNiceProvider.notifier).state =
                            true; // Reset 'isNice' to true
                        ref.read(selectedCountryProvider.notifier).state =
                            "India"; // Reset selected country to "India"
                      }
                    },
                    child: const Text(
                      'ADD',
                      style: TextStyle(color: Colors.black),
                    ),
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
