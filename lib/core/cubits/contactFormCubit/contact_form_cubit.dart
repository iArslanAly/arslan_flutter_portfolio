import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_form_state.dart';

class ContactFormCubit extends Cubit<ContactFormState> {
  ContactFormCubit() : super(const ContactFormState());

  void updateName(String value) =>
      emit(state.copyWith(name: value, nameError: null));

  void updateEmail(String value) =>
      emit(state.copyWith(email: value, emailError: null));

  void updatePhone(String value) =>
      emit(state.copyWith(phone: value, phoneError: null));

  void updateSubject(String value) =>
      emit(state.copyWith(subject: value, subjectError: null));

  void updateMessage(String value) =>
      emit(state.copyWith(message: value, messageError: null));

  Future<void> submitForm() async {
    String? nameError;
    String? emailError;
    String? phoneError;
    String? subjectError;
    String? messageError;

    // ✅ Name
    if (state.name.trim().isEmpty) {
      nameError = "Name is required";
    }

    // ✅ Email
    if (state.email.trim().isEmpty) {
      emailError = "Email is required";
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(state.email.trim())) {
      emailError = "Enter a valid email";
    }

    // ✅ Phone (optional but format check)
    if (state.phone.trim().isNotEmpty &&
        !RegExp(r'^[0-9]{10,15}$').hasMatch(state.phone.trim())) {
      phoneError = "Enter a valid phone number";
    }

    // ✅ Subject
    if (state.subject.trim().isEmpty) {
      subjectError = "Subject is required";
    }

    // ✅ Message
    if (state.message.trim().isEmpty) {
      messageError = "Message is required";
    }

    // ❌ If any validation fails
    if (nameError != null ||
        emailError != null ||
        phoneError != null ||
        subjectError != null ||
        messageError != null) {
      emit(
        state.copyWith(
          nameError: nameError,
          emailError: emailError,
          phoneError: phoneError,
          subjectError: subjectError,
          messageError: messageError,
          isFailure: true,
        ),
      );
      return;
    }

    // ✅ If everything passes
    emit(
      state.copyWith(isSubmitting: true, isFailure: false, isSuccess: false),
    );

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isSubmitting: false, isSuccess: true));
  }
}
