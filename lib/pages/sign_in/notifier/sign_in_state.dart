class SignInState {
  final String email;
  final String password;

  const SignInState({
    this.email = '',
    this.password = '',
  });

  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

// void main() {
//   SignInState state = SignInState();
//   state.email = 'jyr@bullets.co.kr';
//   SignInState myState = SignInState(
//     email: 'jyr@bullets.co.kr',
//     password: '123',
//   );
//   myState.password = '12';
// }
