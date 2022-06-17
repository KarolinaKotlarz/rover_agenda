/// Package imports

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// Local imports
import '../../components/flyout_menu.dart';
import '../../globals.dart' as globals;

/// The class representing the teachers list page
class TeacherList extends StatefulWidget {
  const TeacherList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _TeacherListState();
}

/// Represents the state class of TeacherListState
class _TeacherListState extends State<TeacherList> {

  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  final duplicateItems = globals.teachers;
  var teachers = List.empty(growable: true);

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search for teacher...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) {
        updateSearchQuery(query);
        filterSearchResults(query);
      },
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");

      teachers.clear();
      teachers.addAll(duplicateItems);
    });
  }

  void filterSearchResults(String query) {
    List<globals.Teacher> dummySearchList = List.empty(growable: true);
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<globals.Teacher> dummyListData = List.empty(growable: true);
      dummySearchList.forEach((item) {
        if(item.getFullName().toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        teachers.clear();
        teachers.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        teachers.clear();
        teachers.addAll(duplicateItems);
      });
    }
  }

  @override
  void initState() {
    teachers.addAll(duplicateItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching ?  BackButton() : Builder(builder: (context) => // Ensure Scaffold is in context
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer()
          ),
        ),
        title: _isSearching ? _buildSearchField() : Text('Teachers'),
        actions: _buildActions(),
      ),
      drawer: const FlyoutMenu(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: teachers.length,
              itemBuilder: (context, index) {
                var teacher = teachers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/placeholder_image.png'),
                  ),
                  title: Text(
                    teacher.firstName + " " + teacher.lastName,
                  ),
                  subtitle: Text(teacher.email),
                  trailing: /*Icon(Icons.email_outlined, color: Colors.red, size: 40,)*/ Container(
                    child: IconButton(
                      onPressed: () {
                        /// Calls method that opens the default email app
                        _launchEmail(
                            emailTo: teacher.email);
                        Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.email_outlined,
                      color: Colors.red,
                    ),
                    iconSize: 30,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                  ),
                ),
                onTap: () {
                    /// TODO: Teacher pop-up
                },
                );
              }
            ),
          ),
        ],
      ),
    );

  }
  /// Opens the default email app and passes the composed email to it
  Future _launchEmail(
      {required emailTo}) async {
    final url =
        'mailto:$emailTo?subject=${Uri.encodeFull('')}&body=${Uri.encodeFull('')}';
    await launch(url);
  }
}
