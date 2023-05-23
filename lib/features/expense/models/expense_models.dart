// To parse this JSON data, do
//
//     final expense = expenseFromJson(jsonString);

import 'dart:convert';

Expense expenseFromJson(String str) => Expense.fromJson(json.decode(str));

String expenseToJson(Expense data) => json.encode(data.toJson());

class Expense {
    String? id;
    String? description;
    List<FriendsList>? friendsList;
    String? groupId;
    double? totalExpense;
    String? payer;
    int? v;

    Expense({
        this.id,
        this.description,
        this.friendsList,
        this.groupId,
        this.totalExpense,
        this.payer,
        this.v,
    });

    factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        id: json["_id"],
        description: json["description"],
        friendsList: json["friendsList"] == null ? [] : List<FriendsList>.from(json["friendsList"]!.map((x) => FriendsList.fromJson(x))),
        groupId: json["groupId"],
        totalExpense: json["total_expense"]?.toDouble(),
        payer: json["payer"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "friendsList": friendsList == null ? [] : List<dynamic>.from(friendsList!.map((x) => x.toJson())),
        "groupId": groupId,
        "total_expense": totalExpense,
        "payer": payer,
        "__v": v,
    };
}

class FriendsList {
    String? name;
    String? number;
    double? spend;

    FriendsList({
        this.name,
        this.number,
        this.spend,
    });

    factory FriendsList.fromJson(Map<String, dynamic> json) => FriendsList(
        name: json["name"],
        number: json["number"],
        spend: json["spend"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "number": number,
        "spend": spend,
    };
}
