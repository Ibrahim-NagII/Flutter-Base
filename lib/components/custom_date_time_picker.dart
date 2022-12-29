import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/components/custom_images.dart';
import 'package:flutter_base/core/app_core.dart';
import 'package:flutter_base/core/app_notification.dart';
import 'package:flutter_base/components/confirm_bottom_sheet.dart';
import 'package:flutter_base/helpers/media_query_helper.dart';
import 'package:flutter_base/main_blocs/main_app_bloc.dart';
import 'package:flutter_base/navigation/custom_navigation.dart';
import 'package:intl/intl.dart';
import 'package:flutter_base/helpers/styles.dart';
import 'package:flutter_base/helpers/text_helper.dart';
import 'package:flutter_base/helpers/translation/all_translation.dart';

import '../helpers/text_styles.dart';

class SelectDate extends StatelessWidget {
  final Stream<DateTime?>? dateStream;
  final DateTime? startDate;
  final Function? updateDateStart;
  final Function? updateDateEnd;
  final Function? updateSearch;
  final bool? isStart;

  const SelectDate({
    Key? key,
    this.dateStream,
    this.updateDateStart,
    this.updateDateEnd,
    this.updateSearch,
    this.isStart = false,
    this.startDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime?>(
        stream: dateStream,
        builder: (context, snapshot) {
          String _date = "";
          if (snapshot.hasData) {
            _date = DateFormat(Constants.DATE_FORMAT).format(snapshot.data!);
          } else {
            _date = isStart!
                ? allTranslations.text('start_date')
                : allTranslations.text('end_date');
          }
          return InkWell(
            onTap: () async {
              try {
                DateTime? date = snapshot.data ?? DateTime.now();
                if (isStart! || startDate != null) {
                  CustomBottomSheet.show(
                      label: 'Select Date',
                      height: 360,
                      onConfirm: () {
                        if (date != null) {
                          if (isStart!) {
                            updateDateStart!(date);
                            // updateDateEnd!(date);
                          } else {
                            log('Select End Date');
                            updateDateEnd!(date);
                          }
                          updateSearch!(true);
                          CustomNavigator.pop();
                        }
                      },
                      list: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) {
                          date = value;
                        },
                        initialDateTime: snapshot.data ?? DateTime.now(),
                        minimumDate: startDate ?? DateTime(2010),
                        maximumDate: DateTime.now().add(Duration(days: 365)),
                      ));
                } else {
                  AppCore.showSnackBar(notification: AppNotification(
                      message: 'Please enter start date first'));
                }
              } catch (e) {
                print(e);
                updateDateEnd!(startDate);
                AppCore.showSnackBar(notification: AppNotification(
                    message: "It is not failed chosen values must end data greater than or equal to minimumDate"));
              }

              // showCupertinoModalPopup(
              //     context: context,
              //     builder: (_) {
              //       return CupertinoActionSheet(
              //         actions: [
              //           SizedBox(
              //             height: 300,
              //             child: CupertinoDatePicker(
              //               mode: CupertinoDatePickerMode.date,
              //               onDateTimeChanged: (value) {
              //                 date = value;
              //               },
              //               initialDateTime: snapshot.data ?? DateTime.now(),
              //               minimumDate: startDate ?? DateTime(2010),
              //               maximumDate: DateTime(2100),
              //             ),
              //           )
              //         ],
              //         cancelButton: CupertinoActionSheetAction(onPressed: () {
              //           if (date != null) {
              //             if (isStart!) {
              //               updateDateStart!(date);
              //               updateDateEnd!(date);
              //             } else {
              //               updateDateEnd!(date);
              //             }
              //             updateSearch!(true);
              //             CustomNavigator.pop();
              //           }
              //
              //         },child: Text("Done"),),
              //       );
              //     });

              // DateTime? date = await showDatePicker(
              //     context: context,
              //     initialDate: snapshot.data ?? DateTime.now(),
              //     firstDate:  startDate ?? DateTime(2010),
              //     lastDate: DateTime(2100));
            },
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     customImageIconSVG(imageName: "calendar"),
            //     SizedBox(width: 8),
            //     Text(
            //       _date,
            //       style: AppTextStyles.w600.copyWith(
            //           fontSize: 13,
            //           color: Styles.SUB_HEADER,
            //           fontFamily: "text"),
            //     )
            //   ],
            // ),
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Styles.FILL_COLOR,
                border: Border.all(
                    color: Styles.LIGHT_GREY_BORDER, width: 1),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Center(
                      child: Text(
                        _date,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Styles.SUB_HEADER),
                        overflow: TextOverflow.ellipsis,
                      ))),
            ),
          );
        });
  }
}

