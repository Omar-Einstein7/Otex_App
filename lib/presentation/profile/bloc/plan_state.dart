part of 'plan_cubit.dart';

abstract class PlanState {
  const PlanState();
}

class PlanInitial extends PlanState {
  final int selectedPlanIndex;
  final List<Plan> plans;

  const PlanInitial({required this.selectedPlanIndex, required this.plans});
}

class PlanLoading extends PlanState {}

class PlanLoaded extends PlanState {
  final int selectedPlanIndex;
  final List<Plan> plans;

  const PlanLoaded({required this.selectedPlanIndex, required this.plans});
}

class PlanError extends PlanState {
  final String message;
  const PlanError(this.message);
}
