
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../HomePage/HomePageBloc.dart';
import '../HomePage/HomePageEvent.dart';
import '../HomePage/HomePageState.dart';

class HomePage extends StatelessWidget {
  final String endpoint;
  final HomePageBloc bloc;


  HomePage({required this.endpoint, required this.bloc});

  void fetchData() {
    bloc.add(FetchDataEvent(endpoint));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: BlocBuilder<HomePageBloc, HomePageState>(
          bloc: bloc,
          builder: (context, state) {
            print(state);
            if (state is InitialState) {
              return CircularProgressIndicator();
            } else if (state is DataLoadedState) {
              final data = state.data;
              return
                ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Age: ${item['age'] ?? 'N/A'}'),
                          Text('Password: ${item['password'] ?? 'N/A'}'),
                          Text('Email: ${item['email'] ?? 'N/A'}'),
                          if (item['avatar'] != null)
                            Image.network(item['avatar'],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,),

                          Text('Number: ${item['number'] ?? 'N/A'}'),
                        ],
                      ),
                    );
                  },
                );


            } else if (state is ErrorState) {
              return Text('Lỗi khi tải dữ liệu từ API.');
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
