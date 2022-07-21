import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
    BookingModel({
        required this.checkin,
        required this.checkout,
        required this.bookId,
        required this.numGuest,
        required this.phone,
        required this.bookStatus,
        required this.bookValue,
        required this.host,
        required this.profileName,
        required this.propertyUnit,
        required this.listName,
    });

    String checkin;
    String checkout;
    String bookId;
    int numGuest;
    String phone;
    int bookStatus;
    String bookValue;
    String host;
    String profileName;
    String propertyUnit;
    String listName;

    factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        checkin: json["checkin"],
        checkout: json["checkout"],
        bookId: json["book_id"],
        numGuest: json["num_guest"],
        phone: json["phone"],
        bookStatus: json["book_status"],
        bookValue: json["book_value"],
        host: json["host"],
        profileName: json["profile_name"],
        propertyUnit: json["property_unit"],
        listName: json["list_name"],
    );

    Map<String, dynamic> toJson() => {
        "checkin": checkin,
        "checkout": checkout,
        "book_id": bookId,
        "num_guest": numGuest,
        "phone": phone,
        "book_status": bookStatus,
        "book_value": bookValue,
        "host": host,
        "profile_name": profileName,
        "property_unit": propertyUnit,
        "list_name": listName,
    };
}
