import 'package:fashion_ecommerce_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  RangeValues _priceRangeValues = RangeValues(0, 100);
  List<String> _selectedSizes = [];
  String _selectedSortOption = "None";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Text("Filter By Price",
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 16),
            RangeSlider(
              values: _priceRangeValues,
              activeColor: primaryColor,
              onChanged: (RangeValues values) {
                setState(() {
                  _priceRangeValues = values;
                });
              },
              min: 0,
              max: 100,
            ),
            SizedBox(height: 24),
            Text("Filter By Size",
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                FilterChip(
                  label: Text("S"),
                  selected: _selectedSizes.contains("S"),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedSizes.add("S");
                      } else {
                        _selectedSizes.remove("S");
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text("M"),
                  selected: _selectedSizes.contains("M"),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedSizes.add("M");
                      } else {
                        _selectedSizes.remove("M");
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text("L"),
                  selected: _selectedSizes.contains("L"),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedSizes.add("L");
                      } else {
                        _selectedSizes.remove("L");
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text("M"),
                  selected: _selectedSizes.contains("XL"),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedSizes.add("XL");
                      } else {
                        _selectedSizes.remove("XL");
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text("XXL"),
                  selected: _selectedSizes.contains("XXL"),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedSizes.add("XXL");
                      } else {
                        _selectedSizes.remove("XXL");
                      }
                    });
                  },
                ),
              ],
            )
          ],
        ));
  }
}
