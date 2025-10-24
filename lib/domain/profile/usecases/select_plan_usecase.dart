import 'package:dartz/dartz.dart';
import 'package:optex_app/core/error/faliure.dart';
import 'package:optex_app/core/usecases/usecase.dart';
import 'package:optex_app/di.dart';
import 'package:optex_app/domain/profile/entities/plan.dart';
import 'package:optex_app/domain/profile/repo/plan_repo.dart';



class GetPlansUseCase  extends Usecase<Either, dynamic> {

   @override
  Future<Either<Failure, List<Plan>>> call({params}) async {
    return await sl<PlanRepository>().getPlans();
  }
}