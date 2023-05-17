function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    appUrl : 'https://conduit.productionready.io/api'
  }
  if (env == 'dev') {
    config.userEmail = 'sample1@test.com'
    config.userPassword = 'karate123'
  }
  if (env == 'qa') {
    config.userEmail = 'sampletest2@test.com'
    config.userPassword = 'karate123'
  }

  var accessToken = karate.callSingle('file:features/commonfeatures/TokenGeneration.feature@GenerateToken',config)
  karate.configure('headers' , {"Authorization" : 'Token ' + accessToken.authToken})

  return config;
}