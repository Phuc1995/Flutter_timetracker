// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:time_tracker/app/sign_in/email_sign_in_model.dart';
// import 'package:time_tracker/app/sign_in/validators.dart';
// import 'package:time_tracker/common_widgets/form_submit_button.dart';
// import 'package:time_tracker/common_widgets/platform_alert_dialog.dart';
// import 'package:time_tracker/common_widgets/platform_exception_alert_dialog.dart';
// import 'package:time_tracker/services/auth.dart';
// import 'package:flutter/services.dart';
// import 'dart:io' show Platform;
//
//
//
// class EmailSignInFormStatefull extends StatefulWidget with EmailAndPasswordValidators {
//   @override
//   _EmailSignInFormStatefullState createState() => _EmailSignInFormStatefullState();
// }
//
// class _EmailSignInFormStatefullState extends State<EmailSignInFormStatefull> {
//
//   @override
//   void dispose() {
//     _emailFocusNode.dispose();
//     _passwordController.dispose();
//     _passwordFocusNode.dispose();
//     _emailController.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();
//
//   String get _email => _emailController.text;
//
//   String get _password => _passwordController.text;
//   EmailSignInFormType _formType = EmailSignInFormType.signIn;
//   bool _submitted = false;
//   bool _isLoading = false;
//
//
//
//   void _toggleFormType() {
//     setState(() {
//       _submitted = false;
//       _formType = _formType == EmailSignInFormType.signIn
//           ? EmailSignInFormType.register
//           : EmailSignInFormType.signIn;
//     });
//     _emailController.clear();
//     _passwordController.clear();
//   }
//
//   void _emailEdittingComplete() {
//     final newFocus = widget.emailValidator.isValid(_email)
//         ? _passwordFocusNode
//         : _emailFocusNode;
//     FocusScope.of(context).requestFocus(newFocus);
//   }
//
//   List<Widget> _buildChildren() {
//     final primaryText = _formType == EmailSignInFormType.signIn
//         ? 'Sign In'
//         : 'Create an  account';
//     final secondaryText = _formType == EmailSignInFormType.signIn
//         ? 'Need an account? Register'
//         : 'Have an account?Sign in';
//
//     bool submitEnable = widget.emailValidator.isValid(_email) &&
//         widget.passwordValidator.isValid(_password) &&
//         !_isLoading;
//
//     return [
//       _buildEmailTextFile(),
//       SizedBox(
//         height: 8.0,
//       ),
//       _buildPasswordTextFile(),
//       SizedBox(
//         height: 8.0,
//       ),
//       FormSubmitButton(
//         text: primaryText,
//         onPressed: submitEnable ? _submit : null,
//       ),
//       SizedBox(
//         height: 8.0,
//       ),
//       FlatButton(
//           child: Text(secondaryText),
//           onPressed: !_isLoading ? _toggleFormType : null),
//     ];
//   }
//
//   TextField _buildEmailTextFile() {
//     bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
//     return TextField(
//       controller: _emailController,
//       decoration: InputDecoration(
//         labelText: "Email",
//         hintText: "abc@gmail",
//         errorText: showErrorText ? widget.invalidEmailErrorText : null,
//       ),
//       autocorrect: false,
//       keyboardType: TextInputType.emailAddress,
//       textInputAction: TextInputAction.next,
//       focusNode: _emailFocusNode,
//       onEditingComplete: _emailEdittingComplete,
//       onChanged: (email) => _updateState(),
//       enabled: !_isLoading,
//     );
//   }
//
//   TextField _buildPasswordTextFile() {
//     bool showErrorText =
//         _submitted && !widget.passwordValidator.isValid(_password);
//     return TextField(
//       controller: _passwordController,
//       decoration: InputDecoration(
//           labelText: "Password",
//           errorText: showErrorText ? widget.invalidPasswordErrorText : null),
//       obscureText: true,
//       textInputAction: TextInputAction.done,
//       focusNode: _passwordFocusNode,
//       onEditingComplete: _submit,
//       onChanged: (email) => _updateState(),
//       enabled: !_isLoading,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: _buildChildren(),
//       ),
//     );
//   }
//
//   _updateState() {
//     setState(() {});
//   }
// }
