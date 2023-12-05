import 'dart:math';

import 'package:collection/collection.dart';

///
class Almanac {
  const Almanac({
    this.seeds = const [],
    this.seedToSoil = const [],
    this.soilToFertilizer = const [],
    this.fertilizerToWater = const [],
    this.waterToLight = const [],
    this.lightToTemperature = const [],
    this.temperatureToHumidity = const [],
    this.humidityToLocation = const [],
  });

  final List<int> seeds;
  final List<AlmanacRecord> seedToSoil;
  final List<AlmanacRecord> soilToFertilizer;
  final List<AlmanacRecord> fertilizerToWater;
  final List<AlmanacRecord> waterToLight;
  final List<AlmanacRecord> lightToTemperature;
  final List<AlmanacRecord> temperatureToHumidity;
  final List<AlmanacRecord> humidityToLocation;

  int get minLocation => locations.reduce(min);

  List<int> get locations {
    final locations = <int>[];
    for (final seed in seeds) {
      final soil = srcToDst(seed, seedToSoil);
      final fertilizer = srcToDst(soil, soilToFertilizer);
      final water = srcToDst(fertilizer, fertilizerToWater);
      final light = srcToDst(water, waterToLight);
      final temperature = srcToDst(light, lightToTemperature);
      final humidity = srcToDst(temperature, temperatureToHumidity);
      final location = srcToDst(humidity, humidityToLocation);
      locations.add(location);
    }

    return locations;
  }

  int srcToDst(int src, List<AlmanacRecord> dstMap) {
    return dstMap
            .firstWhereOrNull((record) => record.containsSrc(src))
            ?.srcToDst(src) ??
        src;
  }

  int dstToSrc(int dst, List<AlmanacRecord> dstMap) {
    return dstMap
            .firstWhereOrNull((record) => record.containsDst(dst))
            ?.dstToSrc(dst) ??
        dst;
  }
}

///
class AlmanacRecord {
  const AlmanacRecord({
    required this.dstStart,
    required this.srcStart,
    required this.rangeLength,
  });

  final int dstStart;
  final int srcStart;
  final int rangeLength;

  int get srcEnd => srcStart + rangeLength;
  int get dstEnd => dstStart + rangeLength;

  int srcToDst(int src) => src - srcStart + dstStart;
  int dstToSrc(int dst) => dst - dstStart + srcStart;
  bool containsSrc(int src) => src >= srcStart && src <= srcEnd;
  bool containsDst(int dst) => dst >= dstStart && dst <= dstEnd;
}

