import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/CustomerType.dart';
import 'package:novus_trade_v1/models/PaymentMethod.dart';
import 'package:novus_trade_v1/models/PaymentTerm.dart';
import 'package:novus_trade_v1/models/lanauges.dart';
import 'package:novus_trade_v1/network/apiCaller.dart';
import 'package:novus_trade_v1/screens/addCustomer/app_sheets.dart';
import 'package:novus_trade_v1/screens/addCustomer/dialog_data.dart';
import 'package:novus_trade_v1/widget/dialog_overlay.dart';

class AddCustomerScreen extends StatefulWidget {
  AddCustomerScreen({Key key}) : super(key: key);

  @override
  _AddCustomerScreenState createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final _formKey = GlobalKey<FormState>();
  var typeCompanyController = new TextEditingController();
  var prospectController = new TextEditingController();
  var currencyController = new TextEditingController();
  var paymentMethodController = new TextEditingController();
  var paymentTermController = new TextEditingController();

  String _companyName, _companyPhone, _companyType, _companyEmail, _companyFax;

  List listCustomer,
      salePriceList,
      listPaymentTerm,
      listPaymentMethod,
      listPaymentCurrency = [];

  @override
  void initState() {
    super.initState();
    _getInitialData();
  }

  Future _getInitialData() async {
    List result = await Future.wait([
      ApiCaller().getListTypeCustomer(),
      ApiCaller().getListPaymentTerm(),
      ApiCaller().getSalePriceList(),
      ApiCaller().getListPaymentMethod(),
      ApiCaller().getListPaymentCurrency(),
    ]);
    if (result[0].success == true &&
        result[1].success == true &&
        result[2].success == true &&
        result[3].success == true) {
      setState(() {
        listCustomer = result[0].data;
        salePriceList = result[2].data;
        listPaymentTerm = result[1].data;
        listPaymentMethod = result[3].data;
        listPaymentCurrency = result[4].data;
      });
    }
  }

