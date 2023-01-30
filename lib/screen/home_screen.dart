import 'package:currency_convertor_app/services/http_service.dart';
import 'package:currency_convertor_app/utils/api_string.dart';
import 'package:currency_convertor_app/utils/currency_color.dart';
import 'package:currency_convertor_app/widget/box_decoration.dart';
import 'package:currency_convertor_app/widget/container_widget.dart';
import 'package:currency_convertor_app/widget/currency_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCurrencyResponse();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Convertor", style: TextStyle(color: CurrencyColor.black, fontSize: 20),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CurrencyColor.bgColor,
      ),
      body: FutureBuilder(
        future: getCurrencyResponse(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: width,
                    decoration: boxDecoration(),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: (){
                                showCurrencyPicker(
                                  context: context,
                                  showFlag: true,
                                  showSearchField: true,
                                  showCurrencyName: true,
                                  showCurrencyCode: true,
                                  physics: const BouncingScrollPhysics(),
                                  onSelect: (Currency currency) {
                                    setState(() {
                                      ApiUtils.fromCurrency = currency.flag!;
                                    });
                                  },
                                  favorite: ['INR'],
                                );
                              },
                              child: currency(cn: ApiUtils.fromCurrency),
                            ),
                          ),
                        ),
                        tTobContainer(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                              ),
                              cursorColor: CurrencyColor.grey,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Amount",
                                hintStyle: TextStyle(
                                  color: CurrencyColor.grey,
                                ),
                                hintTextDirection: TextDirection.rtl,
                              ),
                              onChanged: (val) {
                                setState(() {
                                  ApiUtils.totalAmount = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Icon(CupertinoIcons.arrow_up_arrow_down, color: CurrencyColor.blue, size: 30,),
                  ),
                  Container(
                    height: 60,
                    width: width,
                    decoration: boxDecoration(),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: (){
                                showCurrencyPicker(
                                  context: context,
                                  showFlag: true,
                                  showSearchField: true,
                                  showCurrencyName: true,
                                  showCurrencyCode: true,
                                  physics: const BouncingScrollPhysics(),
                                  onSelect: (Currency currency) {
                                    setState(() {
                                      ApiUtils.toCurrency = currency.flag!;
                                    });
                                  },
                                  favorite: ['INR'],
                                );
                              },
                              child: currency(cn: ApiUtils.toCurrency),
                            ),
                          ),
                        ),
                        tTobContainer(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("${snapshot.data['result']}", style: const  TextStyle(fontSize: 20),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  CupertinoButton.filled(
                    borderRadius: BorderRadius.circular(25),
                    child: const Text("Convert"),
                    onPressed: () {
                      getCurrencyResponse();
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      backgroundColor: CurrencyColor.bgColor,
    );
  }
}
