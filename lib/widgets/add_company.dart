import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/DatabaseHandler/DbHelper.dart';
import 'package:flutter_complete_guide/comm/commHelper.dart';
import 'package:flutter_complete_guide/models/company_model.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

import '../comm/genTextFormField.dart';

class AddCompanyScreen extends StatelessWidget {
  const AddCompanyScreen({Key? key}) : super(key: key);
  static const routeName = '/email';
  @override
  Widget build(BuildContext context) {
    TextEditingController companyName = TextEditingController();
    TextEditingController companyEmail = TextEditingController();
    TextEditingController companyLogoUrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Add Company")),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              getTextFormField(
                  controller: companyName,
                  icon: Icons.person,
                  hintName: 'Company Name'),
              const SizedBox(
                height: 10,
              ),
              getTextFormField(
                  controller: companyEmail,
                  icon: Icons.person,
                  hintName: 'Company Email'),
              const SizedBox(
                height: 10,
              ),
              getTextFormField(
                  controller: companyLogoUrl,
                  icon: Icons.person,
                  hintName: 'Company Logo Url'),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.all(30.0),
                width: double.infinity,
                child: TextButton(
                  child: Text(
                    'Add Company',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    DbHelper db = DbHelper.instance;
                    if (companyEmail.text.isNotEmpty &&
                        companyLogoUrl.text.isNotEmpty &&
                        companyName.text.isNotEmpty) {
                      Company company = Company(
                          companyEmail: companyEmail.text,
                          companyName: companyName.text,
                          logoUrl: companyLogoUrl.text);
                      await db.insertCompanyData(company).then((value) {
                        alertDialog(context, "Company Added");
                      });
                    } else {
                      alertDialog(context, "Fill all Fileds");
                    }
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
