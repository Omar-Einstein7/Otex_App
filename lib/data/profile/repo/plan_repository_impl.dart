import 'package:dartz/dartz.dart';
import 'package:optex_app/core/error/faliure.dart';
import 'package:optex_app/domain/profile/entities/plan.dart';
import 'package:optex_app/domain/profile/repo/plan_repo.dart';

class PlanRepositoryImpl implements PlanRepository {
  @override
  Future<Either<Failure, List<Plan>>> getPlans() async {
    try {
      // Fake local data
      final plans = [
        Plan(
          id: 1,
          name: 'أساسية',
          price: 99,
          features: ['عضوية إعلان 30 يوم'],
        ),
        Plan(
          id: 2,
          name: 'أكسترا',
          price: 199,
          features: [
            'عضوية إعلان 30 يوم',
            'تثبيت في أول القائمة لمدة 7 أيام',
            'تثبيت في الإعلانات المميزة (أسبوع)',
          ],
        ),
        Plan(
          id: 3,
          name: 'بلص',
          price: 299,
          features: [
            'عضوية إعلان 30 يوم',
            'تثبيت في أول القائمة لمدة 7 أيام',
            'ظهور في محافظات مصر',
            'إشعار لجميع المستخدمين',
            'تثبيت في الإعلانات المميزة (أسبوع)',
          ],
        ),
        Plan(
          id: 4,
          name: 'سوبر',
          price: 99,
          features: [
            'عضوية إعلان 30 يوم',
            'تثبيت في أول القائمة لمدة 7 أيام',
            'ظهور في محافظات مصر (أسبوع)',
            'إشعار لجميع المستخدمين',
            'تثبيت في الإعلانات المميزة',
            'تثبيت في الإعلانات المميزة',
            'تثبيت في الإعلانات المميزة',
          ],
        ),
      ];

      return Right(plans);
    } catch (e) {
      return Left(ServerFailure('Failed to load plans'));
    }
  }
}