class CustomSelectDate extends StatefulWidget {
  final String? initialString;
  final bool? isNotEmptyValue;
  final bool? showOnly;
  final DateTime? startDateTime ;
  final ValueChanged<DateTime>? valueChanged;

  const CustomSelectDate({
    Key? key,
    this.initialString,
    required this.valueChanged, this.isNotEmptyValue = false, this.showOnly = false, this.startDateTime ,
  }) : super(key: key);

  @override
  State<CustomSelectDate> createState() => _CustomSelectDateState();
}

class _CustomSelectDateState extends State<CustomSelectDate> {
  String _date = "";
  DateTime? date;

  @override
  void initState() {
    _date = widget.initialString ?? allTranslations.text("select_date");
    print(widget.initialString!);
    if(widget.isNotEmptyValue!){
        date = DateTime.parse(widget.initialString!);
    }


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if(!widget.showOnly!){
          print(date);
          CustomBottomSheet.show(
              label: allTranslations.text('select_date'),
              height: 360,
              onConfirm: () {
                if (date != null) {
                  setState(() =>
                  _date = DateFormat(Constants.DATE_FORMAT).format(date!));
                  widget.valueChanged!(date!);
                  CustomNavigator.pop();
                }else{
                  setState(() =>
                  _date = DateFormat(Constants.DATE_FORMAT).format(DateTime.now()));
                  widget.valueChanged!(DateTime.now());
                  CustomNavigator.pop();
                }
              },
              list: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  date = value;
                },
                initialDateTime: date ?? widget.startDateTime ?? DateTime.now(),
                minimumDate: widget.startDateTime !=null?DateTime(widget.startDateTime!.year,widget.startDateTime!.month,widget.startDateTime!.day) :DateTime(1900),
                maximumDate: DateTime(2100),
              ));
        }
        FocusScope.of(context).requestFocus(FocusNode());

      },
      child: Container(
        width: MediaQueryHelper.width,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color: Styles.FIELD_BORDER,
            border: Border.all(
                color: Styles.FIELD_BORDER),
            // border: Border.all(
            //     color:
            //         date != null ? Styles.PRIMARY_COLOR : Styles.FIELD_BORDER),
            borderRadius: BorderRadius.circular(10.0)),
        height: widget.isNotEmptyValue! ? 69 : date != null ? 69 :58,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _date,
                    style: TextStyle(
                        fontSize: widget.isNotEmptyValue! ? 10 : date != null ? 10 : 12,
                        fontFamily: widget.isNotEmptyValue! ? "text" : date != null ? "text" :  mainAppBloc.lang
                            .valueOrNull,
                        fontWeight:
                        widget.isNotEmptyValue! ? FontWeight.w600 : date != null ? FontWeight.w600 :FontWeight.w600,
                        color: widget.isNotEmptyValue! ? Styles.HEADER : date != null ? Styles.HEADER: Styles.HINT),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                customImageIconSVG(imageName: 'calendar')
              ],
            )),
      ),
    );
  }
}

class DashboardSelectDate extends StatefulWidget {
  final String? initialString;
  final ValueChanged<DateTime>? valueChanged;

  const DashboardSelectDate({
    Key? key,
    this.initialString,
    this.valueChanged,
  }) : super(key: key);

  @override
  State<DashboardSelectDate> createState() => _DashboardSelectDateState();
}

class _DashboardSelectDateState extends State<DashboardSelectDate> {
  String _date = "";
  DateTime? date;

  @override
  void initState() {
    _date = widget.initialString ?? allTranslations.text("select_date");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        date = DateTime.now();
        CustomBottomSheet.show(
            label: allTranslations.text('select_date'),
            height: 360,
            onConfirm: () {
              if (date != null) {
                setState(() =>
                _date = DateFormat(
                    DateFormat.YEAR_MONTH, mainAppBloc.lang.valueOrNull).format(
                    date!));
                widget.valueChanged!(date!);
                CustomNavigator.pop();
              }
            },
            list:
          CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              date = value;
            },
            initialDateTime: date ?? DateTime.now(),
            minimumDate: DateTime(2010),
            maximumDate: DateTime(2100),
          )
        );
      },
      child: Row(
        children: [
          Text(_date,
              style: AppTextStyles.SCREEN_TITLE
                  .copyWith(color: Styles.LIGHT_BLUE, fontSize: 12)),
          SizedBox(
            width: 4,
          ),
          Icon(Icons.arrow_drop_down, color: Styles.WHITE_COLOR)
        ],
      ),
    );
  }
}
