import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/users/web_view/web_view_screen.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.indigoAccent,
  @required Function function,
  @required String text,
  bool isUpperCase = true,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );

Widget defaultFormField({
  @required IconData prefix,
  @required TextEditingController controller,
  @required TextInputType type,
  @required Function validate,
  String label,
  String hint,
  Function onTap,
  Function onSubmit,
  Function onChange,
  bool isPassword = false,
  IconData suffix,
  Function suffixPressed,
}) =>
    TextFormField(
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      decoration: InputDecoration(
        focusColor: Colors.deepOrange,
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
      ),
    );

// Widget buildTaskItem(context, Map model) => Dismissible(
//       key: Key(model['id'].toString()),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundColor: Colors.deepOrange,
//               radius: 35.0,
//               child: Text(
//                 '${model['time']}',
//                 style: TextStyle(fontSize: 15.0, color: Colors.white),
//               ),
//             ),
//             SizedBox(
//               width: 20.0,
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     '${model['title']}',
//                     style:
//                         TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '${model['date']}',
//                     style: TextStyle(color: Colors.grey, fontSize: 10.0),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: 20.0,
//             ),
//             IconButton(
//               onPressed: () {
//                 AppCubit.get(context)
//                     .updateData(status: 'done', id: model['id']);
//               },
//               icon: Icon(Icons.check_circle_outline),
//               color: Colors.orange,
//             ),
//             IconButton(
//               onPressed: () {
//                 AppCubit.get(context)
//                     .updateData(status: 'archive', id: model['id']);
//               },
//               icon: Icon(Icons.archive_outlined),
//               color: Colors.black38,
//             ),
//           ],
//         ),
//       ),
//       onDismissed: (direction) {
//         AppCubit.get(context).deleteData(id: model['id']);
//       },
//     );

//

// Widget taskBuilder({
//   @required List<Map> tasks,
// }) => ConditionalBuilder(
//       condition: tasks.length > 0,
//       builder: (context) => ListView.separated(
//         itemBuilder: (context, index) => buildTaskItem(context, tasks[index]),
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: tasks.length,
//       ),
//       fallback: (context) => Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.menu_outlined),
//             Text(
//               'No Tasks Yet, Please Add Some Tasks',
//               style: TextStyle(
//                 color: Colors.grey,
//               ),
//             )
//           ],
//         ),
//       ),
//     );

//

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

//

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(
          context,
          WebViewScreen(article['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

//

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

//

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(
          list[index],
          context,
        ),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,
      ),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );
