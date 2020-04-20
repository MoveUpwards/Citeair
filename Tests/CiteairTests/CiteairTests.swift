import XCTest
@testable import Citeair

final class CiteairTests: XCTestCase {
    let jsonDecoder = JSONDecoder()
    let jsonString: String =
    """
    {"status":"ok","data":{"aqi":26,"idx":5056,"attributions":[{"url":"http://www.atmo-nouvelleaquitaine.org/","name":"AtmoNAQ - La qualité de l&#8217;air en Nouvelle Aquitaine","logo":"France-AirAquitaine.png"},{"url":"https://waqi.info/","name":"World Air Quality Index Project"}],"city":{"geo":[44.849647300541,-0.544994768749],"name":"Bastide, Bordeaux, Aquitaine, France","url":"https://aqicn.org/city/france/aquitaine/bordeaux/bastide"},"dominentpol":"o3","iaqi":{"dew":{"v":12},"h":{"v":77},"no2":{"v":1.4},"o3":{"v":25.6},"p":{"v":1008},"pm10":{"v":14},"pm25":{"v":21},"t":{"v":16},"w":{"v":3},"wg":{"v":20}},"time":{"s":"2020-04-20 17:00:00","tz":"+02:00","v":1587402000},"debug":{"sync":"2020-04-21T00:34:07+09:00"}}}
    """

    func testJsonDecode() {
        guard let jsonData = jsonString.data(using: .utf8) else {
            XCTAssert(false, "Unable to convert UnitTestData.json to Data")
            return
        }

        jsonDecoder.dateDecodingStrategy = .iso8601
        let datas = try? jsonDecoder.decode(Welcome.self, from: jsonData)
        XCTAssertNotNil(datas)
    }

    func testApi() {
        let exp = expectation(description: "Loading datas from API")
        let client = Citeair(with: .production)
        client.datas(at: 44.8333, long: -0.5667) { result in
            exp.fulfill()
        }

        waitForExpectations(timeout: 10)
    }

    static var allTests = [
        ("testExample", testJsonDecode),
    ]
}
