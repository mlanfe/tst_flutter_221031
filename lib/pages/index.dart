import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller2 extends GetxController {
  var count = 0.obs;
  var count2 = 0.obs;

  int get sum => count.value + count2.value;

  increment() => count++;

  increment2() => count2++;
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller2 c = Get.put(Controller2());
    final count1 = 0.obs;

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count.value}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Obx(() {
                debugPrint('1----------build');
                return Text("Clicks: ${c.count.value}");
              }),
              Obx(() {
                debugPrint('1----------build');
                return Text("Clicks: ${c.count}");
              }),
              Obx(() {
                debugPrint('2----------build');
                return Text("Clicks: ${c.count2.value}");
              }),
              Obx(() {
                debugPrint('2----------build');
                return Text("Clicks: ${c.count2}");
              }),
              Obx(() {
                debugPrint('3----------build');
                return Text("Clicks: ${c.sum}");
              }),
              const Text('========================================='),
              Obx(() {
                debugPrint('3----------build');
                return Text("count---3: ${count1.value}");
              }),
              Obx(() {
                debugPrint('3----------build');
                return Text("count---3: $count1");
              }),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('TextButton'),
                  ),
                  ElevatedButton(
                    child: const Text("ElevatedButton"),
                    onPressed: () {},
                  ),
                  OutlinedButton(onPressed: () {}, child: const Text("OutlinedButton")),
                  // RawMaterialButton(onPressed: () {},)
                ],
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        c.increment2();
                      },
                      child: const Text('counter2+')),
                  TextButton(
                      onPressed: () {
                        count1.value++;
                      },
                      child: const Text('counter3+')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return Other();
                        }));
                      },
                      child: const Text('other'))
                ],
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/iconfont');
                      },
                      child: const Text('01-iconfont')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/layCon');
                      },
                      child: const Text('02_布局_容器'))
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: c.increment, child: const Icon(Icons.add)));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller2 c = Get.find();

  Other({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(
          title: const Text("详情页"),
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back),
//          onPressed: () => _backToHome(context),
//        ),
        ),
        body: Column(
          children: [
            Center(child: Obx(() {
              return Text("${c.count}");
            })),
            TextButton(
                onPressed: () {
                  c.increment();
                },
                child: const Text('counter2+')),
          ],
        ));
  }
}

class Other2 extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller2 c = Get.find();

  Other2({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(
          title: const Text("详情页"),
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back),
//          onPressed: () => _backToHome(context),
//        ),
        ),
        body: Center(child: Text("${c.count2}")));
  }
}
