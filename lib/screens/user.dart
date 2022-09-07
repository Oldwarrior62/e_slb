import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modles/user_information.dart';

class User extends StatefulWidget {
  static const routeName = '/user';

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  final _lastNameFocusNode = FocusNode();
  final _licenseNumberFocusNode = FocusNode();
  final _licenseExpiryDateFocusNode = FocusNode();
  final _companyNameFocusNode = FocusNode();
  final _siteLocationFocusNode = FocusNode();
  final _dateController = TextEditingController();
  final _imageUrlControler = TextEditingController();
  final _logoUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedUser = UserInformation(
    id: null,
    firstName: '',
    lastName: '',
    LicenseNumber: '',
    expiryDate: DateTime.now(),
    imageUrl: '',
    companyName: '',
    siteLocation: '',
  );

  @override
  void initState() {
    _logoUrlFocusNode.addListener(_updateLogoUrl);
    super.initState();
  }

  @override
  void dispose() {
    _logoUrlFocusNode.removeListener(_updateLogoUrl);
    _lastNameFocusNode.dispose();
    _companyNameFocusNode.dispose();
    _licenseNumberFocusNode.dispose();
    _licenseExpiryDateFocusNode.dispose();
    _siteLocationFocusNode.dispose();
    _dateController.dispose();
    _imageUrlControler.dispose();
    _logoUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateLogoUrl() {
    if (!_logoUrlFocusNode.hasFocus) {
      if (!_imageUrlControler.text.startsWith('http') &&
              !_imageUrlControler.text.startsWith('https') ||
          !_imageUrlControler.text.endsWith('png') &&
              !_imageUrlControler.text.endsWith('jpg') &&
              !_imageUrlControler.text.endsWith('jpeg')) {
        return;
      }
      setState(() {});
    }
  }

  void _savedForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    print(_editedUser.firstName);
    print(_editedUser.lastName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New user'),
        actions: [
          IconButton(
            onPressed: _savedForm,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_lastNameFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a first name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedUser = UserInformation(
                      firstName: value,
                      lastName: _editedUser.lastName,
                      LicenseNumber: _editedUser.LicenseNumber,
                      expiryDate: _editedUser.expiryDate,
                      companyName: _editedUser.companyName,
                      siteLocation: _editedUser.siteLocation,
                      id: _editedUser.id,
                      imageUrl: _editedUser.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  textInputAction: TextInputAction.next,
                  focusNode: _lastNameFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_licenseNumberFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a last name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedUser = UserInformation(
                      firstName: _editedUser.firstName,
                      lastName: value,
                      LicenseNumber: _editedUser.LicenseNumber,
                      expiryDate: _editedUser.expiryDate,
                      companyName: _editedUser.companyName,
                      siteLocation: _editedUser.siteLocation,
                      id: _editedUser.id,
                      imageUrl: _editedUser.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Security License Number'),
                  textInputAction: TextInputAction.next,
                  focusNode: _licenseNumberFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_licenseExpiryDateFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a License number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedUser = UserInformation(
                      firstName: _editedUser.firstName,
                      lastName: _editedUser.lastName,
                      LicenseNumber: value,
                      expiryDate: _editedUser.expiryDate,
                      companyName: _editedUser.companyName,
                      siteLocation: _editedUser.siteLocation,
                      id: _editedUser.id,
                      imageUrl: _editedUser.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Expiry Date',
                  ),
                  textInputAction: TextInputAction.next,
                  focusNode: _licenseExpiryDateFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_companyNameFocusNode);
                  },
                  onTap: () async {
                    FocusScope.of(context)
                        .requestFocus(_licenseExpiryDateFocusNode);
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
                      lastDate: DateTime(2025),
                    ).then(
                      (selectedDate) {
                        if (selectedDate != null) {
                          _dateController.text =
                              DateFormat('yyyy-MM-dd').format(selectedDate);
                        }
                      },
                    );
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a expirey date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedUser = UserInformation(
                      firstName: _editedUser.firstName,
                      lastName: _editedUser.lastName,
                      LicenseNumber: _editedUser.LicenseNumber,
                      expiryDate: DateTime.parse(value),
                      companyName: _editedUser.companyName,
                      siteLocation: _editedUser.siteLocation,
                      id: _editedUser.id,
                      imageUrl: _editedUser.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Company Name'),
                  textInputAction: TextInputAction.next,
                  focusNode: _companyNameFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_siteLocationFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a company name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedUser = UserInformation(
                      firstName: _editedUser.firstName,
                      lastName: _editedUser.lastName,
                      LicenseNumber: _editedUser.LicenseNumber,
                      expiryDate: _editedUser.expiryDate,
                      companyName: value,
                      siteLocation: _editedUser.siteLocation,
                      id: _editedUser.id,
                      imageUrl: _editedUser.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Site Location'),
                  textInputAction: TextInputAction.next,
                  focusNode: _siteLocationFocusNode,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a site location';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedUser = UserInformation(
                      firstName: _editedUser.firstName,
                      lastName: _editedUser.lastName,
                      LicenseNumber: _editedUser.LicenseNumber,
                      expiryDate: _editedUser.expiryDate,
                      companyName: _editedUser.companyName,
                      siteLocation: value,
                      id: _editedUser.id,
                      imageUrl: _editedUser.imageUrl,
                    );
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 8, right: 10),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: _imageUrlControler.text.isEmpty
                          ? Text(
                              'Company Logo',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10),
                            )
                          : FittedBox(
                              child: Image.network(_imageUrlControler.text),
                              fit: BoxFit.fitWidth,
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Logo URL'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlControler,
                        focusNode: _logoUrlFocusNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a company logo URL';
                          }
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return 'please inter a valid company log URl';
                          }
                          if (!value.endsWith('png') &&
                              !value.endsWith('jpg') &&
                              !value.endsWith('jpeg')) {
                            return 'please inter a valid company log URl';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedUser = UserInformation(
                            firstName: _editedUser.firstName,
                            lastName: _editedUser.lastName,
                            LicenseNumber: _editedUser.LicenseNumber,
                            expiryDate: _editedUser.expiryDate,
                            companyName: _editedUser.companyName,
                            siteLocation: _editedUser.siteLocation,
                            id: _editedUser.id,
                            imageUrl: value,
                          );
                        },
                        onFieldSubmitted: (_) {
                          _savedForm();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
