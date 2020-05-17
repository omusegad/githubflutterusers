import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hubb/models/github_users.dart';


class LoadGitUsers {
  static final String _url = "https://api.github.com/search/repositories?q=flutter";
 
  static Future<GithubUsers> getUser() async {
    try {
      Response response = await Dio().get(_url);
      return GithubUsers.fromJson(response.data);
    } catch (e) {
      return (e);
    }
  }

 

}