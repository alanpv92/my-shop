import 'package:dartz/dartz.dart';
import 'package:myshop/data/exceptions/network.dart';
import 'package:myshop/data/models/user.dart';

typedef AppNetworkResponse = Either<AppNetworkException, Map<String, dynamic>>;

typedef AppAuthenticationResponse = Either<AppNetworkException, UserModel>;
