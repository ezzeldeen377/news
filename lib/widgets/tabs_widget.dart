import 'package:flutter/material.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/pages/news_page/news_page_view_model.dart';
import 'package:news_app/widgets/news_widget.dart';
import 'package:news_app/widgets/tab_item.dart';
import 'package:provider/provider.dart';

class TabsWidget extends StatefulWidget {
  List<Sources> list;

  TabsWidget({required this.list});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget>  {
 NewsPageViewModel viewModel= NewsPageViewModel();

@override
  void initState() {
    // TODO: implement initState
    super.initState();

}
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context)=>viewModel,
      child: Consumer<NewsPageViewModel>(
        builder: (context,viewModel,child) {
          return DefaultTabController(

            length: widget.list.length,
            child: Column(
              children: [
                TabBar(
                    onTap: (index) {
                      viewModel.changeIndex(index);
                    },
                    isScrollable: true,

                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabs:
                    widget.list.map((element) {
                      return TabItem(text: element.name ?? '',
                        isSelected: viewModel.selectedIndex == widget.list
                            .indexOf(element),);
                    }).toList()

                ),
                Expanded(
                    child: Consumer<NewsPageViewModel>(
                      builder: (context,viewModel,child) {
                        print( widget.list[viewModel.selectedIndex]);

                     return   NewsWidget(
                            source: widget.list[viewModel.selectedIndex]);
                      }
                    )
                )

              ],
            ),
          );

        }
      ),
    );
  }


}
