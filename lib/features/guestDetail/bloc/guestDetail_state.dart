part of 'guestDetail_bloc.dart';

enum GuestDetailStatus { initial, success, failure, loading }

class GuestDetailState extends Equatable {
  const GuestDetailState({
    this.status = GuestDetailStatus.initial,
    //this.guest = GuestModel.empty,
    this.guestDetail = GuestDetailModel.empty
  });

  final GuestDetailStatus status;
  //final GuestModel guest;
  final GuestDetailModel guestDetail;

  GuestDetailState copyWith({
    GuestDetailStatus? status,
    GuestModel? guest,
    GuestDetailModel? guestDetail,
  }) {
    return GuestDetailState(
      status: status ?? this.status,
      //guest: guest ?? this.guest,
      guestDetail: guestDetail ?? this.guestDetail,
    );
  }

  @override
  String toString() {
    return '''GuestState { status: $status, guestDetail: $guestDetail''';
  }

  @override
  List<Object> get props => [status, guestDetail];
}