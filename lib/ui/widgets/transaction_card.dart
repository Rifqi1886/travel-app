import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'booking_details_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // DESTINATION TILE
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      transaction.destination.imageUrl,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/icon_star.png',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ],
          ),

          //BOOKING DETAILS TEXT
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          //BOOKING DETAILS ITEM
          BookingDetailsItem(
            title: 'Traveler',
            valueColor: kBlackColor,
            valueText: '${transaction.amountOfTraveler} person',
          ),
          BookingDetailsItem(
            title: 'Seat',
            valueColor: kBlackColor,
            valueText: '${transaction.selectedSeats}',
          ),
          BookingDetailsItem(
            title: 'Insurance',
            valueColor: transaction.insurance ? kGreenColor : kRedColor,
            valueText: transaction.insurance ? 'Yes' : 'No',
          ),
          BookingDetailsItem(
            title: 'Refundable',
            valueColor: transaction.refundable ? kGreenColor : kRedColor,
            valueText: transaction.refundable ? 'Yes' : 'No',
          ),
          BookingDetailsItem(
            title: 'VAT',
            valueColor: kBlackColor,
            valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
          ),
          BookingDetailsItem(
            title: 'Price',
            valueColor: kBlackColor,
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp. ',
              decimalDigits: 0,
            ).format(transaction.price),
          ),
          BookingDetailsItem(
            title: 'Grand Total',
            valueColor: kPrimaryColor,
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp. ',
              decimalDigits: 0,
            ).format(transaction.grandTotal),
          ),
        ],
      ),
    );
  }
}
