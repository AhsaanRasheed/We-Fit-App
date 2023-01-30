import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  String? groupIcon;
  String? groupName;
  List? groupMembers;
  Group(this.groupIcon, this.groupName, this.groupMembers);

  Group.fromMap(Map<String, dynamic> map) {
    groupName = map['group_name'];
    groupIcon = map['group_icon'];
    groupMembers = map['group_members'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['group_name'] = groupName;
    map['group_members'] = groupMembers;
    map['group_icon'] = groupIcon;
    map['last_modified'] = FieldValue.serverTimestamp();
    return map;
  }
}

// class OrderableData {
//   final int? time;
//   final List<ResultableData>? values;

//   OrderableData(this.time, this.values);

//   static OrderableData fromMap(Map<String, dynamic> resp) {
//     List<ResultableData>? vals;
//     if (resp['values'] != null) {
//       vals = List<ResultableData>.from(
//           resp['values'].map((item) => ResultableData.fromMap(item)));
//     }
//     return OrderableData(
//         resp['date_time'] as int?, resp['values'] == null ? null : vals);
//   }

//   @override
//   String toString() {
//     String st = "";
//     st += "==== OrderableData ====\n";
//     st += " time: $time \n";
//     st += " Data: $values \n";
//     return st;
//   }
// }

// class ResultableData {
//   final String? name;
//   final num? value;
//   final num? value2;
//   final String? unit;
//   final String? status;
//   final String? statusToDisplay;
//   final String? status2;

//   ResultableData(this.name, this.value, this.unit, this.status, this.value2,
//       this.status2, this.statusToDisplay);

//   static ResultableData fromMap(Map<String, dynamic> resp) {
//     debugPrint('$resp');
//     return ResultableData(
//       resp['name'] as String?,
//       resp['value'] as num?,
//       resp['unit'] as String?,
//       resp['status'] as String?,
//       resp['value2'] as num?,
//       resp['status2'] as String?,
//       resp['status_to_display'] as String?,
//     );
//   }

//   @override
//   String toString() {
//     String st = '';
//     st += '\nDate :: ';
//     st += ' Name: $name -> ';
//     st += ' Value: $value -> ';
//     if (value2 != null) {
//       st += ' Value2: $value2 -> ';
//     }
//     st += ' Unit: $unit -> ';
//     st += ' Status: $status ';
//     if (status2 != null) {
//       st += ' Status: $status2 ';
//     }
//     return st;
//   }
// }