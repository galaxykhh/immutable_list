import 'package:immutable_list/immutable_list.dart';

void main() {
  final List<int> list = [1, 2, 3];
  final List<int> copied = list.copy();

  print(list);
  print(copied);
  print(list == copied);
}
