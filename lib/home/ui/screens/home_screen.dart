import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(95, 161, 209, 10),
        title: const Text(''),
      ),
      body: Column(
        children: [
          const CustomSearch(),
          // 39	47	61
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color.fromRGBO(39, 47, 61, 5),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'RECOMENED FOR YOU ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See all',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                  Row(
                    children: const [
                      _MoviePoster(),
                      _MoviePoster(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'TOP RATED ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See all',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                  Row(
                    children: const [
                      _MoviePoster(),
                      _MoviePoster(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = new ScrollController();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://picsum.photos/250?image=9'),
              width: 130,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Mac Studio',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellowAccent,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 95	161	209
      color: const Color.fromRGBO(95, 161, 209, 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const Text(
                'Hello, whatdo you want to watch ?',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.white),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
