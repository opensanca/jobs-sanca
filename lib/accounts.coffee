T9n.setLanguage('pt')

AccountsTemplates.configureRoute 'forgotPwd'
AccountsTemplates.configureRoute 'resetPwd'
AccountsTemplates.configureRoute 'signIn',
  name: 'signIn'
  path: '/sign-in'
  redirect: '/'
AccountsTemplates.configureRoute 'signUp',
  name: 'signUp'
  path: '/sign-up'
  redirect: '/'
AccountsTemplates.configureRoute 'verifyEmail'
AccountsTemplates.configure
  confirmPassword: true
  enablePasswordChange: true
  forbidClientAccountCreation: false
  overrideLoginErrors: true
  sendVerificationEmail: false
  showForgotPasswordLink: true
  showLabels: false
  showPlaceholders: true
  continuousValidation: true
  negativeFeedback: false
  negativeValidation: true
  positiveValidation: false
  positiveFeedback: false
  homeRoutePath: '/'
  redirectTimeout: 2000
