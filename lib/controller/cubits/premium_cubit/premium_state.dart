part of 'premium_cubit.dart';

@immutable
sealed class PremiumState {}

class PremiumInitial extends PremiumState {}

// class PremiumLoading extends PremiumState {}

class PremiumOptionsLoading extends PremiumState {}

class PremiumOptionsLoaded extends PremiumState {
  final List<ProductDetails> productDetails;

  PremiumOptionsLoaded({required this.productDetails});
}
// class PremiumActive extends PremiumState {}
//
// class PremiumInactive extends PremiumState {}

class PremiumError extends PremiumState {
  final String message;

  PremiumError(this.message);
}
