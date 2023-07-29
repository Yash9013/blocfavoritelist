import 'package:blocproject/bloc/userbloc/user_bloc.dart';
import 'package:blocproject/bloc/userbloc/user_state.dart';
import 'package:blocproject/commonwidget/common_widget,dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/userbloc/user_event.dart';
import '../utils/text_utils.dart';
import '../utils/variables.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar('Favorites'),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserFavoriteRemoveState) {
            commonSnackBar(context, 'Removed from favorite');
          }
        },
        builder: (context, state) => favoriteList.isEmpty
            ? Center(
                child: appText(
                    text: 'No Favorite User',
                    fontsize: 18,
                    color: Colors.deepPurpleAccent.shade100),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                itemCount: favoriteList.length,
                itemBuilder: (context, index) {
                  final usersData = favoriteList[index];
                  return ListTile(
                    onTap: () {
                      BlocProvider.of<UserBloc>(context)
                          .add(RemoveUserEvent(index));
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    },
                    dense: true,
                    leading: CircleAvatar(
                      child: Center(
                        child: appText(
                          text:
                              usersData.username.substring(0, 1).toUpperCase(),
                          fontsize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    title: appText(
                      text: usersData.username,
                      fontsize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    subtitle: appText(
                      text: usersData.email,
                      fontsize: 14,
                      color: Colors.grey,
                    ),
                    trailing: InkWell(
                      onTap: () {
                        BlocProvider.of<UserBloc>(context)
                            .add(RemoveUserEvent(index));
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      },
                      child: Icon(
                        Icons.favorite_outlined,
                        color: Colors.deepPurpleAccent.shade100,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
