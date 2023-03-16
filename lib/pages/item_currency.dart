
import 'package:currency_flutter/core/model/currency_model.dart';
import 'package:flutter/material.dart';

class ItemCurrency extends StatelessWidget {
  final CurrencyModel currency;
  const ItemCurrency({Key? key, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
      child: SizedBox(height: 60,child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage:
                currency.code==933?const NetworkImage('https://countryflagsapi.com/png/eur'):
            NetworkImage('https://countryflagsapi.com/png/${currency.code}'),
          ),
          const SizedBox(width: 6,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(currency.ccy,style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
            const SizedBox(height: 6,),
            Text(currency.ccyNm,style: const TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400),)],),
          const Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${currency.rate} UZS',style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),
              const SizedBox(height: 6,),
              Row(
                children: [
                  Text('${currency.diff}%',
                    style: TextStyle(color:currency.diff.startsWith('-')?Colors.red:Colors.green,fontSize: 12,fontWeight: FontWeight.w500),),
                  Icon(currency.diff.startsWith('-')?Icons.arrow_drop_down_sharp:Icons.arrow_drop_up,
                    color:currency.diff.startsWith('-')?Colors.red:Colors.green,),
                ],
              ),
            ],)

        ] ),),
    );
  }
}
