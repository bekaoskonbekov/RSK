
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rsk1/features/home/views/profile/atm_screen.dart';

 
import '../../features/home/models/branch_model.dart';
import '../../generated/locale_keys.g.dart';
import '../../routes/router.dart';
import 'height_container_widget.dart';

class ListViewBuilderWidget extends StatelessWidget {
  final List<BrancheModel> branchItems;
  const ListViewBuilderWidget({
    super.key, required this.branchItems,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount:  branchItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
               Routes.instance.push(widget: ATMScreen(), context: context);
            },
            child: HeightContainerWidget(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            branchItems[index].address.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            'Центр денежных переводов',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              
                              Container(
                                height: 7,
                                width: 7,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(LocaleKeys.elektronnyi_ochered.tr()),
                            ],
                          )
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
