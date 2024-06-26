import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unitools/controllers/regestration_cubit/regestration_cubit.dart';
import 'package:unitools/core/common/widgets/horizontal_space.dart';
import 'package:unitools/core/common/widgets/vertical_space.dart';
import 'package:unitools/widgets/create_account_elevated_button.dart';
import 'package:unitools/widgets/sign_up_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _enableBtn = false;
  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      RegestragionCubit.get(context).regester(
        firstName: RegestragionCubit.get(context).firstName!,
        lastName: RegestragionCubit.get(context).lastName!,
        email: RegestragionCubit.get(context).email!,
        password: RegestragionCubit.get(context).password!,
        confirmPassword: RegestragionCubit.get(context).confirmPassword!,
        uinversity: RegestragionCubit.get(context).university!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        onChanged: () => setState(() {
          _enableBtn = _formKey.currentState!.validate();
        }),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SignUpTextFormField(
                      hintText: 'First Name',
                      onChanged: (value) {
                        RegestragionCubit.get(context).firstName = value;
                      },
                    ),
                  ),
                  const HorizontalSpace(
                    space: 16,
                  ),
                  Expanded(
                    child: SignUpTextFormField(
                      hintText: 'Last Name',
                      onChanged: (value) {
                        RegestragionCubit.get(context).lastName = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpace(
              space: 20,
            ),
            SignUpTextFormField(
              hintText: 'Email',
              onChanged: (value) {
                RegestragionCubit.get(context).email = value;
              },
            ),
            const VerticalSpace(
              space: 20,
            ),
            SignUpTextFormField(
              hintText: 'Password',
              onChanged: (value) {
                RegestragionCubit.get(context).password = value;
              },
            ),
            const VerticalSpace(
              space: 20,
            ),
            SignUpTextFormField(
              hintText: 'Confirm Password',
              onChanged: (value) {
                RegestragionCubit.get(context).confirmPassword = value;
              },
            ),
            const VerticalSpace(
              space: 20,
            ),
            SignUpTextFormField(
              hintText: 'University',
              onChanged: (value) {
                RegestragionCubit.get(context).university = value;
              },
            ),
            const VerticalSpace(
              space: 20,
            ),
            CreateAccountElevatedButton(
              onPressed: _enableBtn
                  ? () {
                      _submitForm(context);
                    }
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
