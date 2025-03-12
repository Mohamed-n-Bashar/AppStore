import 'package:flutter/material.dart';

  const String appName = "LinKat";
  const String appSize = "21 MB";
  const String appLogo = "assets/images/LinKat_LOGO.png";
  const String appURL = "https://drive.google.com/uc?export=download&id=1msMXPvgevddYl3uSTcoWYRRA86BtwTSn";
  const String? IOS_appURL = null;     // This value can be left
  const String appDescription = "LinKat is your ultimate smart link organizer, designed to store, categorize, and manage all your important links in one place. \nNo more messy notes or lost URLs! 📌";

  const List<String> appImages = [
    'assets/images/firstApp/screen33.png',
    'assets/images/firstApp/screen22.png',
    'assets/images/firstApp/screen11.png',
  ];

  const List<Map<String, dynamic>> appFeatures = [
    {
      "title": "Organize Your Way 🎯",
      "description": "Arrange your groups however you like, with complete flexibility.",
      "icon": Icons.sort
    },
    {
      "title": "Smart Grouping 🗂️",
      "description": "Store links in well-structured groups for easy access.",
      "icon": Icons.folder_open
    },
    {
      "title": "Instant Copy & Share 🔗",
      "description": "Quickly copy individual links or entire groups in a clean format.",
      "icon": Icons.content_copy
    },
    {
      "title": "Bulk Link Addition 📋",
      "description": "Paste a text containing multiple links, and LinKat will extract and save them instantly—no manual input needed!",
      "icon": Icons.playlist_add
    },
    {
      "title": "Multi-Language Support 🌍",
      "description": "Supports 8 languages, making it accessible worldwide.",
      "icon": Icons.language
    },
    {
      "title": "Fast & Lightweight ⚡",
      "description": "A smooth experience with a minimalist design.",
      "icon": Icons.speed
    },
  ];

  // Messages which appear when iOS version is not supported
  final messages = [
  "🚧 iOS version is still loading... Please wait... forever! 😆",
  "🍏 iOS version is coming... Just like that message you left on ‘Seen’! 😂",
  "⏳ Patience is key! iOS version is coming... one day... maybe! 🤣",
  "🤖 We asked Siri about the iOS version... She said ‘Ask me later’! 😜",
  "🚀 This button does not work today... and probably not tomorrow either! 😆",
  "🏖️ This button is on vacation... indefinitely! 😂"
  ];