import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/mvvm_example/data/response/status.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/routes/routes_name.dart';
import 'package:provider_with_mvvm/mvvm_example/utils/utils.dart';
import 'package:provider_with_mvvm/mvvm_example/view_model/home_view_model.dart';
import 'package:provider_with_mvvm/mvvm_example/view_model/user_view_model.dart';

class HomeScreenMvvm extends StatefulWidget {
  const HomeScreenMvvm({super.key});

  @override
  State<HomeScreenMvvm> createState() => _HomeScreenMvvmState();
}

class _HomeScreenMvvmState extends State<HomeScreenMvvm> {
  HomeViewModel homeViewModel = HomeViewModel();
  UserViewModel userViewModel = UserViewModel();
  void handleClick(int item) {
    switch (item) {
      case 0:
        userViewModel.removeUserToken();
        Navigator.pushNamed(context, RoutesName.splash);
        break;
      case 1:
        Navigator.pushNamed(context, RoutesName.home);
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.home);
                },
                icon: const Icon(Icons.arrow_back_rounded));
          },
        ),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) {
              handleClick(item);
            },
            // onSelected: (item) => handleClick(item),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(value: 0, child: Text('Logout')),
              const PopupMenuItem<int>(value: 1, child: Text('Settings')),
            ],
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            final response = value.moviesListResponse;
            switch (response.status) {
              case Status.loading:
                return const CircularProgressIndicator();
              case Status.error:
                return Text(response.message.toString());
              case Status.completed:
                return ListView.builder(
                  itemCount: response.data!.movies?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          response.data!.movies![index].posterurl.toString(),
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.error,
                              color: Colors.red,
                            );
                          },
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                            response.data!.movies![index].title.toString()),
                        subtitle:
                            Text(response.data!.movies![index].year.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(Utils.averageRating(ratings: response.data!.movies![index].ratings!).toStringAsFixed(1)),
                          const Icon(Icons.star,color: Colors.amber,)],
                        ),
                      ),
                    );
                  },
                );
              default:
            }
            return Container();
          },
        ),
      ),
    );
  }
}
