import 'package:dummy/presentation/bloc/carrot_bloc.dart';
import 'package:dummy/presentation/bloc/carrot_event.dart';
import 'package:dummy/presentation/bloc/carrot_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/carrot_entity.dart';

// class CarrotList extends StatelessWidget {
//   final List<CarrotEntity> items;
//   const CarrotList({super.key, required this.items});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       itemCount: items.length + 2,
//       itemBuilder: (context, index) {
//         if (index == 0) {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 12),
//             child: Text(
//               'Latest Transactions',
//               style: GoogleFonts.lexend(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           );
//         }

//         if (index == 1) {
//           return const SizedBox(height: 4);
//         }

//         final item = items[index - 2];
//         return _CarrotRow(item: item);
//       },
//     );
//   }
// }

class CarrotList extends StatelessWidget {
  final List<CarrotEntity> items;
  const CarrotList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Latest Transactions',
              style: GoogleFonts.lexend(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        }

        if (index == 1) {
          return const SizedBox(height: 4);
        }

        final item = items[index - 2];
        return _CarrotRow(item: item);
      },
    );
  }
}

class _CarrotRow extends StatelessWidget {
  final CarrotEntity item;
  const _CarrotRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color(0xff070707),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "at illusion · Sun, 5 Oct",
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 80,
                child: Row(
                  children: [
                    Image.asset('assets/carrot_img.png', width: 24),
                    const SizedBox(width: 6),
                    Text(
                      item.value,
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w600,
                        color: item.positive ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarrotScreen extends StatefulWidget {
  const CarrotScreen({super.key});

  @override
  State<CarrotScreen> createState() => _CarrotScreenState();
}

class _CarrotScreenState extends State<CarrotScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CarrotBloc>().add(FetchCarrotTransactions("14393"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarrotBloc, CarrotState>(
      builder: (context, state) {
        if (state is CarrotLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CarrotLoaded) {
          return CarrotList(items: state.items); // 👈 SAME UI
        }

        if (state is CarrotError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
