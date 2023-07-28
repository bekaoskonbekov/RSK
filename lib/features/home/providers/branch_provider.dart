import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rsk1/features/home/models/branch_model.dart';
import 'package:rsk1/features/home/services/branch_service.dart';

final branchesProvider = FutureProvider<List<BrancheModel>>((ref) {
  return ref.watch(brancheProviderRepository).getAllBranches();
});