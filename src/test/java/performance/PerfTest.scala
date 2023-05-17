package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._
import com.practice.utils.CreateTokens

class PerfTest extends Simulation {
// below line is for custom feeder example only
    CreateTokens.createAccessTokens()

// if we add below protocol so that scala consolidate all delete request into 1
  val protocol = karateProtocol(
    "/api/articles/{articleID}}" -> Nil
  )
  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")


  val feeder = csv("createarticle.csv").circular
  // creating custom feeder in below line
  //val tokenFeeder = Iterator.continually{Map("token" -> CreateTokens.getNextToken)}

  val createArticle = scenario("create and delete article")
  .feed(feeder)
  //.feed(tokenFeeder)
  //.exec(karateFeature("file:features/performancefeature/CreateAndDelArticlescustomfeeder.feature"))
  .exec(karateFeature("file:features/performancefeature/CreateAndDelArticles.feature"))

  setUp(
    createArticle.inject(
        atOnceUsers(1),
        nothingFor(4 seconds),
        constantUsersPerSec(1) during(1 seconds)
        //constantUsersPerSec(1) during(10 seconds), 
        //constantUsersPerSec(2) during(10 seconds), 
        //rampUsersPerSec(2) to 10 during(10 seconds),
        //nothingFor(4 seconds),
        //constantUsersPerSec(1) during(5 seconds)
        ).protocols(protocol)
  )

}