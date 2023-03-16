
import 'package:currency_flutter/core/model/local_data.dart';
import 'package:currency_flutter/pages/bloc/home_bloc.dart';
import 'package:currency_flutter/pages/bloc/home_event.dart';
import 'package:currency_flutter/pages/bloc/home_state.dart';
import 'package:currency_flutter/pages/item_currency.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
   Widget get page => BlocProvider(
       create: (_) =>HomeBloc(getIt.get())..add(GetLastCurrency()),
   child: this,);
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    return Scaffold(
      backgroundColor: const Color(0xFF161513),
      appBar: AppBar(title: Text("name".tr()),backgroundColor: Colors.black,actions: [
        PopupMenuButton<LocalModel>(
          initialValue: languages[state.currentLanguage],
          // Callback that sets the selected popup menu item.
          onSelected: (LocalModel item) {
            bloc.add(LocalChangeEvent(languages.indexOf(item)));
            context.setLocale(Locale(item.title.substring(0,2).toLowerCase(),item.title.toUpperCase()));

          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<LocalModel>>[
            PopupMenuItem<LocalModel>(
              value: languages[0],
              child: Row(children: [CircleAvatar(backgroundImage: NetworkImage(languages[0].image),radius: 14,),const SizedBox(width: 8,),Text(languages[0].title)],),
            ),
            PopupMenuItem<LocalModel>(
              value: languages[1],
              child: Row(children: [CircleAvatar(backgroundImage: NetworkImage(languages[1].image),radius: 14),const SizedBox(width: 8,),Text(languages[1].title)],),
            ),
            PopupMenuItem<LocalModel>(
              value: languages[2],
              child: Row(children: [CircleAvatar(backgroundImage: NetworkImage(languages[2].image),radius: 14),const SizedBox(width: 8,),Text(languages[2].title)],),
            ),
            PopupMenuItem<LocalModel>(
              value: languages[3],
              child: Row(children: [CircleAvatar(backgroundImage: NetworkImage(languages[3].image),radius: 14),const SizedBox(width: 8,),Text(languages[3].title)],),
            ),
          ],
        ),
      ],),
      body:SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state.status==Status.loading?const Center(child: CircularProgressIndicator()):
            const SizedBox(),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
              child: Row(
                children: [
                  Text("Current exchange rate".tr(),style: const TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w500),),
                  const Expanded(child: SizedBox()),
                  InkWell(onTap: ()async {
                    final date = await showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(const Duration(days: 30)),
                        lastDate: DateTime.now());
                    if(date!=null){
                      bloc.add(GetCurrencyByData(date));
                    }

                  },child: Row(
                    children: [
                      Text(state.currencies.isNotEmpty?state.currencies.first.date:"",style: const TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w500),),
                      Icon(Icons.arrow_drop_down_sharp,color: Colors.grey,)
                    ],
                  )),
                ],
              ),
            ),
            state.currencies.isNotEmpty?
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('\$  ${state.currencies.first.rate.substring(0,(state.currencies.first.rate.length - 3))}',
                    style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
                  Text(state.currencies.first.rate.substring(state.currencies.first.rate.length - 3,
                      state.currencies.first.rate.length),style: const TextStyle(color: Colors.grey,fontSize: 22,fontWeight: FontWeight.w500),),
                ],
              ),
            ):const SizedBox(),
            state.currencies.isNotEmpty?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.show_chart,color: Colors.grey,),
                  const SizedBox(width: 16,),
                  Text('${state.currencies.first.diff}%',
                    style: TextStyle(color:state.currencies.first.diff.startsWith('-')?Colors.red:Colors.green,fontSize: 18,fontWeight: FontWeight.w500),),
                  Icon(state.currencies.first.diff.startsWith('-')?Icons.arrow_drop_down_sharp:Icons.arrow_drop_up,
                    color:state.currencies.first.diff.startsWith('-')?Colors.red:Colors.green,),


                ],
              ),
            ):const SizedBox(),
            state.currencies.isNotEmpty?
            Expanded(
                child: Container(
                  width: double.infinity,
              decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))
              ,color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                       Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("All exchange rates".tr(),style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                    ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.currencies.length,
                            itemBuilder: (context, index) {
                              final model = state.currencies[index].tr(context.locale);
                              return ItemCurrency(currency: model);
                            },),
                      )
                  ],),
            )):const SizedBox()

          ],
        ),
      )
    );
  },
);
  }
}
