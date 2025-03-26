import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/features/setup_account/data/models/account_type.dart';
import 'package:expense_tracker/features/setup_account/ui/screens/setup_success.dart';
import 'package:flutter/material.dart';

class AddNewAccountScreen extends StatefulWidget {
  const AddNewAccountScreen({super.key});

  static const String name = '/add-new-account';

  @override
  State<AddNewAccountScreen> createState() => _AddNewAccountScreenState();
}

class _AddNewAccountScreenState extends State<AddNewAccountScreen> {
  MenuItem? selectedAccountType;
  BankName? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        centerTitle: true,
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Add new account',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Padding(
            padding: EdgeInsets.all(8),
            child:
                // Balance Section
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Balance',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  '0.00 tk',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          // White Container with Inputs
          Container(
            alignment: FractionalOffset.bottomCenter,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                // Account Name Input
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                  ),
                ),
                const SizedBox(height: 4),

                // Account Type Dropdown
                DropdownMenu<MenuItem>(
                  hintText: 'Select Account Type',
                  width: double.infinity,
                  requestFocusOnTap: true,
                  enableFilter: true,
                  initialSelection:
                      selectedAccountType, // Show selected value
                  onSelected: (MenuItem? menu) {
                    setState(() {
                      selectedAccountType = menu;
                      if (menu?.id != 2) {
                        selectedBank =
                            null; // Reset bank if account type changes
                      }
                    });
                  },
                  dropdownMenuEntries: menuItems.map((MenuItem menu) {
                    return DropdownMenuEntry<MenuItem>(
                      value: menu,
                      label: menu.label,
                    );
                  }).toList(),
                ),

                // Show Bank Dropdown if Account Type is "Bank" (ID = 2)
                if (selectedAccountType?.id == 2) ...[
                  const SizedBox(height: 12),
                  DropdownMenu<BankName>(
                    hintText: 'Select Bank',
                    width: double.infinity,
                    requestFocusOnTap: true,
                    enableFilter: true, // Enables search inside the dropdown
                    initialSelection: selectedBank, // Show selected bank
                    onSelected: (BankName? bank) {
                      setState(() {
                        selectedBank = bank;
                      });
                    },
                    dropdownMenuEntries: bankNames.map((BankName bank) {
                      return DropdownMenuEntry<BankName>(
                        value: bank,
                        label: bank.label,
                      );
                    }).toList(),
                  ),
                ],

                const SizedBox(height: 4), // Spacing before button

                // Continue Button
                ElevatedButton(
                  onPressed: () {
                    // Implement continue logic
                    Navigator.pushNamed(context, SetupSuccess.name);
                  },
                  child: Text('Continue'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}