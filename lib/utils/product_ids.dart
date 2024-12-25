import 'package:flutter_dotenv/flutter_dotenv.dart';

final weeklyPlan = dotenv.env['WEEKLY_PLAN']??'';
final monthlyPlan = dotenv.env['MONTHLY_PLAN']??'';
final yearlyPlan = dotenv.env['YEARLY_PLAN']??'';
final lifetimePlan = dotenv.env['LIFETIME_PLAN']??'';
Set<String> productIds={
  weeklyPlan,monthlyPlan,yearlyPlan,lifetimePlan,
};