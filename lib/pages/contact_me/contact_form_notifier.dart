import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohit_portfolio/pages/contact_me/contact_form.dart';

final contactFormProvider =
    StateNotifierProvider<ContactFormChangeNotifier, FormInfo>((ref) {
  return ContactFormChangeNotifier();
});

class ContactFormChangeNotifier extends StateNotifier<FormInfo> {
  ContactFormChangeNotifier()
      : super(FormInfo(name: '', email: '', message: ''));

  void onFormInputChange({String? name, String? email, String? message}) {
    FormInfo currentState = state;
    state = currentState.copyWith(
      name: name ?? currentState.name,
      email: email ?? currentState.email,
      message: message ?? currentState.message,
    );
  }

  void clearState() {
    state = state.copyWith(name: '', email: '', message: '');
  }
}
