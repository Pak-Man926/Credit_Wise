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
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/auth_endpoint.dart' as _i2;
import '../endpoints/credit_endpoint.dart' as _i3;
import '../endpoints/loan_endpoint.dart' as _i4;
import '../endpoints/profile_endpoint.dart' as _i5;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'credit': _i3.CreditEndpoint()
        ..initialize(
          server,
          'credit',
          null,
        ),
      'loan': _i4.LoanEndpoint()
        ..initialize(
          server,
          'loan',
          null,
        ),
      'profile': _i5.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'registerUser': _i1.MethodConnector(
          name: 'registerUser',
          params: {
            'firstName': _i1.ParameterDescription(
              name: 'firstName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'secondName': _i1.ParameterDescription(
              name: 'secondName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'lastName': _i1.ParameterDescription(
              name: 'lastName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'phoneNumber': _i1.ParameterDescription(
              name: 'phoneNumber',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'gender': _i1.ParameterDescription(
              name: 'gender',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).registerUser(
                session,
                params['firstName'],
                params['secondName'],
                params['lastName'],
                params['email'],
                params['phoneNumber'],
                params['gender'],
                params['password'],
              ),
        ),
        'loginUser': _i1.MethodConnector(
          name: 'loginUser',
          params: {
            'phoneNumber': _i1.ParameterDescription(
              name: 'phoneNumber',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).loginUser(
                session,
                params['phoneNumber'],
                params['password'],
              ),
        ),
      },
    );
    connectors['credit'] = _i1.EndpointConnector(
      name: 'credit',
      endpoint: endpoints['credit']!,
      methodConnectors: {
        'createCreditPreference': _i1.MethodConnector(
          name: 'createCreditPreference',
          params: {
            'creditUsage': _i1.ParameterDescription(
              name: 'creditUsage',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'latePayment30_59': _i1.ParameterDescription(
              name: 'latePayment30_59',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'latePayment60_89': _i1.ParameterDescription(
              name: 'latePayment60_89',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'latePayment90': _i1.ParameterDescription(
              name: 'latePayment90',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'openCreditLines': _i1.ParameterDescription(
              name: 'openCreditLines',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['credit'] as _i3.CreditEndpoint)
                  .createCreditPreference(
                    session,
                    params['creditUsage'],
                    params['latePayment30_59'],
                    params['latePayment60_89'],
                    params['latePayment90'],
                    params['openCreditLines'],
                  ),
        ),
      },
    );
    connectors['loan'] = _i1.EndpointConnector(
      name: 'loan',
      endpoint: endpoints['loan']!,
      methodConnectors: {
        'createLoanPreference': _i1.MethodConnector(
          name: 'createLoanPreference',
          params: {
            'loanAmount': _i1.ParameterDescription(
              name: 'loanAmount',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'repaymentPeriod': _i1.ParameterDescription(
              name: 'repaymentPeriod',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'repaymentHistory': _i1.ParameterDescription(
              name: 'repaymentHistory',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'employmentType': _i1.ParameterDescription(
              name: 'employmentType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['loan'] as _i4.LoanEndpoint).createLoanPreference(
                    session,
                    params['loanAmount'],
                    params['repaymentPeriod'],
                    params['repaymentHistory'],
                    params['employmentType'],
                  ),
        ),
      },
    );
    connectors['profile'] = _i1.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
        'createProfileData': _i1.MethodConnector(
          name: 'createProfileData',
          params: {
            'age': _i1.ParameterDescription(
              name: 'age',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'dependants': _i1.ParameterDescription(
              name: 'dependants',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'monthlyIncome': _i1.ParameterDescription(
              name: 'monthlyIncome',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'debtRatio': _i1.ParameterDescription(
              name: 'debtRatio',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'contributorIncome': _i1.ParameterDescription(
              name: 'contributorIncome',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i5.ProfileEndpoint)
                  .createProfileData(
                    session,
                    params['age'],
                    params['dependants'],
                    params['monthlyIncome'],
                    params['debtRatio'],
                    params['contributorIncome'],
                  ),
        ),
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
