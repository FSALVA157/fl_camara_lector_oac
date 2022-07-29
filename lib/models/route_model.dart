import 'package:flutter/material.dart';

class RouteModel{
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  RouteModel({
    required this.route,
    required this.icon,
    required this.name,
    required this.screen,
  });

}