import 'package:api/modules/views/home/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class detail extends StatelessWidget {
  const detail({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    api_model data = ModalRoute.of(context)!.settings.arguments as api_model;
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_left,
            size: 35,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${data.title}", style: style),
              (data == null)
                  ? Text("")
                  : Text(
                      "${data.author}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              (data.urlToImage == null)
                  ? Container(
                      height: Get.height * 0.4,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://dims.apnews.com/dims4/default/e81da05/2147483647/strip/true/crop/6720x4476+0+2/resize/599x399!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2Ffc%2Fa2%2Ffe09f1f7cc4e7ca52dca5d04b913%2Fa371fca13c8c4a4f8ee66b81424f0000",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      height: Get.height * 0.4,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            "${data.urlToImage}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                "${data.description}",
                style: style,
              ),
              (data.urlToImage == null)
                  ? Container(
                      height: Get.height * 0.4,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://dims.apnews.com/dims4/default/e81da05/2147483647/strip/true/crop/6720x4476+0+2/resize/599x399!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2Ffc%2Fa2%2Ffe09f1f7cc4e7ca52dca5d04b913%2Fa371fca13c8c4a4f8ee66b81424f0000",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      height: Get.height * 0.4,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage("${data.urlToImage}"),
                        ),
                      ),
                    ),
              Text(
                "${data.content}",
                style: style,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed("/web", arguments: "${data.url}");
                  },
                  child: Text("more..."))
            ],
          ),
        ),
      ),
    );
  }
}
