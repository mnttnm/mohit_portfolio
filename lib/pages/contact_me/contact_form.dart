import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mohit_portfolio/api/slack_connect.dart';
import 'package:mohit_portfolio/constants/colors.dart';
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
  bool showThankYouMessage = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showContactForm() {
    setState(() {
      showThankYouMessage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showThankYouMessage) ...[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0).copyWith(top: 50),
              child: ThankYouMessage(
                onShowForm: showContactForm,
              ),
            ),
          )
        ] else ...[
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
                      onSaved: (newValue) => _formInfo.name = newValue ?? '',
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
                      onSaved: (newValue) => _formInfo.email = newValue ?? '',
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
                      onSaved: (newValue) => _formInfo.message = newValue ?? '',
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            final success =
                                await sendSlackMessage(_formInfo.toJson());
                            if (success) {
                              ref
                                  .read(contactFormProvider.notifier)
                                  .clearState();
                              setState(() {
                                showThankYouMessage = true;
                              });
                            } else {
                              ref
                                  .read(contactFormProvider.notifier)
                                  .clearState();
                              _formKey.currentState!.reset();
                              if (!_formKey.currentState!.mounted) return;
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: accentOrangeColor,
                                  behavior: SnackBarBehavior.fixed,
                                  duration: Duration(seconds: 8),
                                  content: Text(
                                    "Oo ooh... Some issues! \nI will fix this, Please directly ping me on my socials, Sorry for the trouble!",
                                    style: TextStyle(
                                      color: secondaryWhiteColor,
                                    ),
                                  ),
                                ),
                              );
                            }
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
        ],
        const VerticalDivider(
          thickness: 2,
          color: primaryColorLight,
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

class ThankYouMessage extends StatelessWidget {
  const ThankYouMessage({
    Key? key,
    required this.onShowForm,
  }) : super(key: key);

  final Function onShowForm;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Thanks for reaching out!",
              style: TextStyle(
                fontSize: 18,
                color: secondaryWhiteColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.handshake,
              color: accentOrangeColor,
            )
          ],
        ),
        const Text(
          "I Will reply back soon!",
          style: TextStyle(color: secondaryGreyColor),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              onShowForm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: darkGreyColor,
            ),
            child: const Text("Send New Message"))
      ],
    );
  }
}
