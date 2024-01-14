import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wattio/app/models/model/point_model.dart';

/// Widget responsável por desenhar o gráfico de linhas na tela (fl_chart)
/// @author Paulo Henrique Caserta

class LineChartWidget extends StatelessWidget {
  final List<Point> points;
  const LineChartWidget({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(
            show: false,
          ),
          titlesData: const FlTitlesData(
              show: true,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: false, reservedSize: 40, interval: 20000),
              ),
              bottomTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false))),
          borderData: FlBorderData(
            show: false,
          ),
          lineBarsData: [
            // Mapeia a lista de pontos e atribui aos spots correspondentes
            LineChartBarData(
                color: Colors.yellow,
                spots: points.map((e) => FlSpot(e.x, e.y)).toList())
          ],
        ),
      ),
    );
  }
}
