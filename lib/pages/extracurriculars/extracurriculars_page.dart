// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Package imports
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

/// Local imports
import '../../components/flyout_menu.dart';
import '../../globals.dart';
import '../../http_api_client.dart';
import '../../pages/teachers/email_form_page.dart';
import '../../globals.dart' as globals;

/// The class representing the extracurriculars page
class Extracurriculars extends StatefulWidget {
  const Extracurriculars({Key? key}) : super(key: key);

  @override
  _ExtracurricularsState createState() => new _ExtracurricularsState();
}

/// Represents the state class of ExtracurricularsState
class _ExtracurricularsState extends State<Extracurriculars> {
  /// Sets the transition type to be used
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  late List<Extracurricular> duplicateExtracurriculars;
  var extracurriculars = List.empty(growable: true);

  late Future<List<Extracurricular>> futureExtracurriculars;
  HttpApiClient _httpApiClientclient = new HttpApiClient();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search for club...",
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

      extracurriculars.clear();
      extracurriculars.addAll(duplicateExtracurriculars);
    });
  }

  void filterSearchResults(String query) {
    List<globals.Extracurricular> dummySearchList = List.empty(growable: true);
    dummySearchList.addAll(duplicateExtracurriculars);
    if(query.isNotEmpty) {
      List<globals.Extracurricular> dummyListData = List.empty(growable: true);
      dummySearchList.forEach((item) {
        if(item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        extracurriculars.clear();
        extracurriculars.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        extracurriculars.clear();
        extracurriculars.addAll(duplicateExtracurriculars);
      });
    }
  }

  @override
  void initState() {
    futureExtracurriculars = _httpApiClientclient.fetchExtracurriculars();
    _httpApiClientclient.fetchExtracurriculars().then((List<Extracurricular> result){
      setState(() {
        duplicateExtracurriculars = result;
        extracurriculars.addAll(duplicateExtracurriculars);
      });
    });
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
        title: _isSearching ? _buildSearchField() : Text('Extracurriculars'),
        actions: _buildActions(),
      ),
      drawer: const FlyoutMenu(),
      body: FutureBuilder<List<Extracurricular>>(
        future: futureExtracurriculars,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: extracurriculars.length,
                  itemBuilder: (context, index) {
                    var e = extracurriculars[index];
                    /// Defines the widget that displays each extracurricular
                    return OpenContainer<bool>(
                      transitionType: _transitionType,
                      openBuilder: (BuildContext _, VoidCallback openContainer) {
                        return _DetailsPage(extracurricular: e);
                      },
                      tappable: false,
                      closedShape: const RoundedRectangleBorder(),
                      closedElevation: 0.0,
                      closedBuilder: (BuildContext _, VoidCallback openContainer) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                                'assets/images/placeholder_image.png'),
                          ),
                          onTap: openContainer,
                          title: Text(e.name),
                          subtitle: Text('Adviser: ' + e.teacher.firstName + ' ' +
                              e.teacher.lastName),
                        );
                      },
                    );
                  }
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}

/// The class representing the details page of each extracurricular; takes in an object representing it
class _DetailsPage extends StatelessWidget {
  const _DetailsPage({required this.extracurricular});

  final Extracurricular extracurricular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(extracurricular.name),
        actions: <Widget>[
          /// The button that opens the page that lets the user compose an email to the advisor of each extracurricular
          IconButton(
            icon: const Icon(Icons.email_outlined),
            onPressed: () {
              /// Opens EmailFormPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmailFormPage(teacher: extracurricular.teacher)),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          /// Decorative section of the details page
          Container(
            color: Colors.black38,
            height: 250,
            child: Image.asset(
                'assets/images/placeholder_image.png',
            ),
          ),
          Padding(
          /// Text section of the details page
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  extracurricular.name,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black54,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text('Advisor: ' +
                    extracurricular.teacher.firstName + ' ' + extracurricular.teacher.lastName,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16.0,
                  ),
                ),
                Text('Email: ' +
                    extracurricular.teacher.email,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text('Meeting dates: ' +
                    extracurricular.meetingDays,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text('About: ' +
                  extracurricular.description,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}