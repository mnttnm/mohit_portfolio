import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohit_portfolio/api/slack_connect.dart';

import 'package:mohit_portfolio/colors/colors.dart';
import 'package:mohit_portfolio/pages/contact_me/contact_form_notifier.dart';
import 'package:mohit_portfolio/pages/contact_me/contact_form_payload_ui.dart';

class FormInfo {
  String name;
  String email;
  String message;
  FormInfo({
    required this.name,
    required this.email,
    required this.message,
  });

  FormInfo copyWith({String? name, String? email, String? message}) {
    return FormInfo(
      name: name ?? this.name,
      email: email ?? this.email,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "message": message};
  }
}

class ContactForm extends ConsumerStatefulWidget {
  const ContactForm({super.key});

  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends ConsumerState<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _formInfo = FormInfo(name: '', email: '', message: '');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(20.0).copyWith(top: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (String name) {
                      ref
                          .read(contactFormProvider.notifier)
                          .onFormInputChange(name: name);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required!';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _formInfo.name = newValue!,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      label: Text('_name'),
                      labelStyle: TextStyle(color: secondaryGreyColor),
                      icon: Icon(
                        Icons.person,
                        color: secondaryGreyColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      ref
                          .read(contactFormProvider.notifier)
                          .onFormInputChange(email: value);
                    },
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required!';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Please enter a valid email address!';
                      }
                      return null;
                    }),
                    onSaved: (newValue) => _formInfo.email = newValue!,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text('_email'),
                      labelStyle: TextStyle(color: secondaryGreyColor),
                      icon: Icon(
                        Icons.alternate_email,
                        color: secondaryGreyColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      ref
                          .read(contactFormProvider.notifier)
                          .onFormInputChange(message: value);
                    },
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please submit your message !';
                      }
                      return null;
                    }),
                    onSaved: (newValue) => _formInfo.message = newValue!,
                    minLines: 2,
                    maxLines: 2,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      label: Text('Your Message'),
                      labelStyle: TextStyle(color: secondaryGreyColor),
                      icon: Icon(
                        Icons.message,
                        color: secondaryGreyColor,
                      ),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreyColor,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // this won't work due to CORS issue.
                          sendSlackMessage(_formInfo.toJson());
                        }
                      },
                      child: const Text('Send Message'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 3,
          color: darkGreyColor,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(20.0).copyWith(top: 50),
            child: const ContactFormPayload(),
          ),
        ),
      ],
    );
  }
}
