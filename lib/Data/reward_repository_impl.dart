import 'package:dummy/domain/carrot_entity.dart';
import 'package:dummy/domain/tulip_entity.dart';
import 'package:dummy/domain/voucher_entity.dart';

class RewardRepository {
  List<CarrotEntity> getCarrots() {
    return [
      CarrotEntity(title: 'Book A Table', value: '-250', positive: false),
      CarrotEntity(title: 'Corporate Bonus', value: '+500', positive: true),
      CarrotEntity(title: 'Group Booking', value: '-250', positive: false),
      CarrotEntity(title: 'Book A Table', value: '-250', positive: false),
      CarrotEntity(title: 'Book A Table', value: '-250', positive: false),
      CarrotEntity(title: 'Corporate Bonus', value: '+500', positive: true),
    ];
  }

  List<TulipEntity> getTulips() {
    return [
      TulipEntity(
        title: 'F-Bar & Lounge',
        location: 'Gardens Galleria · 15Kms',
        earned: 25,
        balance: 250,
        time: '22 Oct 6:45 PM',
        action: 'Redeem Now',
        green: false,
      ),
      TulipEntity(
        title: 'F-Bar & Lounge',
        location: 'Gardens Galleria · 15Kms',
        earned: 25,
        balance: 250,
        time: '22 Oct 6:45 PM',
        action: 'Redeem Now',
        green: false,
      ),
      TulipEntity(
        title: 'F-Bar & Lounge',
        location: 'Gardens Galleria · 15Kms',
        earned: 25,
        balance: 250,
        time: '22 Oct 6:45 PM',
        action: 'Redeem Now',
        green: false,
      ),
      TulipEntity(
        title: 'F-Bar & Lounge',
        location: 'Gardens Galleria · 15Kms',
        earned: 25,
        balance: 250,
        time: '22 Oct 6:45 PM',
        action: 'Redeem Now',
        green: false,
      ),
      TulipEntity(
        title: 'Molt and Mith',
        location: 'Noida · 10Kms',
        earned: 25,
        balance: 300,
        time: '23 Oct 7:30 PM',
        action: 'Watch Teaser',
        green: true,
      ),
    ];
  }

  List<VoucherEntity> getVouchers() {
    return [
      VoucherEntity(
        title: 'Refund',
        value: '₹800.00',
        description: 'Payment through Yes bank credit card to avail the offer.',
      ),
      VoucherEntity(
        title: 'Free Beer',
        value: '1 Carlsberg',
        description: 'Payment through Yes bank credit card to avail the offer.',
      ),
      VoucherEntity(
        title: 'WELCOME20',
        value: '₹800.00',
        description: 'Payment through Yes bank credit card to avail the offer.',
      ),
    ];
  }
}
