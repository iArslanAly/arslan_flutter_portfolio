// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ContactFormState extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String subject;
  final String message;

  final String? nameError;
  final String? emailError;
  final String? phoneError;
  final String? subjectError;
  final String? messageError;

  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const ContactFormState({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.subject = '',
    this.message = '',
    this.nameError,
    this.emailError,
    this.phoneError,
    this.messageError,
    this.subjectError,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  ContactFormState copyWith({
    String? name,
    String? email,
    String? phone,
    String? subject,
    String? message,
    String? nameError,
    String? emailError,
    String? phoneError,
    String? subjectError,
    String? messageError,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return ContactFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      nameError: nameError ?? this.nameError,
      emailError: emailError ?? this.emailError,
      phoneError: phoneError ?? this.phoneError,
      subjectError: subjectError ?? this.subjectError,
      messageError: messageError ?? this.messageError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object?> get props => [
    name,
    email,
    phone,
    subject,
    message,
    nameError,
    emailError,
    phoneError,
    messageError,
    subjectError,
    isSubmitting,
    isSuccess,
    isFailure,
  ];
}
