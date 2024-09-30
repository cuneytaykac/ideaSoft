import 'package:flutter/material.dart';
import '../freezed/result_state.dart';

typedef CompletedWidget<T> = Widget Function(T);

class ResultStateBuilder<T, E extends Exception> extends StatelessWidget {
  final ResultState<T, E> resultState;
  final CompletedWidget<T> completed;
  const ResultStateBuilder(
      {Key? key, required this.resultState, required this.completed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return resultState.when(idle: () {
      return Container();
    }, pending: () {
      return const Center(child: CircularProgressIndicator());
    }, completed: (data) {
      return completed(data);
    }, failed: (error) {
      return Text(error.toString());
    }, empty: (color) {
      return const Center(child: Text("Gösterilecek Bir Sonuç Bulunamadı."));
    });
  }
}
