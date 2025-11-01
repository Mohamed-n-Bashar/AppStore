import 'package:flutter/material.dart';

  const String appFourName = "Saror Rental App";
  const String appFourSize = "15 MB";
  const String appFourLogo = "assets/images/logo.jpg";
  const String appFourURL = "https://drive.google.com/uc?export=download&id=1TahkjXS5DqyMGZB99aMKpi9jNJFNqavR";
  const String? IOS_appFourURL = null;     // This value can be left
  const String appFourDescription = "Car Rental Manager is your complete car rental management system. "
    "Handle bookings, contracts, clients, cars, and financials — all in one app. "
    "Available in Arabic, French, and English 🌍\n"
    "Automate your agency's workflow, track revenue, manage expenses, and print real rental contracts in PDF format.";

  final List<String> appFourImages = [
    'assets/images/FourthApp/1.png',
    'assets/images/FourthApp/2.png',
    'assets/images/FourthApp/3.png',
    'assets/images/FourthApp/4.png',
    'assets/images/FourthApp/5.png',
    'assets/images/FourthApp/6.png',
    'assets/images/FourthApp/7.png',
    'assets/images/FourthApp/8.png',
    'assets/images/FourthApp/9.png',
    'assets/images/FourthApp/10.png',
    'assets/images/FourthApp/11.png',
  ];

  final List<Map<String, dynamic>> appFourFeatures = [
  {
    "icon": Icons.directions_car,
    "title": "Car & Client Management",
    "description": "Add, edit, and organize cars and clients with full details and rental history."
  },
  {
    "icon": Icons.calendar_today,
    "title": "Smart Booking Workflow",
    "description": "Manage future bookings, active rentals, and returns — each with real PDF contracts."
  },
  {
    "icon": Icons.picture_as_pdf,
    "title": "Contracts & Printing",
    "description": "Generate, print, and save real rental, booking, and return contracts as PDFs."
  },
  {
    "icon": Icons.backup,
    "title": "Backup & Restore",
    "description": "Secure your data with easy local backup and restore functionality."
  },
  {
    "icon": Icons.attach_money,
    "title": "Expenses Management",
    "description": "Record and track all agency expenses in one organized place."
  },
  {
    "icon": Icons.analytics,
    "title": "Reports & Charts",
    "description": "Get detailed reports for cars, clients, rentals, and expenses with clear visual charts."
  },
  {
    "icon": Icons.insights,
    "title": "Revenue Analytics",
    "description": "View revenue, expenses, and guarantees for current and past months with interactive charts."
  },
  {
    "icon": Icons.account_balance_wallet,
    "title": "Cashbox & Transactions",
    "description": "Track cash, checks, bank transfers, guarantees, and full daily transaction history."
  },
  {
    "icon": Icons.language,
    "title": "Multilingual Interface",
    "description": "Available in Arabic, French , and English for flexible use."
  },
];