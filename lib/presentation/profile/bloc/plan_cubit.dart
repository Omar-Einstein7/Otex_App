import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:optex_app/core/error/faliure.dart';
import 'package:optex_app/di.dart';
import 'package:optex_app/domain/profile/entities/plan.dart';
import 'package:optex_app/domain/profile/usecases/select_plan_usecase.dart';


part 'plan_state.dart';

class PlanCubit extends Cubit<PlanState> {


  PlanCubit()
      : super(PlanInitial(selectedPlanIndex: 1, plans: const []));

  Future<void> loadPlans() async {
    emit(PlanLoading());
    final Either<Failure, List<Plan>> result =
        await sl<GetPlansUseCase>().call();
    result.fold(
      (failure) => emit(PlanError(failure.message)),
      (plans) => emit(PlanLoaded(selectedPlanIndex: 1, plans: plans)),
    );
  }

  void selectPlan(int index) {
    if (state is PlanLoaded) {
      final loaded = state as PlanLoaded;
      emit(PlanLoaded(selectedPlanIndex: index, plans: loaded.plans));
    }
  }
}
