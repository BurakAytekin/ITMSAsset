import 'package:flutter/material.dart';
import 'package:information_technology/widgets/custom_dialog.dart';
import 'package:information_technology/widgets/custom_dialog_dijital.dart';
import 'package:information_technology/widgets/custom_fab.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    print(data["data2"]);

    var brand = false;
    if (data["brand"] != null)
      brand = true;

    var purchaseDate = false;
    if (data["purchase_date"] != null)
      purchaseDate = true;

    var endDate = false;
    if (data["end_date"] != null)
      endDate = true;

    var price = false;
    if (data["price"] != null)
      price = true;

    var warrantyYear = false;
    if (data["warranty_year"] != null)
      warrantyYear = true;

    var name = false;
    if (data["name"] != null)
      name = true;

    var age = false;
    if (data["age"] != null)
      age = true;

    var birthDate = false;
    if (data["birth_date"] != null)
      birthDate = true;

    var department = false;
    if (data["department"] != null)
      department = true;

    var salary = false;
    if (data["salary"] != null)
      salary = true;

    var useBy = false;
    if (data["use_by"] != null && data["use_by"] != "")
      useBy = true;

    var useStart = false;
    if (data["use_start"] != null && data["use_start"] != "")
      useStart = true;

    var useEnd = false;
    if (data["use_end"] != null && data["use_end"] != "")
      useEnd = true;

    var debt = false;
    if (data["debt"] != null && data["debt"] != "")
      debt = true;

    var debtBy = false;
    if (data["debt_by"] != null && data["debt_by"] != "")
      debtBy = true;

    var debtStart = false;
    if (data["debt_start"] != null && data["debt_start"] != "")
      debtStart = true;

    var debtEnd = false;
    if (data["debt_end"] != null && data["debt_end"] != "")
      debtEnd = true;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            data["title"] ?? ""
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Visibility(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Icon(
                                  Icons.auto_awesome,
                                  color: Colors.lightBlue
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Brand",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue
                                  ),
                                ),
                                Text(
                                  data["brand"] ?? "",
                                  style: TextStyle(
                                      fontSize: 14
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  visible: brand,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.date_range,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Purchase date",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["purchase_date"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: purchaseDate,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.date_range,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "End date",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["end_date"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: endDate,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.attach_money,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["price"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: price,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.security,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Warranty year",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["warranty_year"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: warrantyYear,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.person,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["name"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: name,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.adjust,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["age"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: age,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.calendar_today,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Birth Date",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["birth_date"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: birthDate,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.location_on,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Department",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["department"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: department,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.money,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Salary",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["salary"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: salary,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.person,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Use by",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["use_by"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: useBy,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.date_range_outlined,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Use start date",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["use_start"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: useStart,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.date_range_outlined,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Use end date",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["use_end"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: useEnd,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.person_add_alt,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Debt",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["debt"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: debt,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.person,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Debt by",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["debt_by"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: debtBy,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.date_range_outlined,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Debt start date",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["debt_start"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: debtStart,
                ),
                Visibility(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                                Icons.date_range_outlined,
                                color: Colors.lightBlue
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Debt end date",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue
                                ),
                              ),
                              Text(
                                data["debt_end"] ?? "",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  visible: debtEnd,
                )
              ],
            ),
            Text(
              data["spec"] ?? "",
              style: TextStyle(
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
      floatingActionButton : warrantyYear && !debt ?  CustomDialog(
        label: "Zimmetle",
      ) : brand && !useBy ? CustomDialogDijital(
        label: "Entegre et",
        title: data["title"],
      ) : Container()
    );
  }

}