import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
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
    final isDesktop = context.isDesktop;

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
                      state.name,
                      cubit.updateName,
                      errorText: state.nameError,
                      context,
                    ),
                  ),
                  SizedBox(width: isDesktop ? AppSizes.d20.w : AppSizes.d10.w),
                  Expanded(
                    child: _buildTextField(
                      "Your Email",
                      state.email,
                      cubit.updateEmail,
                      errorText: state.emailError,
                      context,
                    ),
                  ),
                ],
              ),
              SizedBox(height: isDesktop ? AppSizes.d20.h : AppSizes.d10.h),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      "Phone Number",
                      state.phone,
                      cubit.updatePhone,
                      context,
                    ),
                  ),
                  SizedBox(width: isDesktop ? AppSizes.d20.w : AppSizes.d10.w),
                  Expanded(
                    child: _buildTextField(
                      "Subject",
                      state.subject,
                      cubit.updateSubject,
                      errorText: state.subjectError,
                      context,
                    ),
                  ),
                ],
              ),
              SizedBox(height: isDesktop ? AppSizes.d20.h : AppSizes.d10.h),
              _buildTextField(
                "Message",
                state.message,
                cubit.updateMessage,
                maxLines: 5,
                errorText: state.messageError,
                context,
              ),
              SizedBox(height: isDesktop ? AppSizes.d30.h : AppSizes.d15.h),
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: isDesktop ? AppSizes.d180.w : AppSizes.d90.w,
                  height: isDesktop ? AppSizes.d50.h : AppSizes.d40.h,
                  child: ElevatedButton(
                    onPressed: state.isSubmitting ? null : cubit.submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          isDesktop ? 8.r : 4.r,
                        ),
                      ),
                    ),
                    child: state.isSubmitting
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Submit",
                            style: theme.labelLarge?.copyWith(
                              fontSize: isDesktop
                                  ? AppSizes.d16.sp
                                  : AppSizes.d12.sp,
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
    Function(String) onChanged,
    BuildContext context, {
    int maxLines = 1,
    String? errorText,
  }) {
    final isDesktop = context.isDesktop;
    return TextField(
      onChanged: onChanged,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: isDesktop ? AppSizes.d16.sp : AppSizes.d12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        labelStyle: TextStyle(
          // 👈 label size
          fontSize: isDesktop ? AppSizes.d14.sp : AppSizes.d10.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        hintStyle: TextStyle(
          // 👈 hint size
          fontSize: isDesktop ? AppSizes.d14.sp : AppSizes.d10.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary.withValues(alpha: 0.6),
        ),
        errorStyle: TextStyle(
          // 👈 error size
          fontSize: isDesktop ? AppSizes.d12.sp : AppSizes.d10.sp,
          color: Colors.red,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        contentPadding: EdgeInsets.symmetric(
          horizontal: isDesktop ? AppSizes.d16.w : AppSizes.d12.w,
          vertical: AppSizes.d12.h,
        ),
      ),
    );
  }
}
