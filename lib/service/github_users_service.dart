import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hubb/models/github_users.dart';

class LoadGitUsers{
  static Future<String> loadGithubUsers() async{
      return await rootBundle.loadString('json/user.json');
  }


}