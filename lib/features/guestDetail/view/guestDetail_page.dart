import 'package:bukit_vista_flutter_assessment/bukitvista-themes.dart';
import 'package:bukit_vista_flutter_assessment/constants.dart';
import 'package:bukit_vista_flutter_assessment/features/guestDetail/bloc/guestDetail_bloc.dart';
import 'package:bukit_vista_flutter_assessment/components/list_button.dart';
import 'package:bukit_vista_flutter_assessment/models/guest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class GuestDetailPage extends StatefulWidget {
  @override
  _GuestDetailPageState createState() => _GuestDetailPageState();
}

class _GuestDetailPageState extends State<GuestDetailPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.builder(
      Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Guest Details', style: TextStyle(fontSize: 24),),
            bottom: PreferredSize(
              preferredSize: const Size(64, 208),
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 32,),
                    BlocBuilder<GuestDetailBloc, GuestDetailState>(
                      builder: ((context, state) {
                        switch (state.status) {
                          case GuestDetailStatus.initial:
                            return GuestButton('-', '-', '-', false);
                          case GuestDetailStatus.loading:
                            return GuestButton('...', '...', '...', false);
                          case GuestDetailStatus.success:
                            return GuestButton(state.guestDetail.name, state.guestDetail.picture, "Guest since ${state.guestDetail.joindate}", false);
                          case GuestDetailStatus.failure:
                            return GuestButton('-', '-', '-', false);
                        }
                      }),
                    ),
                    TabBar(
                      labelColor: Colors.lightBlue,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.lightBlue,
                      controller: _tabController,
                      tabs: const <Widget>[
                        Tab(
                          text: 'Overview',
                        ),
                        Tab(
                          text: 'Bookings',
                        ),
                        Tab(
                          text: 'Personas',
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ),
          ),
        body: BlocBuilder<GuestDetailBloc, GuestDetailState>(
          builder: ((context, state) {
            switch (state.status) {
              case GuestDetailStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case GuestDetailStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case GuestDetailStatus.success:
                return TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: ListView(
                        children: [
                          SizedBox(height: 24,),
                          Container(
                            padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Email', style: BukitVistaTheme.body1.copyWith(color: Colors.grey)),
                                Text(state.guestDetail.email, style: BukitVistaTheme.body1),
                                SizedBox(height: 16,),
                                Text('Phone Number', style: BukitVistaTheme.body1.copyWith(color: Colors.grey)),
                                Text(state.guestDetail.phone, style: BukitVistaTheme.body1),
                                SizedBox(height: 16,),
                                Text('Guest Origin', style: BukitVistaTheme.body1.copyWith(color: Colors.grey)),
                                Text(state.guestDetail.origin, style: BukitVistaTheme.body1),
                            ])
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: state.guestDetail.bookings.isEmpty
                      ? const Center(child: Text('No bookings available', style: BukitVistaTheme.body1))
                      : RefreshIndicator(
                        onRefresh: _onRefresh,
                        child: ListView.builder(
                          itemCount: state.guestDetail.bookings.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  context: context, 
                                  isScrollControlled: true,
                                  builder: (context){
                                  return Wrap(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Container(
                                                width: 32,
                                                child: Divider(
                                                  color: Colors.grey,
                                                  thickness: 2.0,
                                                )
                                              )
                                            ),
                                            SizedBox(height: 24),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Check in', style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey),),
                                                    SizedBox(height: 4,),
                                                    Text(state.guestDetail.bookings[index].checkin, style: BukitVistaTheme.subtitle,),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Icon(Icons.dark_mode_outlined),
                                                    SizedBox(height: 4,),
                                                    Text(
                                                      "${state.guestDetail.bookings[index].numGuest} Nights", 
                                                      style: BukitVistaTheme.subtitle.copyWith(color: Colors.blue)
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Text('Check out', style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey),),
                                                    SizedBox(height: 4,),
                                                    Text(state.guestDetail.bookings[index].checkout, style: BukitVistaTheme.subtitle,),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 16,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Booking ID', style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey),),
                                                    SizedBox(height: 4,),
                                                    Text(state.guestDetail.bookings[index].bookId, style: BukitVistaTheme.subtitle,),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Text('Booking status', style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey),),
                                                    SizedBox(height: 4,),
                                                    Text(state.guestDetail.bookings[index].bookStatus == 1
                                                    ? 'Confirmed'
                                                    : state.guestDetail.bookings[index].bookStatus == 2
                                                      ? 'Canceled'
                                                      : 'Pending'
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 16,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Number of guest', style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey),),
                                                    SizedBox(height: 4,),
                                                    Text(state.guestDetail.bookings[index].numGuest.toString(), style: BukitVistaTheme.subtitle,),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Text('Booking value', style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey),),
                                                    SizedBox(height: 4,),
                                                    Text(state.guestDetail.bookings[index].bookValue, style: BukitVistaTheme.subtitle,),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 16,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Phone number', style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey),),
                                                SizedBox(height: 4,),
                                                Text(state.guestDetail.bookings[index].phone, style: BukitVistaTheme.subtitle,),
                                              ],
                                            ),
                                            SizedBox(height: 24,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Hosting details', style: BukitVistaTheme.body1.copyWith(fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            SizedBox(height: 24,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Host', style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey),),
                                                SizedBox(height: 4,),
                                                Text(state.guestDetail.bookings[index].host, style: BukitVistaTheme.subtitle,),
                                              ],
                                            ),
                                            SizedBox(height: 16,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Profile name', style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey),),
                                                SizedBox(height: 4,),
                                                Text(state.guestDetail.bookings[index].profileName, style: BukitVistaTheme.subtitle,),
                                              ],
                                            ),
                                            SizedBox(height: 16,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Property unit', style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey),),
                                                SizedBox(height: 4,),
                                                Text(state.guestDetail.bookings[index].propertyUnit, style: BukitVistaTheme.subtitle,),
                                              ],
                                            ),
                                            SizedBox(height: 16,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Listing name', style: BukitVistaTheme.subtitle.copyWith(color: Colors.grey),),
                                                SizedBox(height: 4,),
                                                Text(state.guestDetail.bookings[index].listName, style: BukitVistaTheme.subtitle.copyWith(color: Colors.orange),),
                                              ],
                                            )
                                          ],
                                        )
                                      )
                                  ]);
                                });
                              },
                              child: BookingButton(
                                state.guestDetail.bookings[index].bookId, 
                                state.guestDetail.bookings[index].propertyUnit, 
                                state.guestDetail.bookings[index].bookStatus, 
                                state.guestDetail.bookings[index].checkin,
                                state.guestDetail.bookings[index].checkout
                              )
                            );
                          })
                        )
                      ),
                    ),
                    Container()
                  ]
              );
              case GuestDetailStatus.failure:
                return RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: ListView(
                      children: const [
                        SizedBox(height: 24,),
                        Center(child: Text('Failed to fetch guest detail', style: BukitVistaTheme.body1,),)
                      ],
                    )
                  );
            }
          }),
        )
      ),
      maxWidth: kResponsiveMaxWidth,
      minWidth: kResponsiveMinWidth,
      defaultScale: kResponsiveDefaultScale,
      breakpoints: kResponsiveBreakPoints
    );
  }

  Future<void> _onRefresh() async {
  }

}