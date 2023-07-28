// ignore_for_file: iterable_contains_unrelated_type
import 'package:blocproject/bloc/userbloc/user_event.dart';
import 'package:blocproject/commonwidget/common_widget,dart.dart';
import 'package:blocproject/screens/favorite_screen.dart';
import 'package:blocproject/utils/text_utils.dart';
import 'package:blocproject/utils/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/userbloc/user_bloc.dart';
import '../bloc/userbloc/user_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar('Home Screen', actions: [
        Row(
          children: [
            const Icon(
              Icons.favorite,
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) => appText(
                  text: '($favoriteCount)', fontsize: 18, color: Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ]),
      body: BlocConsumer<UserBloc, UserState>(
        buildWhen: (previous, current) => current is UserDataSuccessState,
        listener: (context, state) {
          if (state is UserDataSuccessState) {
            commonSnackBar(context, 'Data Fetch Successfully');
          }
          if (state is UserAddState) {
            commonSnackBar(context, 'Added to favorite');
          }
          if (state is UserRemoveState) {
            commonSnackBar(context, 'Removed from favorite');
          }
        },
        builder: (context, state) {
          if (state is UserDataLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is UserDataSuccessState) {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemCount: state.userData.length,
              itemBuilder: (context, index) {
                final usersData = state.userData[index];
                return ListTile(
                  dense: true,
                  leading: CircleAvatar(
                    child: Center(
                      child: appText(
                        text: usersData.username.substring(0, 1).toUpperCase(),
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
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      context.read<UserBloc>().add(AddUserEvent(index));
                    },
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) => Icon(
                        favoriteList.contains(usersData)
                            ? Icons.favorite_outlined
                            : Icons.favorite_outline,
                        color: Colors.deepPurpleAccent.shade100,
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is UserDataErrorState) {
            return Center(
              child: appText(
                text: state.errorMessage,
                fontsize: 21,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const FavoriteScreen(),
            ),
          );
        },
        child: Icon(
          Icons.favorite_outlined,
          color: Colors.deepPurpleAccent.shade100,
        ),
      ),
    );
  }
}