  void createCustomer() async {
    if (_formKey.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    } else {
      var data = {
        "cd": _companyType,
        "first_name": "kshdfoi3heoif1h34oh13o4",
        "type": "CP",
        "registration": "fdasfgas",
        "phone": _companyPhone,
        "email": _companyEmail,
        "fax": _companyFax,
        "ac": 1,
        "credit_limit": 123,
        "credit_balance": 1,
        "currency_id": 129,
        "sale_price_id": 1,
        "loyalty_discount": 123,
        "taxable": 1,
        "company_name": _companyName,
        "addresses": [
          {
            "type": "HEAD",
            "country_id": 1,
            "state_id": 78,
            "name": "Thinh Nguyen",
            "address_line": "117 Le Thi Hong , P 16 , Go Vap",
            "city_name": "Ho Chi Minh123",
            "zip_code": "700000"
          },
          {
            "type": "BILL",
            "country_id": 1,
            "state_id": 90,
            "is_default": 1,
            "name": "Thinh Nguyen",
            "address_line": "117 Le Thi Hong , P 16 , Go Vap",
            "city_name": "Ho Chi Minh",
            "zip_code": "700000"
          },
          {
            "type": "SHIP",
            "country_id": 1,
            "state_id": 90,
            "is_default": 1,
            "hidden": true,
            "name": "Thinh Nguyen",
            "address_line": "117 Le Thi Hong , P 16 , Go Vap",
            "city_name": "Ho Chi Minh",
            "zip_code": "700000"
          }
        ],
        "contacts": [
          {
            "email": "kshdfoi3heoif1h34oh13o4@asda.com",
            "fax": "123",
            "is_main": 1,
            "name": null,
            "status": 1,
            "phone": "0948224447",
            "title": "Bot manager upload file apk to slack channel",
            "username": "kshdfoi3heoif1h34oh13o4@asda.com",
            "first_name": "23123",
            "last_name": "123",
            "department": "123"
          }
        ],
        "sites": [],
        "taxes": [],
        "prospect_status": 1
      };

      // try {
      //   Response response =
      //       await Dio().post("http://novustrade.co/api/customer", data: data);
      //   print(response);
      // } on DioError catch (e) {
      //   print(e.response);
      // }
      ApiCaller().createCustomer(data).then((value) => print(value.statusCode));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Customer"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          onChanged: () {
            Form.of(primaryFocus.context).save();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "ADD CUSTOMER",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF223263),
                    fontSize: 22),
              ),
              Text(
                "GENERAL INFORMATION",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF22D188),
                    fontSize: 18),
              ),
              inputFormField(
                  title: "Type",
                  placeHolder: "Company",
                  readOnly: true,
                  controller: typeCompanyController,
                  onTab: () {
                    showAppDialog(
                        context: context,
                        builder: (_) => DialogOverlay(
                            title: "Company Type",
                            optionsList: dataCompany(
                                data: listCustomer,
                                action: (e) {
                                  typeCompanyController.text = e.name;
                                  _companyType = e.cd;
                                  Navigator.pop(context);
                                })));
                  }),
              inputFormField(
                  title: "Prospect? ",
                  placeHolder: "Yes",
                  readOnly: true,
                  controller: prospectController,
                  onTab: () {
                    showAppDialog(
                        context: context,
                        builder: (_) => DialogOverlay(
                            title: "Prospect",
                            optionsList: dataProspect(action: (e) {
                              prospectController.text = e;
                              Navigator.pop(context);
                            })));
                  }),
              inputFormField(
                  title: "Company Name",
                  placeHolder: "ABC Company",
                  onSaved: (String name) {
                    _companyName = name;
                  }),
              inputFormField(
                  title: "Company Phone",
                  placeHolder: "0948224447",
                  keyboardType: TextInputType.phone,
                  onSaved: (String phone) {
                    _companyPhone = phone;
                  }),
              inputFormField(
                  title: "Email",
                  placeHolder: "nguyenhungthinh16@gmail.com ",
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String email) {
                    _companyEmail = email;
                  }),
              inputFormField(
                  title: "Fax",
                  placeHolder: "0948224447",
                  onSaved: (String fax) {
                    _companyFax = fax;
                  }),
              inputFormField(
                  title: "Currency",
                  placeHolder: "Select",
                  readOnly: true,
                  controller: currencyController,
                  onTab: () {
                    showAppDialog(
                        context: context,
                        builder: (_) => DialogOverlay(
                            title: "Currentcy",
                            optionsList: dataCurrentcy(
                                data: listPaymentCurrency,
                                action: (e) {
                                  currencyController.text = e;
                                  Navigator.pop(context);
                                })));
                  }),
              inputFormField(
                  title: "Sales Price List",
                  placeHolder: "Select",
                  readOnly: true,
                  onTab: () {
                    showAppDialog(
                        context: context,
                        builder: (_) => DialogOverlay(
                            title: "Sale Price List",
                            optionsList: dataSalePrice(
                                data: salePriceList,
                                action: (e) {
                                  typeCompanyController.text = e.name;
                                  _companyType = e.code;
                                  Navigator.pop(context);
                                })));
                  }),
              inputFormField(
                  title: "Payment Terms",
                  placeHolder: "Payment Terms",
                  readOnly: true,
                  controller: paymentTermController,
                  onTab: () {
                    showAppDialog(
                        context: context,
                        builder: (_) => DialogOverlay(
                            title: "Payment Term",
                            optionsList: paymentPaymentTerm(
                                data: listPaymentTerm,
                                action: (e) {
                                  paymentTermController.text = e;
                                  Navigator.pop(context);
                                })));
                  }),
              inputFormField(
                  title: "Payment Method",
                  placeHolder: "ATM",
                  readOnly: true,
                  controller: paymentMethodController,
                  onTab: () {
                    showAppDialog(
                        context: context,
                        builder: (_) => DialogOverlay(
                            title: "Payment Method",
                            optionsList: paymentMethods(
                                data: listPaymentMethod,
                                action: (e) {
                                  paymentMethodController.text = e;
                                  Navigator.pop(context);
                                })));
                  }),
              SizedBox(
                height: 20,
              ),
              Text(
                "ADDRESS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF223263),
                    fontSize: 22),
              ),
              addressView(),
              billingAddress(),
              shipingAddress(),
              mainContact(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    createCustomer();
                  },
                  child: Text(
                    "Tạo mới",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addressView() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Header Office"),
            inputFormField(
                title: "Country",
                placeHolder: "Drop-down list",
                onTab: () {
                  AppSheets.showBottomSheet(
                      context: context, widget: selectCountruy());
                },
                readOnly: true),
            inputFormField(title: "Address", placeHolder: "Input"),
            inputFormField(title: "City", placeHolder: "Input"),
            inputFormField(
                title: "State / Region", placeHolder: "Drop-down list"),
            inputFormField(title: "Zip / Postal Code", placeHolder: "Input"),
          ],
        ),
      ),
    );
  }

  Widget selectCountruy() {
    LanguagesList languagesList;
    languagesList = new LanguagesList();
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          color: Color.fromRGBO(250, 250, 250, 1)),
      child: Column(children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, -1), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
          height: 60,
          child: Center(
            child: Text(
              "Select Language",
              style: Theme.of(context).textTheme.body2,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            scrollDirection: Axis.vertical,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 15),
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return ItemCountry(languagesList.languages.elementAt(index));
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12,
                  );
                },
                itemCount: languagesList.languages.length),
          ),
        ),
      ]),
    );
  }

