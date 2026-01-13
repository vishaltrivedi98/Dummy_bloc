import 'package:flutter/material.dart';

class TulipsHistorySheet extends StatefulWidget {
  const TulipsHistorySheet({super.key});

  @override
  State<TulipsHistorySheet> createState() => _TulipsHistorySheetState();
}

class _TulipsHistorySheetState extends State<TulipsHistorySheet> {
  bool isExpanded = false;

  final List<Map<String, dynamic>> historyList = [
    {
      'type': 'Spend',
      'title': 'Book A Table',
      'date': 'Mon, 18 Oct',
      'value': -250,
      'balance': 400,
    },
    {
      'type': 'Earn',
      'title': 'Food',
      'date': 'Mon, 18 Oct',
      'value': 250,
      'balance': 400,
    },
    {
      'type': 'Spend',
      'title': 'Book A Table',
      'date': 'Mon, 18 Oct',
      'value': -250,
      'balance': 400,
    },
    {
      'type': 'Spend',
      'title': 'Book A Table',
      'date': 'Mon, 18 Oct',
      'value': -250,
      'balance': 400,
    },
    {
      'type': 'Earn',
      'title': 'Food',
      'date': 'Mon, 18 Oct',
      'value': 250,
      'balance': 400,
    },
    {
      'type': 'Spend',
      'title': 'Book A Table',
      'date': 'Mon, 18 Oct',
      'value': -250,
      'balance': 400,
    },
    {
      'type': 'Earn',
      'title': 'Food',
      'date': 'Mon, 18 Oct',
      'value': 250,
      'balance': 400,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final visibleItems =
        isExpanded ? historyList : historyList.take(5).toList();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isExpanded ? MediaQuery.of(context).size.height * 0.6 : 400,
      decoration: const BoxDecoration(
        color: Color(0xffE5E5E5),
        borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
      ),
      child: Column(
        children: [
          _dragHandle(),
          _header(),
          // _locationRow(),
          const Divider(),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: visibleItems.length,
                  itemBuilder: (context, index) {
                    return _HistoryRow(item: visibleItems[index]);
                  },
                ),

                // Fade effect
                if (!isExpanded)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //   begin: Alignment.topCenter,
                          //   end: Alignment.bottomCenter,
                          //   colors: [
                          //     Colors.transparent,
                          //     Colors.grey.shade200,
                          //   ],
                          // ),
                          ),
                    ),
                  ),
              ],
            ),
          ),
          _viewMoreButton(),
        ],
      ),
    );
  }

  Widget _dragHandle() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 6),
      child: Container(
        height: 4,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tulips History for LIT Ultra Bar Club',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xff1C1B1D)),
          ),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 16),
              const SizedBox(width: 6),
              Text(
                'DLP Phase 3, Gurugram',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(width: 20),
              Container(
                height: 20,
                width: 70,
                decoration: BoxDecoration(
                  color: const Color(0xff6B63E6),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: const Text(
                    '1.2 Kms',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _locationRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, size: 16),
          const SizedBox(width: 6),
          const Expanded(
            child: Text(
              'DLP Phase 3, Gurugram',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xff6B63E6),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              '1.2 Kms',
              style: TextStyle(color: Colors.white, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  Widget _viewMoreButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          isExpanded ? 'View Less' : 'View More',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _HistoryRow extends StatelessWidget {
  final Map<String, dynamic> item;
  const _HistoryRow({required this.item});

  @override
  Widget build(BuildContext context) {
    final bool isEarn = item['value'] > 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['type'],
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  '${item['title']} • ${item['date']}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isEarn ? '+' : ''}${item['value']}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isEarn ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '${item['balance']} Tulips',
                style: const TextStyle(fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
