import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/features/home/data/models/month_model.dart';
import 'package:expense_tracker/features/home/ui/widgets/filter_button_widget.dart';
import 'package:expense_tracker/features/home/ui/widgets/line_chart_widget.dart';
import 'package:expense_tracker/features/home/ui/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Months? selectedMonth;
  List<Color> gradientColors = [
    AppColors.themeColor,
    AppColors.violet20,
  ];

  bool showAvg = false;

  @override
  void initState() {
    super.initState();
    // Set default month to the current month
    int currentMonth = DateTime.now().month;
    selectedMonth = monthsList.firstWhere((month) => month.id == currentMonth);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    String balance = '৳150,000';
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Account Balance',
              style: textTheme.bodyLarge,
            ),
            Text(
              balance,
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: incomeExpenseCard(AppColors.green100,
                        'assets/icons/income_icon.png', 'Income', balance),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: incomeExpenseCard(AppColors.red100,
                        'assets/icons/expense_icon.png', 'Expense', balance),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(
                    'Spend Frequency',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            buildLineChartWidget(),
            FilterButtons(onSelected: (filter) {
              print('User Selected: $filter');
            }),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // This allows the text to shrink and ellipsize if needed
                      Expanded(
                        child: Text(
                          'Recent Transaction',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            // fontSize: constraints.maxWidth < 360 ? 14 : 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // You can wrap in Flexible to allow the button to shrink if needed
                      Flexible(
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.violet20,
                            textStyle: TextStyle(
                                // fontSize: constraints.maxWidth < 360 ? 12 : 14,
                                ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'See All',
                            style: TextStyle(color: AppColors.violet100),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            transactionWidget(textTheme: textTheme, iconPath: 'assets/icons/shopping_icon.png', title: 'Shopping', cost: '-120', details: 'Buy Some grocery', time: '10:00 AM', isExpense: true,),
            transactionWidget(textTheme: textTheme, iconPath: 'assets/icons/subscription_icon.png', title: 'Subscription', cost: '-80', details: 'Disney + Annual subscription', time: '3:30 PM', isExpense: true,),
            transactionWidget(textTheme: textTheme, iconPath: 'assets/icons/food_icon.png', title: 'Food', cost: '-32', details: 'Buy a ramen', time: '7:30 PM', isExpense: true,),
            transactionWidget(textTheme: textTheme, iconPath: 'assets/icons/salary_icon.png', title: 'Salary', cost: '+5000', details: 'Salary for July', time: '4:30 PM', isExpense: false,),
            transactionWidget(textTheme: textTheme, iconPath: 'assets/icons/transportation_icon.png', title: 'Transportation', cost: '-18', details: 'Charging Tesla', time: '08:30 PM', isExpense: true,),

          ],
        ),
      ),
    );
  }

  LineChartWidget buildLineChartWidget() {
    return LineChartWidget(
      dataPoints: const [
        FlSpot(0, 3),
        FlSpot(2.6, 2),
        FlSpot(4.9, 5),
        FlSpot(6.8, 3.1),
        FlSpot(8, 4),
        FlSpot(9.5, 3),
        FlSpot(11, 4),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.themeColor,
          backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOuxrvcNMfGLh73uKP1QqYpKoCB0JLXiBMvA&s',
          ),
        ),
      ),
      title: DropdownMenu<Months>(
        requestFocusOnTap: true,
        //enableFilter: true,
        initialSelection: selectedMonth,
        onSelected: (Months? month) {
          setState(() {
            selectedMonth = month;
          });
        },
        trailingIcon: SizedBox(), // Removes the default dropdown icon
        leadingIcon: Icon(Icons.expand_more,
            color: AppColors.themeColor), // Custom icon as prefix
        dropdownMenuEntries: monthsList.map((Months month) {
          return DropdownMenuEntry<Months>(
            value: month,
            label: month.label,
          );
        }).toList(),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.notifications,
            size: 28,
            color: AppColors.themeColor,
          ),
        ),
      ],
    );
  }

  Container incomeExpenseCard(bgColor, imgAsset, title, amount) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                imgAsset,
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  amount, // Added currency symbol for better UX
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
