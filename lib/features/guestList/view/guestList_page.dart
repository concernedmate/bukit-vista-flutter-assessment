import 'package:bukit_vista_flutter_assessment/constants.dart';
import 'package:bukit_vista_flutter_assessment/features/guestList/bloc/guestList_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../components/list_button.dart';

class GuestListPage extends StatefulWidget {
  @override
  _GuestListPageState createState() => _GuestListPageState();
}

class _GuestListPageState extends State<GuestListPage> {
   final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.builder(
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Guest List', style: TextStyle(fontSize: 24),),
          bottom: PreferredSize(
            preferredSize: const Size(64, 128),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        width: 400,
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                        child: TextField(
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search your guest name', 
                            prefixIcon: Icon(Icons.search, color: Colors.grey,),
                          ),
                          onSubmitted: (value) {
                            _runFilter(value);
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(FontAwesomeIcons.bars)
                      ),
                      onTap: () {
                        _runFilter(_textEditingController.text);
                      },
                    )
                ],
                ),
                const SizedBox(height: 32,)
              ],
            ),
          ),
        ),
        body: BlocBuilder<GuestListBloc, GuestListState>(
          builder: ((context, state) {
            switch (state.status) {
              case GuestListStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case GuestListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case GuestListStatus.failure:
                return RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: ListView(
                      children: const [
                        SizedBox(height: 24,),
                        Center(child: Text('Failed to fetch guests'),)
                      ],
                    )
                  );
              case GuestListStatus.success:
                if (state.guests.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: ListView(
                      children: const [
                        SizedBox(height: 24,),
                        Center(child: Text('No guests'),)
                      ],
                    )
                  );
                }else{
                  return RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index){
                        return GuestButton(
                          state.guests[index].name,
                          state.guests[index].picture,
                          state.guests[index].origin,
                        );
                      },
                      itemCount: state.guests.length,
                    )
                  );
                }
              default:
                return const Center(child: CircularProgressIndicator());
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
    context.read<GuestListBloc>().add(GuestListFetched());
  }
  Future<void> _runFilter(String value) async {
    context.read<GuestListBloc>().add(GuestListFetched());
  }
}