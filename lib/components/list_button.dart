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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            image,
            //style: MpokSitiTheme.caption
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
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
                  style: const TextStyle(
                    fontSize: 16,
                  ),
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