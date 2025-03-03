import 'dart:collection';

import 'package:bividpharma/model/dtos/riengtu/bang_cham_cong.dart';
import 'package:bividpharma/services/riengtu_service.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BangChamCongPage extends StatefulWidget {
  BangChamCongPage({Key? key}) : super(key: key) {
    // load bang cham cong
  }
  final chamCongNgay = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: (key) => key.day * 1000000 + key.month * 10000 + key.year,
  );

  final bangChamCong = LinkedHashMap<DateTime, BangChamCong>(
    equals: isSameDay,
    hashCode: (key) => key.day * 1000000 + key.month * 10000 + key.year,
  );

  @override
  State<BangChamCongPage> createState() => _BangChamCongPageState();
}

class _BangChamCongPageState extends State<BangChamCongPage> {
  final _firstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 12, DateTime.now().day);
  final _lastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 12, DateTime.now().day);

  late final ValueNotifier<List<Event>> _selectedEvents;
  late final ValueNotifier<BangChamCong> _selectedBangChamCong;

  late PageController _pageController;

  bool shadowColor = false;
  double? scrolledUnderElevation;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  double _tongGioCongThucTe = 0;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    _selectedBangChamCong = ValueNotifier(BangChamCong());

    _onLoadData();
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    _selectedBangChamCong.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Bảng Chấm Công"),
          scrolledUnderElevation: scrolledUnderElevation,
          shadowColor:
              shadowColor ? Theme.of(context).colorScheme.shadow : null,
          // elevation: 10,
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  side: BorderSide(color: theme.primaryColor, width: 2.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildCalendar(),
                )),
            const SizedBox(height: 8.0),
            _buildGioCongList(),
            _buildFooter(),
          ],
        )));
  }

  Widget _buildCalendar() {
    final theme = Theme.of(context);
    return TableCalendar(
      firstDay: _firstDay,
      lastDay: _lastDay,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      daysOfWeekVisible: true,
      weekNumbersVisible: false,
      startingDayOfWeek: StartingDayOfWeek.monday,
      weekendDays: const [DateTime.sunday],
      headerStyle: const HeaderStyle(formatButtonVisible: false),
      calendarStyle: CalendarStyle(
          markerDecoration: BoxDecoration(color: theme.primaryColor),
          todayDecoration:
              BoxDecoration(color: theme.primaryColor, shape: BoxShape.circle),
          weekendDecoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          selectedDecoration: const BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.circle,
          ),
          holidayDecoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          disabledDecoration: BoxDecoration(
            color: theme.primaryColor,
            shape: BoxShape.circle,
          ),
          disabledTextStyle: const TextStyle(color: Colors.white),
          // selectedTextStyle: const TextStyle(color: Colors.white),
          defaultTextStyle: TextStyle(color: theme.primaryColor),
          weekendTextStyle: const TextStyle(color: Colors.red)),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      enabledDayPredicate: (day) {
        return true;
      },
      onDaySelected: _onDaySelected,
      onPageChanged: _onPageChanged,
      eventLoader: _getEventsForDay,
      onCalendarCreated: (controller) => _pageController = controller,
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
      },
    );
  }

  Widget _buildFooter() {
    final theme = Theme.of(context);
    return ValueListenableBuilder<BangChamCong>(
      builder: (context, value, _) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                title: Text(
                  'Tổng ngày công',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle:
                    Text('Tháng ${_focusedDay.month}/${_focusedDay.year}'),
                trailing: Text(
                  _tongGioCongThucTe.toString(),
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
        );
      },
      valueListenable: _selectedBangChamCong,
    );
  }

  Widget _buildGioCongList() {
    final theme = Theme.of(context);
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: theme.primaryColor),
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: ValueListenableBuilder<BangChamCong>(
          valueListenable: _selectedBangChamCong,
          builder: (context, value, _) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                      leading: const Icon(Icons.check),
                      trailing: Text(
                        value.vaoChamcong ?? '',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      minLeadingWidth: 10.0,
                      dense: true,
                      title: Text(
                        'Giờ vào',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: theme.primaryColor),
                      )),
                  ListTile(
                      leading: const Icon(Icons.check),
                      trailing: Text(value.raChamcong ?? '',
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      minLeadingWidth: 10.0,
                      dense: true,
                      title: Text(
                        'Giờ ra',
                        style: TextStyle(color: theme.primaryColor),
                      )),
                  ListTile(
                      leading: const Icon(Icons.check),
                      trailing: Text(
                          '${(value.soNgayCongthucte ?? 0).toString()} ngày',
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      minLeadingWidth: 10.0,
                      dense: true,
                      title: Text(
                        'Công được tính',
                        style: TextStyle(color: theme.primaryColor),
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onPageChanged(DateTime focusedDay) async {
    _focusedDay = focusedDay;
    _onLoadData();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
      _selectedBangChamCong.value =
          widget.bangChamCong[selectedDay] ?? BangChamCong();
    }
  }

  bool _isLoading = false;
  _onLoadData() async {
    setState(() {
      _isLoading = true;
    });
    final tranYear = _focusedDay.year;
    final tranMonth = _focusedDay.month;

    List<BangChamCong> list = await RiengTuService.getBangChamCong(
        tranYear: tranYear, tranMonth: tranMonth);

    widget.chamCongNgay.clear();
    widget.bangChamCong.clear();

    for (var e in list) {
      final int year, month, day;

      year = int.parse(e.nam ?? "1970");
      month = int.parse(e.thang ?? "1");
      day = int.parse(e.ngay ?? "1");

      final ngayCong = DateTime.utc(year, month, day);
      final listEvent = <Event>[];
      if (e.vaoChamcong != null) {
        listEvent.add(Event('Giờ vào: ${e.vaoChamcong}'));
      }
      if (e.raChamcong != null) {
        listEvent.add(Event('Giờ ra: ${e.raChamcong}'));
      }

      widget.chamCongNgay.putIfAbsent(ngayCong, () => listEvent);
      widget.bangChamCong.putIfAbsent(ngayCong, () => e);
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
        _tongGioCongThucTe = list.fold(
            0,
            (previous, current) =>
                previous + (current.soNgayCongthucte ?? 0.0));
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return widget.chamCongNgay[day] ?? [];
  }
}

/// Example event class.
class Event {
  final String title;
  const Event(this.title);
  @override
  String toString() => title;
}
