import 'package:dartz/dartz.dart';
import 'package:myshop/data/exceptions/network.dart';

typedef AppNetworkResponse = Either<AppNetworkException, Map<String, dynamic>>;
