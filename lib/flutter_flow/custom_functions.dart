import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int sumarSubTotal(
  int valorSubtotal,
  int precio,
) {
  valorSubtotal = valorSubtotal + precio;
  return valorSubtotal;
}

int restarSubtotal(
  int valorSubtotal,
  int precio,
) {
  if (valorSubtotal > 0) {
    valorSubtotal = valorSubtotal - precio;
  }
  return valorSubtotal;
}

int totalList(List<int> subTotal) {
  double total = 0;
  for (int add in subTotal) {
    total += add;
  }
  total = (total * 100.0) /
      100.0; // Not sure why you're doing this, but I kept it as it was in your original code
  return total.toInt();
}

int calcularSubtotal(
  int precio,
  int cantidad,
) {
  if (precio < 0 || cantidad < 0) {
    return 0;
  }
  return precio * cantidad;
}

bool showSearchResultCopy(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

int? restarCantidad(int cantidad) {
  int? resultado = cantidad;
  if (cantidad > 1) {
    resultado = cantidad - 1;
  }
  return resultado;
}

int? sumarPrecios(
  List<int> precios,
  List<DateTime> fecha,
) {
  if (fecha.length == precios.length &&
      fecha.last.day == DateTime.now().day &&
      fecha.last.month == DateTime.now().month &&
      fecha.last.year == DateTime.now().year) {
    int total = 0;
    for (int add in precios) {
      total += add;
    }
    return total;
  }
}

bool showSearchResult(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

DateTime compareDay() {
  DateTime now = DateTime.now();
  DateTime midnight = DateTime(now.year, now.month, now.day);
  return midnight;
}
