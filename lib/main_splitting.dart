import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainMoneySplitting extends StatefulWidget {
  const MainMoneySplitting({super.key});

  @override
  State<MainMoneySplitting> createState() => _MainMoneySplittingState();
}

class _MainMoneySplittingState extends State<MainMoneySplitting> {
  // Number of persons (or vertices in the graph)
  // static final int N = 6;

  // A utility function that returns
  // index of minimum value in arr[]
  int getMin(List<int> arr, int N) {
    int minInd = 0;
    for (int i = 1; i < N; i++) {
      if (arr[i] < arr[minInd]) {
        minInd = i;
      }
    }
    return minInd;
  }

  int getMax(List<int> arr, int N) {
    int maxInd = 0;
    for (int i = 1; i < N; i++) {
      if (arr[i] > arr[maxInd]) {
        maxInd = i;
      }
    }
    return maxInd;
  }

  int minOf2(int x, int y) {
    return (x < y) ? x : y;
  }

  minCashFlowRec(List<int> amount, int N) {
    int mxCredit = getMax(amount, N), mxDebit = getMin(amount, N);

    // If both amounts are 0, then
    // all amounts are settled
    if (amount[mxCredit] == 0 && amount[mxDebit] == 0) return;

    // Find the minimum of two amounts
    int min = minOf2(-amount[mxDebit], amount[mxCredit]);
    amount[mxCredit] -= min;
    amount[mxDebit] += min;

    // If minimum is the maximum amount to be

    minCashFlowRec(amount, N);
  }

  minCashFlow(List<List<int>> graph, int N) {
    // Create an array amount[],
    // initialize all value in it as 0.
    List<int> amount = [];
    for (int i = 0; i < N; i++) {
      amount[i] = 0;
    }

    for (int i = 0; i < N; i++) {
      for (int j = 0; j < N; j++) {
        amount[i] += (graph[j][i] - graph[i][j]);
      }
    }
    minCashFlowRec(amount, N);
  }

  void creatinggraph(List<List<double>> graph, List<double> amountpaid, int N) {
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < N; j++) {
        graph[j][i] = amountpaid[i] / N;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
