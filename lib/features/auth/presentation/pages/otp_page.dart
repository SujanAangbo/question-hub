import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:question_hub/features/auth/presentation/providers/otp_provider.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';
import 'package:question_hub/utils/ui/primary_button.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../widgets/auth_arrow_back_button.dart';

@RoutePage()
class OtpPage extends ConsumerStatefulWidget {
  const OtpPage({super.key, required this.email, required this.name});

  final String email;
  final String name;

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  final otpController = TextEditingController();

  verifyOtp() {
    final otp = otpController.text.trim();
    ref
        .read(otpProvider.notifier)
        .verifyOtp(
          context: context,
          name: widget.name,
          otp: otp,
          email: widget.email,
        );
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(otpProvider);

    return FocusScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AuthArrowBackButton(),
                8.widthBox,
                Center(
                  child: Text(
                    "Verify your email address",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                "We sent you a 4 digit code to verify your email address "
                "(${widget.email}). \nEnter in the field below.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            16.heightBox,
            Center(
              child: Pinput(
                controller: otpController,
                length: 6,
                onCompleted: (value) {
                  verifyOtp();
                },
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  textStyle: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            32.heightBox,
            PrimaryButton(
              onTap: verifyOtp,
              isLoading: state.isLoading,
              text: 'Verify Otp'.toUpperCase(),
            ),
            32.heightBox,
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Didn't get the code? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: 'Resend',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
            8.heightBox,
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Expire in ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: '00:11',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
