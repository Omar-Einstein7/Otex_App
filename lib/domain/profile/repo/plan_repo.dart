import 'package:dartz/dartz.dart';
import 'package:optex_app/core/error/faliure.dart';

import '../entities/plan.dart';

abstract class PlanRepository {
  Future<Either<Failure, List<Plan>>> getPlans();
}
