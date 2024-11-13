final class PongResponseModel {
  final bool isPong;
  PongResponseModel({
    required this.isPong,
  });


  factory PongResponseModel.fromString(String string) {
    return PongResponseModel(
      isPong: string == 'pong',
    );
  }

  @override
  String toString() => 'PongResponseModel(isPong: $isPong)';

}
