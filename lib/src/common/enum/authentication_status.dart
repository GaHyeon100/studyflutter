enum AuthenticationStatus {
  authentication, //로그인 완료 상태
  unAuthentication, //Firebase SNS 로그인은 되었지만 내부 서비스 데이터베이스에 가입 이력이 없어 회원가입이 필요한 상태(?)
  unknown, // 비로그인 상태
  init, //기본 초기화상태
}
