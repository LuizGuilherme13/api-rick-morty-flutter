// FutureBuilder(
//         future: futureCharacter,
//         builder: (context, snapshot) {
//           print(snapshot.data!.length);
//           if (snapshot.hasData) {
//             List<Result>? _data = snapshot.data!;
//             return Center(
//               child: ListView.builder(
//                 itemCount: _data.length,
//                 itemBuilder: (context, index) {
//                   return Text(_data[index].name);
//                 },
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }
//           return const CircularProgressIndicator();
//         },
//       )