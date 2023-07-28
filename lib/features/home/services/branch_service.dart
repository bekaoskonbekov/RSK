import 'dart:convert';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/branch_model.dart';

final brancheProviderRepository = Provider((ref) {
  return BracnhService();
});

class BranchResponce {
  BranchResponce({required this.branchValues, required this.statusCode});
  final BranchResponce branchValues;
  final int statusCode;
}

class BracnhService {
  final String baseUrl = "https://34.28.165.38/ru";

  Future<List<BrancheModel>> getAllBranches() async {
    final response =
        await http.get(Uri.parse('$baseUrl/branch/branches/'), headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List branches = jsonDecode(utf8.decode(response.bodyBytes));
      return branches.map((e) => BrancheModel.fromJson(e)).toList();
    } else {
      throw Exception("Server failre");
    }
  }
}
