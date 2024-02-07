import 'package:api/modules/views/home/model/helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/api_model.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today News"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: apihelper.api.getdata(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<api_model>? data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        api_model api = api_model(
                            source: data[i].source,
                            author: data[i].author,
                            title: data[i].title,
                            description: data[i].description,
                            url: data[i].url,
                            urlToImage: data[i].urlToImage,
                            content: data[i].content,
                            publishedAt: data[i].publishedAt);
                        Get.toNamed("/detail", arguments: api);
                      },
                      child: Container(
                        child: Row(
                          children: [
                            (data[i].urlToImage == null)
                                ? Container(
                                    margin: EdgeInsets.all(15),
                                    height: Get.height * 0.15,
                                    width: Get.width * 0.4,
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
                                    margin: EdgeInsets.all(15),
                                    height: Get.height * 0.15,
                                    width: Get.width * 0.4,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade500,
                                          blurRadius: 15,
                                          offset: Offset(5, 5),
                                        ),
                                        const BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 15,
                                          offset: Offset(-5, -5),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "${data[i].urlToImage}",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 12, top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${data[i].title}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    (data[i].author == null)
                                        ? Text("")
                                        : Text(
                                            "${data[i].author}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(),
                    ),
                  ],
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
