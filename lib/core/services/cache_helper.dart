import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:posts_app/data/posts/post.dart';
import 'package:posts_app/data/profile/profile_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static const String _postsCacheKey = 'C-A-C-H-E-D_P-O-S-T-S_F-E-E-D';
  static const String _profileInfoCacheKey = 'C-A-C-H-E-D_P-R-O-F-I-L-E_I-N-F-O';

  static Future<void> savePostsToCache(List<Post> posts) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final List<Map<String, dynamic>> jsonList = posts.map((post) => post.toJson()).toList();
      final String jsonString = jsonEncode(jsonList);

      await prefs.setString(_postsCacheKey, jsonString);
    } catch (e) {
      debugPrint('Error writing to Cache: $e');
    }
  }

  static Future<List<Post>> getPostsFromCache() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? cachedString = prefs.getString(_postsCacheKey);

      if (cachedString != null) {
        final List<dynamic> decodedJson = jsonDecode(cachedString) as List;

        return decodedJson.map((item) => Post.fromJson(item as Map<String, dynamic>)).toList();
      }
    } catch (e) {
      debugPrint('Error Reading Posts from Cache: $e');
    }
    return [];
  }

  static Future<void> saveProfileInfoToCache(ProfileResponseModel profileResponse, String userId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String jsonString = jsonEncode(profileResponse.toJson());

      await prefs.setString('$_profileInfoCacheKey$userId', jsonString);
    } catch (e) {
      debugPrint('Error writing Profile info to Cache: $e');
    }
  }

  static Future<ProfileResponseModel?> getProfileInfoFromCache(String userId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? cachedString = prefs.getString('$_profileInfoCacheKey$userId');

      if (cachedString != null) {
        final Map<String, dynamic> decodedJson = jsonDecode(cachedString) as Map<String, dynamic>;

        return ProfileResponseModel.fromJson(decodedJson);
      }
    } catch (e) {
      debugPrint('Error reading profile Info from Cache: $e');
    }
    return null;
  }
}