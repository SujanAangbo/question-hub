import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'k_toast.dart';

class ToastService {
  const ToastService._();

  static ToastFuture s(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.success, duration: duration);

  static ToastFuture e(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.error, duration: duration);

  static ToastFuture w(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.warning, duration: duration);

  static ToastFuture i(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.info, duration: duration);

  static ToastFuture show(
    String message, {
    required ToastVariant variant,
    Duration? duration,
  }) {
    return showToastWidget(
      KToast(variant: variant, message: message),
      duration: duration ?? const Duration(seconds: 3),
      position: ToastPosition.bottom,
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}

class ToastServiceTop {
  ToastFuture s(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.success, duration: duration);

  ToastFuture e(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.error, duration: duration);

  ToastFuture w(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.warning, duration: duration);

  ToastFuture i(String message, {Duration? duration}) =>
      show(message, variant: ToastVariant.info, duration: duration);

  ToastFuture show(
    String message, {
    required ToastVariant variant,
    Duration? duration,
  }) {
    return showToastWidget(
      KToast(message: message, variant: variant),
      position: ToastPosition.top,
      animationCurve: Curves.easeIn,
      dismissOtherToast: true,
      duration: duration,
    );
  }
}
