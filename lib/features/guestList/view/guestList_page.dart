import 'package:bukit_vista_flutter_assessment/components/page_transition.dart';
import 'package:bukit_vista_flutter_assessment/constants.dart';
import 'package:bukit_vista_flutter_assessment/features/guestDetail/view/guestDetail_provider.dart';
import 'package:bukit_vista_flutter_assessment/features/guestList/bloc/guestList_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../../../components/list_button.dart';

class GuestListPage extends StatefulWidget {
  @override
  _GuestListPageState createState() => _GuestListPageState();
}

class _GuestListPageState extends State<GuestListPage> with SingleTickerProviderStateMixin{
  final TextEditingController _textEditingController = TextEditingController();

  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    

    super.initState();
    controller =
        AnimationController(vsync:this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller);
  }

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
                  children: [
                    Flexible(
                      child: Container(
                        width: 400,
                        padding: const EdgeInsets.fromLTRB(32, 0, 12, 0),
                        child: TextField(
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search your guest name', 
                            prefixIcon: Icon(Icons.search, size: 32, color: Colors.grey,),
                          ),
                          onChanged: (value) {
                            _runFilter(value);
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(FontAwesomeIcons.alignCenter, color: Colors.white,)
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
                if (state.guestsVisible.isEmpty) {
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
                        return InkWell(
                          onTap: () {
                            _openDetail(state.guests[index].id);
                          },
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          child: GuestButton(
                            state.guestsVisible[index].name,
                            state.guestsVisible[index].picture,
                            state.guestsVisible[index].origin,
                          )
                        );
                      },
                      itemCount: state.guestsVisible.length,
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
    context.read<GuestListBloc>().add(GuestListFiltered(value));
  }
  void _openDetail(int id) async {
    Navigator.push(
      context, 
      slideRightToLeft(GuestDetailPageProvider(id))
    );
  }
}