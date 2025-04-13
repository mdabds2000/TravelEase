// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PopularTruckModel {
  int id;
  String truckName;
  String truckImg;
  bool hearted;
  String pickUpTime;
  String dropTime;
  PopularTruckModel({
    required this.id,
    required this.truckName,
    required this.truckImg,
    required this.hearted,
    required this.pickUpTime,
    required this.dropTime,
  });

  PopularTruckModel copyWith({
    int? id,
    String? truckName,
    String? truckImg,
    bool? hearted,
    String? pickUpTime,
    String? dropTime,
  }) {
    return PopularTruckModel(
      id: id ?? this.id,
      truckName: truckName ?? this.truckName,
      truckImg: truckImg ?? this.truckImg,
      hearted: hearted ?? this.hearted,
      pickUpTime: pickUpTime ?? this.pickUpTime,
      dropTime: dropTime ?? this.dropTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'truckName': truckName,
      'truckImg': truckImg,
      'hearted': hearted,
      'pickUpTime': pickUpTime,
      'dropTime': dropTime,
    };
  }

  factory PopularTruckModel.fromMap(Map<String, dynamic> map) {
    return PopularTruckModel(
      id: map['id'] as int,
      truckName: map['truckName'] as String,
      truckImg: map['truckImg'] as String,
      hearted: map['hearted'] as bool,
      pickUpTime: map['pickUpTime'] as String,
      dropTime: map['dropTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PopularTruckModel.fromJson(String source) =>
      PopularTruckModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PopularTruckModel(id: $id, truckName: $truckName, truckImg: $truckImg, hearted: $hearted, pickUpTime: $pickUpTime, dropTime: $dropTime)';
  }

  @override
  bool operator ==(covariant PopularTruckModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.truckName == truckName &&
        other.truckImg == truckImg &&
        other.hearted == hearted &&
        other.pickUpTime == pickUpTime &&
        other.dropTime == dropTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        truckName.hashCode ^
        truckImg.hashCode ^
        hearted.hashCode ^
        pickUpTime.hashCode ^
        dropTime.hashCode;
  }
}
