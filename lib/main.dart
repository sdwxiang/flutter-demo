import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './youtube_dl_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => YoutubeDLBloc(),
        child: const MyHomePage()
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
  final bloc = BlocProvider.of<YoutubeDLBloc>(context);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: BlocBuilder<YoutubeDLBloc, YoutubeDLState>(
          builder:(context, state) {
            if (state is YoutubeDLUrl) {
              return Text('url: ${state.url}');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'enter url',
                    ),
                  )
                ],
              );
            }
          },
          bloc: bloc,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(DownloadVideo(_controller.text));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
