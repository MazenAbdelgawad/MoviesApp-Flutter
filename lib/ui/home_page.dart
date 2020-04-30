import 'package:flutter/material.dart';
import 'package:fluttermovielab4/provider/home_data_provider.dart';
import 'package:fluttermovielab4/ui/widget/VerticalList.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<HomeDataProvider>( //can access this provider in all tree elements under it
        create: (context) => HomeDataProvider(),
        child: VerticalList(),
      ),
    );
  }
}
