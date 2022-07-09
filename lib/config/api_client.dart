import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../modals/modals.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final _client = http.Client();
  final String _userUrl = 'https://jsonplaceholder.typicode.com/users';
  final String _postUrl = 'https://jsonplaceholder.typicode.com/posts';
  final String _albumUrl = 'https://jsonplaceholder.typicode.com/albums';
  final String _commentUrl = 'https://jsonplaceholder.typicode.com/comments';
  final String _photoUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<bool> internetChecker() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
    } else {}
    return result;
  }

  Future<List<User>> getUser() async {
    var userBox = await Hive.openBox<String>('user_api_cash');
    final userCash = userBox.get('user_api_data', defaultValue: null);

    if (userCash != null) {
      final request = await jsonDecode(userCash) as List;
      final usersC = request.map((json) => User.fromJson(json)).toList();
      userBox.close();

      return usersC;
    } else if (userCash == null) {
      final response = await _client.get(Uri.parse(_userUrl));
      final data = response.body;
      final request = await jsonDecode(data) as List;

      final users = request.map((json) => User.fromJson(json)).toList();
      await userBox.clear();
      await userBox.put('user_api_data', data);
      userBox.close();

      return users;
    } else {
      List<User> userError = [];
      return userError;
    }
  }

  Future<List<Post>> getPost() async {
    var postBox = await Hive.openBox<String>('post_api_cash');
    final postCash = postBox.get('post_api_data', defaultValue: null);

    if (postCash != null) {
      final request = await jsonDecode(postCash) as List;
      final postC = request.map((json) => Post.fromJson(json)).toList();
      postBox.close();
      return postC;
    } else if (postCash == null) {
      final response = await _client.get(Uri.parse(_postUrl));
      final data = response.body;
      final request = await jsonDecode(data) as List;
      final posts = request.map((json) => Post.fromJson(json)).toList();
      await postBox.clear();
      await postBox.put('post_api_data', data);
      postBox.close();

      return posts;
    } else {
      throw ErrorDescription('message');
    }
  }

  Future<List<Album>> getAlbum() async {
    var albumBox = await Hive.openBox<String>('album_api_cash');
    final albumCash = albumBox.get('album_api_data', defaultValue: null);
    if (albumCash != null) {
      final request = await jsonDecode(albumCash) as List;
      final albumC = request.map((json) => Album.fromJson(json)).toList();
      albumBox.close();
      return albumC;
    } else if (albumCash == null) {
      final response = await _client.get(Uri.parse(_albumUrl));
      final data = response.body;
      final request = await jsonDecode(data) as List;
      final albums = request.map((json) => Album.fromJson(json)).toList();
      await albumBox.clear();
      await albumBox.put('album_api_data', data);
      albumBox.close();

      return albums;
    } else {
      throw ErrorDescription('message');
    }
  }

  Future<List<Photo>> getPhoto() async {
    var photoBox = await Hive.openBox<String>('photo_api_cash');
    final photoCash = photoBox.get('photo_api_data', defaultValue: null);
    if (photoCash != null) {
      final request = await jsonDecode(photoCash) as List;
      final photoC = request.map((json) => Photo.fromJson(json)).toList();
      photoBox.close();

      return photoC;
    } else if (photoCash == null) {
      final response = await _client.get(Uri.parse(_photoUrl));
      final data = response.body;
      final request = await jsonDecode(data) as List;
      final photos = request.map((json) => Photo.fromJson(json)).toList();
      await photoBox.clear();
      await photoBox.put('photo_api_data', data);
      photoBox.close();

      return photos;
    } else {
      throw ErrorDescription('message');
    }
  }

  Future<List<Comment>> getComment() async {
    var commentBox = await Hive.openBox<String>('comment_api_cash');
    final commentCash = commentBox.get('comment_api_data', defaultValue: null);
    if (commentCash != null) {
      final request = await jsonDecode(commentCash) as List;
      final commentC = request.map((json) => Comment.fromJson(json)).toList();
      commentBox.close();
      return commentC;
    } else if (commentCash == null) {
      final response = await _client.get(Uri.parse(_commentUrl));
      final data = response.body;
      final request = await jsonDecode(data) as List;
      final comments = request.map((json) => Comment.fromJson(json)).toList();
      await commentBox.clear();
      await commentBox.put('comment_api_data', data);
      commentBox.close();

      return comments;
    } else {
      throw ErrorDescription('message');
    }
  }

  Future<void> postComment({
    required String name,
    required String email,
    required String body,
    required int postId,
  }) async {
    var bobyJson = {
      "name": name,
      "email": email,
      "body": body,
      "postId": postId,
    };
    var head = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    };
    final response = await _client.post(
      Uri.parse(_commentUrl),
      headers: head,
      body: jsonEncode((bobyJson)),
    );

    if (response.statusCode == 201) {
      return;
    } else {
      throw ErrorDescription('message');
    }
  }
}
