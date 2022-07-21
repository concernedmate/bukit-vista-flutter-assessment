import 'package:bukit_vista_flutter_assessment/bukitvista-themes.dart';
import 'package:bukit_vista_flutter_assessment/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget GuestButton(String name, String image, String origin, [bool arrow = true]){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 5,
          offset: const Offset(0, 3)
        ),
      ],
    ),
    height: 96,
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    margin: const EdgeInsets.fromLTRB(24, 16, 24, 16),
    alignment: Alignment.topLeft,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            image,
            //style: MpokSitiTheme.caption
          ),
        ),
        SizedBox(width: 16,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: BukitVistaTheme.title,
            ),
            Flexible(
              child: Container(
                width: kResponsiveMaxWidth * 0.2,
                padding: const EdgeInsets.only(right: 0.5),
                child: Text( 
                  origin,
                  overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,
                  style: BukitVistaTheme.body1.copyWith(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
        arrow
        ? Container(
          alignment: Alignment.center,
          width: 64,
          height: 64,
          padding: const EdgeInsets.all(8),
          child: const Icon(FontAwesomeIcons.arrowRight, color: Colors.lightBlue,),
        )
        : Container(),
      ],
    ),
  );
}

Widget BookingButton(String book_id, String property_unit, int status, String checkin, String checkout){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 2
        ),
      ],
    ),
    height: 128,
    padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
    margin: const EdgeInsets.fromLTRB(24, 16, 24, 16),
    alignment: Alignment.topLeft,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            backgroundBlendMode: BlendMode.overlay,
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 2
              ),
            ],
          ),
          child: Icon(Icons.house_outlined, color: Colors.orangeAccent,),
        ),
        SizedBox(width: 16),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(book_id, style: BukitVistaTheme.title,),
              SizedBox(height: 16),
              Text(property_unit, style: BukitVistaTheme.subtitle),
              SizedBox(height: 8),
              Text(checkin+ ' - '+ checkout, style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey))
            ],
          ),
        ),
        Container(
          height: 32,
          width: 128,
          decoration: BoxDecoration(
            color: status == 1
            ? Colors.green
            : status == 2
              ? Colors.red
              : Colors.yellow,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            backgroundBlendMode: BlendMode.overlay,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 2
              ),
            ],
          ),
          child: Center(
            child: Text(status == 1
            ? 'Confirmed'
            : status == 2
              ? 'Canceled'
              : 'Pending',
             style: BukitVistaTheme.body1.copyWith(
              fontWeight: FontWeight.bold,
              color: status == 1
              ? Colors.green
              : status == 2
                ? Colors.red
                : Colors.yellow
              ),
            )
          )
        ),
      ]
    ),
  );
}