import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/cubits/contactFormCubit/contact_form_cubit.dart';
import '../../../../core/cubits/contactFormCubit/contact_form_state.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (_) => ContactFormCubit(),
      child: BlocConsumer<ContactFormCubit, ContactFormState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Form submitted ✅")));
          } else if (state.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Please fill required fields ❌")),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ContactFormCubit>();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      "Name",
                      state.name,                      cubit.updateName,
                      errorText: state.nameError,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: _buildTextField(
                      "Your Email",
                      state.email,
                      cubit.updateEmail,
                      errorText: state.emailError,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      "Phone Number",
                      state.phone,
                      cubit.updatePhone,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: _buildTextField(
                      "Subject",
                      state.subject,
                      cubit.updateSubject,
                      errorText: state.subjectError,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              _buildTextField(
                "Message",
                state.message,
                cubit.updateMessage,
                maxLines: 5,
                errorText: state.messageError,
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 180.w,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: state.isSubmitting ? null : cubit.submitForm,
                    child: state.isSubmitting
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Submit",
                            style: theme.labelLarge?.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String value,
    Function(String) onChanged, {
    int maxLines = 1,
    String? errorText,
  }) {
    return TextField(
      onChanged: onChanged,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 16.sp, // 👈 user input text size
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        labelStyle: TextStyle(
          // 👈 label size
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        hintStyle: TextStyle(
          // 👈 hint size
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary.withValues(alpha: 0.6),
        ),
        errorStyle: TextStyle(
          // 👈 error size
          fontSize: 12.sp,
          color: Colors.red,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }
}
