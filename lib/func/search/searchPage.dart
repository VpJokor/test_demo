import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:get/get.dart';

import 'searchPageController.dart';
import 'searchPageState.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final SearchPageController controller = Get.put(SearchPageController());
  final SearchPageDart state = Get.find<SearchPageController>().state;

  @override
  Widget build(BuildContext context) {
    return ConstraintLayout(
      childConstraints: [
        Constraint(
          id: state.box0,
          size: 200,
          bottomLeftTo: parent,
          zIndex: 20,
        )
      ],
      children: [
        Container(
          color: Colors.redAccent,
          alignment: Alignment.center,
          child: const Text('box0'),
        ).applyConstraintId(
          id: state.box0, // Constraints can be separated from widgets
        ),
        Container(
          color: Colors.redAccent,
          alignment: Alignment.center,
          child: const Text('box1'),
        ).apply(
          constraint: Constraint(
            // Constraints set with widgets
            id: state.box1,
            width: 200,
            height: 100,
            topRightTo: parent,
          ),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('box2'),
        ).applyConstraint(
          // Constraints set with widgets easy way
          id: state.box2,
          size: matchConstraint,
          centerHorizontalTo: state.box3,
          top: state.box3.bottom,
          bottom: parent.bottom,
        ),
        Container(
          color: Colors.orange,
          width: 200,
          height: 150,
          alignment: Alignment.center,
          child: const Text('box3'),
        ).applyConstraint(
          id: state.box3,
          right: state.box1.left,
          top: state.box1.bottom,
        ),
        Container(
          color: Colors.redAccent,
          alignment: Alignment.center,
          child: const Text('box4'),
        ).applyConstraint(
          id: state.box4,
          size: 50,
          bottomRightTo: parent,
        ),
        Container(
          color: Colors.pink,
          alignment: Alignment.center,
          child: const Text('box5 draggable'),
        ).applyConstraint(
          id: state.box5,
          width: 120,
          height: 100,
          centerTo: parent,
          zIndex: 100,
          translate: Offset(state.x.value, state.y.value),
          translateConstraint: true,
        ),
        // Obx(() => GestureDetector(
        //       child: Container(
        //         color: Colors.pink,
        //         alignment: Alignment.center,
        //         child: const Text('box5 draggable'),
        //       ),
        //       onPanUpdate: (details) {
        //         // setState(() {
        //         //   state.x += details.delta.dx;
        //         //   state.y += details.delta.dy;
        //         // });
        //         state.x.value = state.x.value + details.delta.dx;
        //         state.y.value = state.x.value + details.delta.dy;
        //       },
        //     ).applyConstraint(
        //       id: state.box5,
        //       width: 120,
        //       height: 100,
        //       centerTo: parent,
        //       zIndex: 100,
        //       translate: Offset(state.x.value, state.y.value),
        //       translateConstraint: true,
        //     )),
        Container(
          color: Colors.lightGreen,
          alignment: Alignment.center,
          child: const Text('box6'),
        ).applyConstraint(
          id: state.box6,
          size: 120,
          centerVerticalTo: state.box2,
          verticalBias: 0.8,
          left: state.box3.right,
          right: parent.right,
        ),
        Container(
          color: Colors.lightGreen,
          alignment: Alignment.center,
          child: const Text('box7'),
        ).applyConstraint(
          id: state.box7,
          size: matchConstraint,
          left: parent.left,
          right: state.box3.left,
          centerVerticalTo: parent,
          margin: const EdgeInsets.all(50),
        ),
        Container(
          color: Colors.cyan,
          alignment: Alignment.center,
          child: const Text('child[7] pinned to the top right'),
        ).applyConstraint(
          width: 200,
          height: 100,
          left: state.box5.right,
          bottom: state.box5.top,
        ),
        const Text(
          'box9 baseline to box7',
          style: TextStyle(
            color: Colors.white,
          ),
        ).applyConstraint(
          id: state.box9,
          baseline: state.box7.baseline,
          left: state.box7.left,
        ),
        Container(
          color: Colors.yellow,
          alignment: Alignment.bottomCenter,
          child: const Text(
              'percentage layout\nwidth: 50% of parent\nheight: 30% of parent'),
        ).applyConstraint(
          size: matchConstraint,
          widthPercent: 0.5,
          heightPercent: 0.3,
          horizontalBias: 0,
          verticalBias: 0,
          centerTo: parent,
        ),
        Barrier(
          id: state.barrier,
          direction: BarrierDirection.left,
          referencedIds: [state.box6, state.box5],
        ),
        Container(
          color: const Color(0xFFFFD500),
          alignment: Alignment.center,
          child: const Text('align to barrier'),
        ).applyConstraint(
          width: 100,
          height: 200,
          top: state.box5.top,
          right: state.barrier.left,
        )
      ],
    );
  }
}