// ignore: non_constant_identifier_names
  Widget ItemCountry(Language item) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(item.flag),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(item.englishName,
                  style: Theme.of(context).textTheme.bodyText1),
              Text(item.localName)
            ],
          )
        ],
      ),
    );
  }

  Widget mainContact() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("MAIN CONTACT"),
            inputFormField(title: "Name", placeHolder: "Drop-down list"),
            inputFormField(title: "Title", placeHolder: "Input"),
            inputFormField(title: "Department Name", placeHolder: "Input"),
            inputFormField(title: "Phone", placeHolder: "Drop-down list"),
            inputFormField(title: "Email", placeHolder: "Input"),
            inputFormField(title: "Fax", placeHolder: "Input"),
            inputFormField(title: "Account Name", placeHolder: "Input"),
          ],
        ),
      ),
    );
  }

  Widget shipingAddress() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Shipping Address"),
            inputFormField(title: "Address", placeHolder: "input"),
            inputFormField(title: "Country", placeHolder: "Drop-down list"),
            inputFormField(title: "Address", placeHolder: "Input"),
            inputFormField(title: "City", placeHolder: "Input"),
            inputFormField(
                title: "State / Region", placeHolder: "Drop-down list"),
            inputFormField(title: "Zip / Postal Code", placeHolder: "Input"),
          ],
        ),
      ),
    );
  }

  Widget billingAddress() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Billing Address"),
            inputFormField(title: "Country", placeHolder: "Drop-down list"),
            inputFormField(title: "Address", placeHolder: "Input"),
            inputFormField(title: "City", placeHolder: "Input"),
            inputFormField(
                title: "State / Region", placeHolder: "Drop-down list"),
            inputFormField(title: "Zip / Postal Code", placeHolder: "Input"),
          ],
        ),
      ),
    );
  }

  Widget inputFormField(
      {String title,
      String placeHolder,
      onTab,
      onSaved,
      keyboardType: TextInputType.emailAddress,
      readOnly = false,
      controller}) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: TextFormField(
        controller: controller,
        onTap: onTab,
        onSaved: onSaved,
        readOnly: readOnly,
        style: TextStyle(color: Theme.of(context).hintColor),
        keyboardType: keyboardType,
        decoration: getInputDecoration(hintText: placeHolder, labelText: title),
        validator: (input) => !input.contains('@') ? 'Not a valid email' : null,
      ),
    );
  }

  InputDecoration getInputDecoration({String hintText, String labelText}) {
    return new InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      hintText: hintText,
      labelText: labelText,
      hintStyle: Theme.of(context).textTheme.body1.merge(
            TextStyle(color: Theme.of(context).focusColor),
          ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.blueAccent, width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey, width: 1)),
      labelStyle: Theme.of(context).textTheme.body1.merge(
            TextStyle(color: Theme.of(context).hintColor),
          ),
    );
  }
}
