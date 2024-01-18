import 'package:chat_app/components/convert_Date_To_Day.dart';
import 'package:chat_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:chat_app/models/weatherModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarChartSample1 extends StatefulWidget {
  BarChartSample1({Key? key}) : super(key: key);

  final Color barBackgroundColor = Colors.blue.withOpacity(0.3);
  final Color barColor = Colors.blue;
  final Color touchedBarColor = Colors.green;

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Duration animDuration = const Duration(milliseconds: 500);

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3.5,
      width: MediaQuery.sizeOf(context).width,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'Recent Weather',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: BarChart(
                      mainBarData(
                        nowDay: weatherModel.current!.tempC!.round(),
                        tomorrow: weatherModel
                            .forecast!.forecastday![1].day!.avgtempC!
                            .round(),
                        afterTomorrow: weatherModel
                            .forecast!.forecastday![2].day!.avgtempC!
                            .round(),
                        weatherModel: weatherModel,
                      ),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    int y, {
    bool isTouched = false,
    Color? barColor,
    double width = 50,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y.floorToDouble() + 1 : y.floorToDouble(),
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor)
              : const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(0),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups({
    required int nowDay,
    required int tomorrow,
    required int afterTomorrow,
  }) =>
      List.generate(3, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, nowDay, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, tomorrow, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, afterTomorrow,
                isTouched: i == touchedIndex);
          default:
            throw Error();
        }
      });

  BarChartData mainBarData({
    required int nowDay,
    required int tomorrow,
    required int afterTomorrow,
    required WeatherModel weatherModel,
  }) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String day;
            switch (group.x) {
              case 0:
                day = getDayFromDate(
                    "${weatherModel.forecast?.forecastday?[0].date}");
                break;
              case 1:
                day = getDayFromDate(
                    "${weatherModel.forecast?.forecastday?[1].date}");
                break;
              case 2:
                day = getDayFromDate(
                    "${weatherModel.forecast?.forecastday?[2].date}");
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$day\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyle(
                    color: widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) =>
                getTitles(value, meta, weatherModel),
            reservedSize: 30,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(
        afterTomorrow: afterTomorrow,
        nowDay: nowDay,
        tomorrow: tomorrow,
      ),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta, WeatherModel weatherModel) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(
            getDayFromDate("${weatherModel.forecast?.forecastday?[0].date}"),
            style: style);
        break;
      case 1:
        text = Text(
            getDayFromDate("${weatherModel.forecast?.forecastday?[1].date}"),
            style: style);
        break;
      case 2:
        text = Text(
            getDayFromDate("${weatherModel.forecast?.forecastday?[2].date}"),
            style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}
