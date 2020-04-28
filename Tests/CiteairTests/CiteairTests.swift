import XCTest
@testable import Citeair

final class CiteairTests: XCTestCase {
    let jsonDecoder = JSONDecoder()

    func testJsonDecode() {
        let jsonString =
        """
        {"status":"ok","data":{"aqi":26,"idx":5056,"attributions":[{"url":"http://www.atmo-nouvelleaquitaine.org/","name":"AtmoNAQ - La qualité de l&#8217;air en Nouvelle Aquitaine","logo":"France-AirAquitaine.png"},{"url":"https://waqi.info/","name":"World Air Quality Index Project"}],"city":{"geo":[44.849647300541,-0.544994768749],"name":"Bastide, Bordeaux, Aquitaine, France","url":"https://aqicn.org/city/france/aquitaine/bordeaux/bastide"},"dominentpol":"o3","iaqi":{"dew":{"v":12},"h":{"v":77},"no2":{"v":1.4},"o3":{"v":25.6},"p":{"v":1008},"pm10":{"v":14},"pm25":{"v":21},"t":{"v":16},"w":{"v":3},"wg":{"v":20}},"time":{"s":"2020-04-20 17:00:00","tz":"+02:00","v":1587402000},"debug":{"sync":"2020-04-21T00:34:07+09:00"}}}
        """

        guard let jsonData = jsonString.data(using: .utf8) else {
            XCTAssert(false, "Unable to convert UnitTestData.json to Data")
            return
        }

        jsonDecoder.dateDecodingStrategy = .iso8601
        let datas = try? jsonDecoder.decode(Welcome.self, from: jsonData)
        XCTAssertNotNil(datas)
    }

    func testJsonDecodeWithMissingAqi() {
        let jsonString =
        """
        {"status":"ok","data":{"aqi":23,"idx":6896,"attributions":[{"url":"http://www.atmosud.org","name":"Air PACA - Association de surveillance de la qualité de l'air en région Provence-Alpes-Cote d'Azur","logo":"Paca-Air-Paca.png"},{"url":"https://waqi.info/","name":"World Air Quality Index Project"}],"city":{"geo":[43.5625,7.00722],"name":"Cannes Broussailles, PACA, France","url":"https://aqicn.org/city/france/paca/cannes-broussailles"},"dominentpol":"o3","iaqi":{"dew":{"v":14},"h":{"v":93},"no2":{"v":5.3},"o3":{"v":22.9},"p":{"v":1009},"pm10":{"v":10},"pm25":{"v":15},"t":{"v":15},"w":{"v":2}},"time":{"s":"2020-04-28 10:00:00","tz":"+02:00","v":1588068000},"debug":{"sync":"2020-04-28T18:17:44+09:00"}}}
        """

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
            switch result {
                case .failure(let error):
                    XCTAssert(false, error.localizedDescription)
                default:
                break

            }
            XCTAssertNotNil(result)
        }

        waitForExpectations(timeout: 10)
    }

    static var allTests = [
        ("testExample", testJsonDecode),
    ]
}