final input = Almanac(
  seeds: [
    4106085912,
    135215567,
    529248892,
    159537194,
    1281459911,
    114322341,
    1857095529,
    814584370,
    2999858074,
    50388481,
    3362084117,
    37744902,
    3471634344,
    240133599,
    3737494864,
    346615684,
    1585884643,
    142273098,
    917169654,
    286257440,
  ],
  seedToSoil: [
    AlmanacRecord(
      dstStart: 1640984363,
      srcStart: 3136305987,
      rangeLength: 77225710,
    ),
    AlmanacRecord(
      dstStart: 3469528922,
      srcStart: 1857474741,
      rangeLength: 56096642,
    ),
    AlmanacRecord(
      dstStart: 278465165,
      srcStart: 2901870617,
      rangeLength: 105516220,
    ),
    AlmanacRecord(
      dstStart: 1442950910,
      srcStart: 1913571383,
      rangeLength: 198033453,
    ),
    AlmanacRecord(
      dstStart: 463085535,
      srcStart: 1458252975,
      rangeLength: 13696838,
    ),
    AlmanacRecord(
      dstStart: 1718210073,
      srcStart: 1686050230,
      rangeLength: 171424511,
    ),
    AlmanacRecord(
      dstStart: 383981385,
      srcStart: 3064707638,
      rangeLength: 71598349,
    ),
    AlmanacRecord(
      dstStart: 1267048154,
      srcStart: 3759577328,
      rangeLength: 175902756,
    ),
    AlmanacRecord(
      dstStart: 3262934306,
      srcStart: 1479455614,
      rangeLength: 206594616,
    ),
    AlmanacRecord(
      dstStart: 2493001016,
      srcStart: 200414015,
      rangeLength: 157177749,
    ),
    AlmanacRecord(
      dstStart: 3885112776,
      srcStart: 411057950,
      rangeLength: 157348766,
    ),
    AlmanacRecord(
      dstStart: 4042461542,
      srcStart: 1181162257,
      rangeLength: 199039568,
    ),
    AlmanacRecord(
      dstStart: 476782373,
      srcStart: 2111604836,
      rangeLength: 790265781,
    ),
    AlmanacRecord(
      dstStart: 455579734,
      srcStart: 1471949813,
      rangeLength: 7505801,
    ),
    AlmanacRecord(
      dstStart: 1889634584,
      srcStart: 3213531697,
      rangeLength: 546045631,
    ),
    AlmanacRecord(
      dstStart: 4241501110,
      srcStart: 357591764,
      rangeLength: 53466186,
    ),
    AlmanacRecord(
      dstStart: 3525625564,
      srcStart: 3935480084,
      rangeLength: 359487212,
    ),
    AlmanacRecord(
      dstStart: 2650178765,
      srcStart: 568406716,
      rangeLength: 612755541,
    ),
    AlmanacRecord(
      dstStart: 200414015,
      srcStart: 1380201825,
      rangeLength: 78051150,
    ),
    AlmanacRecord(
      dstStart: 2435680215,
      srcStart: 3007386837,
      rangeLength: 57320801,
    ),
  ],
  soilToFertilizer: [
    AlmanacRecord(
      dstStart: 513693437,
      srcStart: 1166448955,
      rangeLength: 406316429,
    ),
    AlmanacRecord(
      dstStart: 3977989337,
      srcStart: 1831898517,
      rangeLength: 148449061,
    ),
    AlmanacRecord(
      dstStart: 2857616419,
      srcStart: 1749713256,
      rangeLength: 55966993,
    ),
    AlmanacRecord(
      dstStart: 2245899978,
      srcStart: 767737007,
      rangeLength: 398711948,
    ),
    AlmanacRecord(
      dstStart: 3462028551,
      srcStart: 3402487827,
      rangeLength: 258322330,
    ),
    AlmanacRecord(
      dstStart: 1207747701,
      srcStart: 2246116788,
      rangeLength: 274586148,
    ),
    AlmanacRecord(
      dstStart: 1857449833,
      srcStart: 2520702936,
      rangeLength: 106524473,
    ),
    AlmanacRecord(
      dstStart: 950443356,
      srcStart: 290304833,
      rangeLength: 224196260,
    ),
    AlmanacRecord(
      dstStart: 2913583412,
      srcStart: 1805680249,
      rangeLength: 26218268,
    ),
    AlmanacRecord(
      dstStart: 290304833,
      srcStart: 3849361293,
      rangeLength: 119346889,
    ),
    AlmanacRecord(
      dstStart: 3720350881,
      srcStart: 3244527156,
      rangeLength: 157960671,
    ),
    AlmanacRecord(
      dstStart: 920009866,
      srcStart: 1634093064,
      rangeLength: 30433490,
    ),
    AlmanacRecord(
      dstStart: 409651722,
      srcStart: 2627227409,
      rangeLength: 104041715,
    ),
    AlmanacRecord(
      dstStart: 3916661657,
      srcStart: 1572765384,
      rangeLength: 61327680,
    ),
    AlmanacRecord(
      dstStart: 1624788708,
      srcStart: 2115889182,
      rangeLength: 130227606,
    ),
    AlmanacRecord(
      dstStart: 1963974306,
      srcStart: 3695907849,
      rangeLength: 9066861,
    ),
    AlmanacRecord(
      dstStart: 1755016314,
      srcStart: 1980347578,
      rangeLength: 102433519,
    ),
    AlmanacRecord(
      dstStart: 1973041167,
      srcStart: 3151152620,
      rangeLength: 93374536,
    ),
    AlmanacRecord(
      dstStart: 1482333849,
      srcStart: 710468850,
      rangeLength: 57268157,
    ),
    AlmanacRecord(
      dstStart: 2644611926,
      srcStart: 2899798022,
      rangeLength: 213004493,
    ),
    AlmanacRecord(
      dstStart: 1539602006,
      srcStart: 1664526554,
      rangeLength: 85186702,
    ),
    AlmanacRecord(
      dstStart: 2210802286,
      srcStart: 3660810157,
      rangeLength: 35097692,
    ),
    AlmanacRecord(
      dstStart: 3135769437,
      srcStart: 3968708182,
      rangeLength: 326259114,
    ),
    AlmanacRecord(
      dstStart: 1174639616,
      srcStart: 2082781097,
      rangeLength: 33108085,
    ),
    AlmanacRecord(
      dstStart: 3878311552,
      srcStart: 3112802515,
      rangeLength: 38350105,
    ),
    AlmanacRecord(
      dstStart: 2066415703,
      srcStart: 3704974710,
      rangeLength: 144386583,
    ),
    AlmanacRecord(
      dstStart: 2939801680,
      srcStart: 514501093,
      rangeLength: 195967757,
    ),
    AlmanacRecord(
      dstStart: 4126438398,
      srcStart: 2731269124,
      rangeLength: 168528898,
    ),
  ],
  fertilizerToWater: [
    AlmanacRecord(
      dstStart: 1274667249,
      srcStart: 2789153677,
      rangeLength: 35498097,
    ),
    AlmanacRecord(
      dstStart: 1119124697,
      srcStart: 1423189114,
      rangeLength: 4201717,
    ),
    AlmanacRecord(
      dstStart: 1775973674,
      srcStart: 127038866,
      rangeLength: 409949870,
    ),
    AlmanacRecord(
      dstStart: 2636872711,
      srcStart: 677641697,
      rangeLength: 238584014,
    ),
    AlmanacRecord(
      dstStart: 998550357,
      srcStart: 2708616519,
      rangeLength: 80537158,
    ),
    AlmanacRecord(
      dstStart: 1613168083,
      srcStart: 3037802277,
      rangeLength: 162805591,
    ),
    AlmanacRecord(
      dstStart: 1123326414,
      srcStart: 2618446916,
      rangeLength: 90169603,
    ),
    AlmanacRecord(
      dstStart: 2516959328,
      srcStart: 2034731526,
      rangeLength: 119913383,
    ),
    AlmanacRecord(
      dstStart: 3879305887,
      srcStart: 3993605604,
      rangeLength: 147788774,
    ),
    AlmanacRecord(
      dstStart: 1213496017,
      srcStart: 2616229293,
      rangeLength: 2217623,
    ),
    AlmanacRecord(
      dstStart: 3412445194,
      srcStart: 3202949622,
      rangeLength: 62545934,
    ),
    AlmanacRecord(
      dstStart: 2875456725,
      srcStart: 2194682091,
      rangeLength: 362593593,
    ),
    AlmanacRecord(
      dstStart: 1079087515,
      srcStart: 2154644909,
      rangeLength: 40037182,
    ),
    AlmanacRecord(
      dstStart: 2468026227,
      srcStart: 3426058027,
      rangeLength: 48933101,
    ),
    AlmanacRecord(
      dstStart: 0,
      srcStart: 1427390831,
      rangeLength: 607340695,
    ),
    AlmanacRecord(
      dstStart: 2185923544,
      srcStart: 0,
      rangeLength: 127038866,
    ),
    AlmanacRecord(
      dstStart: 1310165346,
      srcStart: 916225711,
      rangeLength: 76820908,
    ),
    AlmanacRecord(
      dstStart: 2312962410,
      srcStart: 993046619,
      rangeLength: 155063817,
    ),
    AlmanacRecord(
      dstStart: 607340695,
      srcStart: 1369464790,
      rangeLength: 53724324,
    ),
    AlmanacRecord(
      dstStart: 1389328008,
      srcStart: 536988736,
      rangeLength: 140652961,
    ),
    AlmanacRecord(
      dstStart: 1386986254,
      srcStart: 3200607868,
      rangeLength: 2341754,
    ),
    AlmanacRecord(
      dstStart: 4241108893,
      srcStart: 3701026057,
      rangeLength: 53858403,
    ),
    AlmanacRecord(
      dstStart: 661065019,
      srcStart: 2824651774,
      rangeLength: 213150503,
    ),
    AlmanacRecord(
      dstStart: 1529980969,
      srcStart: 3342870913,
      rangeLength: 83187114,
    ),
    AlmanacRecord(
      dstStart: 921175000,
      srcStart: 3265495556,
      rangeLength: 77375357,
    ),
    AlmanacRecord(
      dstStart: 874215522,
      srcStart: 1148110436,
      rangeLength: 46959478,
    ),
    AlmanacRecord(
      dstStart: 4180667579,
      srcStart: 3914761609,
      rangeLength: 60441314,
    ),
    AlmanacRecord(
      dstStart: 3238050318,
      srcStart: 1195069914,
      rangeLength: 174394876,
    ),
    AlmanacRecord(
      dstStart: 3701026057,
      srcStart: 3754884460,
      rangeLength: 159877149,
    ),
    AlmanacRecord(
      dstStart: 4027094661,
      srcStart: 4141394378,
      rangeLength: 153572918,
    ),
    AlmanacRecord(
      dstStart: 3860903206,
      srcStart: 3975202923,
      rangeLength: 18402681,
    ),
    AlmanacRecord(
      dstStart: 1215713640,
      srcStart: 2557275684,
      rangeLength: 58953609,
    ),
  ],
  waterToLight: [
    AlmanacRecord(
      dstStart: 3346671099,
      srcStart: 2139469351,
      rangeLength: 253535694,
    ),
    AlmanacRecord(
      dstStart: 3600206793,
      srcStart: 4187771498,
      rangeLength: 107195798,
    ),
    AlmanacRecord(
      dstStart: 1271601308,
      srcStart: 936374322,
      rangeLength: 163567625,
    ),
    AlmanacRecord(
      dstStart: 3890528820,
      srcStart: 1799438963,
      rangeLength: 144160054,
    ),
    AlmanacRecord(
      dstStart: 1731948725,
      srcStart: 3256631615,
      rangeLength: 148580525,
    ),
    AlmanacRecord(
      dstStart: 3859991790,
      srcStart: 2573461247,
      rangeLength: 250171,
    ),
    AlmanacRecord(
      dstStart: 389304550,
      srcStart: 1099941947,
      rangeLength: 124474859,
    ),
    AlmanacRecord(
      dstStart: 2322259245,
      srcStart: 1445947039,
      rangeLength: 39679535,
    ),
    AlmanacRecord(
      dstStart: 1544278612,
      srcStart: 1943599017,
      rangeLength: 46211136,
    ),
    AlmanacRecord(
      dstStart: 1124738947,
      srcStart: 789511961,
      rangeLength: 146862361,
    ),
    AlmanacRecord(
      dstStart: 3860946526,
      srcStart: 2109887057,
      rangeLength: 29582294,
    ),
    AlmanacRecord(
      dstStart: 891137223,
      srcStart: 173339870,
      rangeLength: 233601724,
    ),
    AlmanacRecord(
      dstStart: 3044858977,
      srcStart: 1485626574,
      rangeLength: 301812122,
    ),
    AlmanacRecord(
      dstStart: 627354019,
      srcStart: 0,
      rangeLength: 173339870,
    ),
    AlmanacRecord(
      dstStart: 800693889,
      srcStart: 1224416806,
      rangeLength: 90443334,
    ),
    AlmanacRecord(
      dstStart: 4046689141,
      srcStart: 2034661517,
      rangeLength: 75225540,
    ),
    AlmanacRecord(
      dstStart: 4166766045,
      srcStart: 4059570247,
      rangeLength: 128201251,
    ),
    AlmanacRecord(
      dstStart: 0,
      srcStart: 1314860140,
      rangeLength: 120308793,
    ),
    AlmanacRecord(
      dstStart: 4034688874,
      srcStart: 1787438696,
      rangeLength: 12000267,
    ),
    AlmanacRecord(
      dstStart: 2294392242,
      srcStart: 2393005045,
      rangeLength: 27867003,
    ),
    AlmanacRecord(
      dstStart: 2361938780,
      srcStart: 2573711418,
      rangeLength: 682920197,
    ),
    AlmanacRecord(
      dstStart: 4121914681,
      srcStart: 1989810153,
      rangeLength: 44851364,
    ),
    AlmanacRecord(
      dstStart: 1674653431,
      srcStart: 3705039670,
      rangeLength: 14123300,
    ),
    AlmanacRecord(
      dstStart: 1445242474,
      srcStart: 3719162970,
      rangeLength: 99036138,
    ),
    AlmanacRecord(
      dstStart: 513779409,
      srcStart: 406941594,
      rangeLength: 113574610,
    ),
    AlmanacRecord(
      dstStart: 3707402591,
      srcStart: 2420872048,
      rangeLength: 152589199,
    ),
    AlmanacRecord(
      dstStart: 2053021103,
      srcStart: 3818199108,
      rangeLength: 241371139,
    ),
    AlmanacRecord(
      dstStart: 3860241961,
      srcStart: 1445242474,
      rangeLength: 704565,
    ),
    AlmanacRecord(
      dstStart: 1880529250,
      srcStart: 3489375823,
      rangeLength: 172491853,
    ),
    AlmanacRecord(
      dstStart: 1688776731,
      srcStart: 3661867676,
      rangeLength: 43171994,
    ),
    AlmanacRecord(
      dstStart: 120308793,
      srcStart: 520516204,
      rangeLength: 268995757,
    ),
    AlmanacRecord(
      dstStart: 1590489748,
      srcStart: 3405212140,
      rangeLength: 84163683,
    ),
  ],
  lightToTemperature: [
    AlmanacRecord(
      dstStart: 1711282888,
      srcStart: 1572780528,
      rangeLength: 87721767,
    ),
    AlmanacRecord(
      dstStart: 154126417,
      srcStart: 0,
      rangeLength: 43277112,
    ),
    AlmanacRecord(
      dstStart: 950353983,
      srcStart: 1343526858,
      rangeLength: 179094373,
    ),
    AlmanacRecord(
      dstStart: 2607445049,
      srcStart: 2714989532,
      rangeLength: 110883165,
    ),
    AlmanacRecord(
      dstStart: 197403529,
      srcStart: 400138402,
      rangeLength: 104876963,
    ),
    AlmanacRecord(
      dstStart: 302280492,
      srcStart: 43277112,
      rangeLength: 202734873,
    ),
    AlmanacRecord(
      dstStart: 2990325458,
      srcStart: 1942480091,
      rangeLength: 22763517,
    ),
    AlmanacRecord(
      dstStart: 2203652414,
      srcStart: 1550069916,
      rangeLength: 22710612,
    ),
    AlmanacRecord(
      dstStart: 3347561974,
      srcStart: 4075093920,
      rangeLength: 130901113,
    ),
    AlmanacRecord(
      dstStart: 1328424170,
      srcStart: 3514387681,
      rangeLength: 17133869,
    ),
    AlmanacRecord(
      dstStart: 3187047160,
      srcStart: 4220120429,
      rangeLength: 74846867,
    ),
    AlmanacRecord(
      dstStart: 3555672228,
      srcStart: 4205995033,
      rangeLength: 676520,
    ),
    AlmanacRecord(
      dstStart: 555737175,
      srcStart: 2292503071,
      rangeLength: 178861674,
    ),
    AlmanacRecord(
      dstStart: 936905107,
      srcStart: 4206671553,
      rangeLength: 13448876,
    ),
    AlmanacRecord(
      dstStart: 2718328214,
      srcStart: 2825872697,
      rangeLength: 25755942,
    ),
    AlmanacRecord(
      dstStart: 2042629442,
      srcStart: 945726244,
      rangeLength: 118907923,
    ),
    AlmanacRecord(
      dstStart: 2161537365,
      srcStart: 3027858084,
      rangeLength: 42115049,
    ),
    AlmanacRecord(
      dstStart: 1657501024,
      srcStart: 1888698227,
      rangeLength: 53781864,
    ),
    AlmanacRecord(
      dstStart: 2943656210,
      srcStart: 3804007444,
      rangeLength: 46669248,
    ),
    AlmanacRecord(
      dstStart: 2226363026,
      srcStart: 2004226072,
      rangeLength: 108596129,
    ),
    AlmanacRecord(
      dstStart: 0,
      srcStart: 246011985,
      rangeLength: 154126417,
    ),
    AlmanacRecord(
      dstStart: 734598849,
      srcStart: 2928837780,
      rangeLength: 99020304,
    ),
    AlmanacRecord(
      dstStart: 833619153,
      srcStart: 1660502295,
      rangeLength: 103285954,
    ),
    AlmanacRecord(
      dstStart: 2744084156,
      srcStart: 3436875901,
      rangeLength: 77511780,
    ),
    AlmanacRecord(
      dstStart: 1299692440,
      srcStart: 2112822201,
      rangeLength: 28731730,
    ),
    AlmanacRecord(
      dstStart: 2821595936,
      srcStart: 782812975,
      rangeLength: 122060274,
    ),
    AlmanacRecord(
      dstStart: 1799004655,
      srcStart: 2471364745,
      rangeLength: 95185072,
    ),
    AlmanacRecord(
      dstStart: 3082783503,
      srcStart: 1965243608,
      rangeLength: 38982464,
    ),
    AlmanacRecord(
      dstStart: 2334959155,
      srcStart: 3531521550,
      rangeLength: 272485894,
    ),
    AlmanacRecord(
      dstStart: 3121765967,
      srcStart: 2227221878,
      rangeLength: 65281193,
    ),
    AlmanacRecord(
      dstStart: 1392230801,
      srcStart: 3850676692,
      rangeLength: 224417228,
    ),
    AlmanacRecord(
      dstStart: 3013088975,
      srcStart: 528288490,
      rangeLength: 69694528,
    ),
    AlmanacRecord(
      dstStart: 1616648029,
      srcStart: 904873249,
      rangeLength: 40852995,
    ),
    AlmanacRecord(
      dstStart: 1345558039,
      srcStart: 3069973133,
      rangeLength: 46672762,
    ),
    AlmanacRecord(
      dstStart: 3681258726,
      srcStart: 1064634167,
      rangeLength: 278892691,
    ),
    AlmanacRecord(
      dstStart: 1894189727,
      srcStart: 2566549817,
      rangeLength: 148439715,
    ),
    AlmanacRecord(
      dstStart: 1129448356,
      srcStart: 597983018,
      rangeLength: 170244084,
    ),
    AlmanacRecord(
      dstStart: 3261894027,
      srcStart: 2141553931,
      rangeLength: 85667947,
    ),
    AlmanacRecord(
      dstStart: 3478463087,
      srcStart: 2851628639,
      rangeLength: 77209141,
    ),
    AlmanacRecord(
      dstStart: 3556348748,
      srcStart: 1763788249,
      rangeLength: 124909978,
    ),
    AlmanacRecord(
      dstStart: 4280381423,
      srcStart: 768227102,
      rangeLength: 14585873,
    ),
    AlmanacRecord(
      dstStart: 528288490,
      srcStart: 1522621231,
      rangeLength: 27448685,
    ),
    AlmanacRecord(
      dstStart: 3960151417,
      srcStart: 3116645895,
      rangeLength: 320230006,
    ),
  ],
  temperatureToHumidity: [
    AlmanacRecord(
      dstStart: 2401309547,
      srcStart: 2063893326,
      rangeLength: 5931150,
    ),
    AlmanacRecord(
      dstStart: 4081820678,
      srcStart: 1536756293,
      rangeLength: 195703517,
    ),
    AlmanacRecord(
      dstStart: 3389837279,
      srcStart: 4114880485,
      rangeLength: 97950323,
    ),
    AlmanacRecord(
      dstStart: 67647704,
      srcStart: 537880870,
      rangeLength: 95615044,
    ),
    AlmanacRecord(
      dstStart: 3487787602,
      srcStart: 2069824476,
      rangeLength: 16209316,
    ),
    AlmanacRecord(
      dstStart: 212366581,
      srcStart: 0,
      rangeLength: 210367924,
    ),
    AlmanacRecord(
      dstStart: 0,
      srcStart: 470233166,
      rangeLength: 67647704,
    ),
    AlmanacRecord(
      dstStart: 163262748,
      srcStart: 331958016,
      rangeLength: 49103833,
    ),
    AlmanacRecord(
      dstStart: 3921228390,
      srcStart: 3754997923,
      rangeLength: 26024946,
    ),
    AlmanacRecord(
      dstStart: 1883070873,
      srcStart: 986328296,
      rangeLength: 29590327,
    ),
    AlmanacRecord(
      dstStart: 1844673227,
      srcStart: 4256569650,
      rangeLength: 38397646,
    ),
    AlmanacRecord(
      dstStart: 422734505,
      srcStart: 381061849,
      rangeLength: 89171317,
    ),
    AlmanacRecord(
      dstStart: 3835004067,
      srcStart: 4212830808,
      rangeLength: 43738842,
    ),
    AlmanacRecord(
      dstStart: 1753523088,
      srcStart: 1732459810,
      rangeLength: 63479835,
    ),
    AlmanacRecord(
      dstStart: 4277524195,
      srcStart: 3781022869,
      rangeLength: 17443101,
    ),
    AlmanacRecord(
      dstStart: 926010074,
      srcStart: 3798465970,
      rangeLength: 316414515,
    ),
    AlmanacRecord(
      dstStart: 511905822,
      srcStart: 210367924,
      rangeLength: 31838014,
    ),
    AlmanacRecord(
      dstStart: 3565158997,
      srcStart: 3485152853,
      rangeLength: 269845070,
    ),
    AlmanacRecord(
      dstStart: 3878742909,
      srcStart: 776643827,
      rangeLength: 42485481,
    ),
    AlmanacRecord(
      dstStart: 3352296690,
      srcStart: 1795939645,
      rangeLength: 37540589,
    ),
    AlmanacRecord(
      dstStart: 2877358153,
      srcStart: 2512426556,
      rangeLength: 474938537,
    ),
    AlmanacRecord(
      dstStart: 1419995251,
      srcStart: 1068661114,
      rangeLength: 304321846,
    ),
    AlmanacRecord(
      dstStart: 1348461498,
      srcStart: 705110074,
      rangeLength: 71533753,
    ),
    AlmanacRecord(
      dstStart: 1724317097,
      srcStart: 1372982960,
      rangeLength: 29205991,
    ),
    AlmanacRecord(
      dstStart: 1974916783,
      srcStart: 2086033792,
      rangeLength: 426392764,
    ),
    AlmanacRecord(
      dstStart: 2407240697,
      srcStart: 3015035397,
      rangeLength: 470117456,
    ),
    AlmanacRecord(
      dstStart: 1242424589,
      srcStart: 880291387,
      rangeLength: 106036909,
    ),
    AlmanacRecord(
      dstStart: 642854491,
      srcStart: 1833480234,
      rangeLength: 230413092,
    ),
    AlmanacRecord(
      dstStart: 3503996918,
      srcStart: 819129308,
      rangeLength: 61162079,
    ),
    AlmanacRecord(
      dstStart: 543743836,
      srcStart: 242205938,
      rangeLength: 89752078,
    ),
    AlmanacRecord(
      dstStart: 873267583,
      srcStart: 1015918623,
      rangeLength: 52742491,
    ),
    AlmanacRecord(
      dstStart: 1817002923,
      srcStart: 2987365093,
      rangeLength: 27670304,
    ),
    AlmanacRecord(
      dstStart: 1912661200,
      srcStart: 642854491,
      rangeLength: 62255583,
    ),
    AlmanacRecord(
      dstStart: 3947253336,
      srcStart: 1402188951,
      rangeLength: 134567342,
    ),
  ],
  humidityToLocation: [
    AlmanacRecord(
      dstStart: 2955816171,
      srcStart: 2260659770,
      rangeLength: 927037009,
    ),
    AlmanacRecord(
      dstStart: 1906648752,
      srcStart: 2188942242,
      rangeLength: 71717528,
    ),
    AlmanacRecord(
      dstStart: 848878920,
      srcStart: 35928575,
      rangeLength: 8026852,
    ),
    AlmanacRecord(
      dstStart: 4100692468,
      srcStart: 1994667414,
      rangeLength: 194274828,
    ),
    AlmanacRecord(
      dstStart: 2066384942,
      srcStart: 3405536067,
      rangeLength: 889431229,
    ),
    AlmanacRecord(
      dstStart: 559945395,
      srcStart: 1052613350,
      rangeLength: 288933525,
    ),
    AlmanacRecord(
      dstStart: 3882853180,
      srcStart: 3187696779,
      rangeLength: 217839288,
    ),
    AlmanacRecord(
      dstStart: 856905772,
      srcStart: 1341546875,
      rangeLength: 164300625,
    ),
    AlmanacRecord(
      dstStart: 0,
      srcStart: 528596530,
      rangeLength: 524016820,
    ),
    AlmanacRecord(
      dstStart: 1978366280,
      srcStart: 1723924810,
      rangeLength: 88018662,
    ),
    AlmanacRecord(
      dstStart: 1044385850,
      srcStart: 67134880,
      rangeLength: 400987760,
    ),
    AlmanacRecord(
      dstStart: 524016820,
      srcStart: 0,
      rangeLength: 35928575,
    ),
    AlmanacRecord(
      dstStart: 1021206397,
      srcStart: 43955427,
      rangeLength: 23179453,
    ),
    AlmanacRecord(
      dstStart: 1445373610,
      srcStart: 468122640,
      rangeLength: 60473890,
    ),
    AlmanacRecord(
      dstStart: 1723924810,
      srcStart: 1811943472,
      rangeLength: 182723942,
    ),
  ],
);
