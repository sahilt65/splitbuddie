// To parse this JSON data, do
//
//     final expense = expenseFromJson(jsonString);

import 'dart:convert';

Expense expenseFromJson(String str) => Expense.fromJson(json.decode(str));

String expenseToJson(Expense data) => json.encode(data.toJson());

class Expense {
    String? description;
    List<FriendsList>? friendsList;
    String? groupId;
    double? totalExpense;
    String? payer;

    Expense({
        this.description,
        this.friendsList,
        this.groupId,
        this.totalExpense,
        this.payer,
    });

    factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        description: json["description"],
        friendsList: json["friendsList"] == null ? [] : List<FriendsList>.from(json["friendsList"]!.map((x) => FriendsList.fromJson(x))),
        groupId: json["groupId"],
        totalExpense: json["total_expense"],
        payer: json["payer"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "friendsList": friendsList == null ? [] : List<dynamic>.from(friendsList!.map((x) => x.toJson())),
        "groupId": groupId,
        "total_expense": totalExpense,
        "payer": payer,
    };
}

class FriendsList {
    String? name;
    String? number;

    FriendsList({
        this.name,
        this.number,
    });

    factory FriendsList.fromJson(Map<String, dynamic> json) => FriendsList(
        name: json["name"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "number": number,
    };
}
