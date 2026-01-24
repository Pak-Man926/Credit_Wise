/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i3;
import 'protocol.dart' as _i4;

/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  _i2.Future<bool> registerUser(
    String firstName,
    String secondName,
    String lastName,
    String email,
    int phoneNumber,
    String gender,
    String password,
  ) => caller.callServerEndpoint<bool>(
    'auth',
    'registerUser',
    {
      'firstName': firstName,
      'secondName': secondName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'password': password,
    },
  );

  _i2.Future<_i3.AuthenticationResponse> loginUser(
    int phoneNumber,
    String password,
  ) => caller.callServerEndpoint<_i3.AuthenticationResponse>(
    'auth',
    'loginUser',
    {
      'phoneNumber': phoneNumber,
      'password': password,
    },
  );
}

/// {@category Endpoint}
class EndpointCredit extends _i1.EndpointRef {
  EndpointCredit(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'credit';

  _i2.Future<void> createCreditPreference(
    double creditUsage,
    double latePaymentHistory,
    int openCreditLines,
  ) => caller.callServerEndpoint<void>(
    'credit',
    'createCreditPreference',
    {
      'creditUsage': creditUsage,
      'latePaymentHistory': latePaymentHistory,
      'openCreditLines': openCreditLines,
    },
  );
}

/// {@category Endpoint}
class EndpointLoan extends _i1.EndpointRef {
  EndpointLoan(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'loan';

  _i2.Future<void> createLoanPreference(
    double loanAmount,
    int repaymentPeriod,
    double repaymentHistory,
    String employmentType,
  ) => caller.callServerEndpoint<void>(
    'loan',
    'createLoanPreference',
    {
      'loanAmount': loanAmount,
      'repaymentPeriod': repaymentPeriod,
      'repaymentHistory': repaymentHistory,
      'employmentType': employmentType,
    },
  );
}

/// {@category Endpoint}
class EndpointProfile extends _i1.EndpointRef {
  EndpointProfile(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'profile';

  _i2.Future<void> createProfileData(
    int age,
    int dependants,
    double monthlyIncome,
    double debtRatio,
    double contributorIncome,
  ) => caller.callServerEndpoint<void>(
    'profile',
    'createProfileData',
    {
      'age': age,
      'dependants': dependants,
      'monthlyIncome': monthlyIncome,
      'debtRatio': debtRatio,
      'contributorIncome': contributorIncome,
    },
  );
}

class Modules {
  Modules(Client client) {
    auth = _i3.Caller(client);
  }

  late final _i3.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i4.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    auth = EndpointAuth(this);
    credit = EndpointCredit(this);
    loan = EndpointLoan(this);
    profile = EndpointProfile(this);
    modules = Modules(this);
  }

  late final EndpointAuth auth;

  late final EndpointCredit credit;

  late final EndpointLoan loan;

  late final EndpointProfile profile;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'auth': auth,
    'credit': credit,
    'loan': loan,
    'profile': profile,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'auth': modules.auth,
  };
}
