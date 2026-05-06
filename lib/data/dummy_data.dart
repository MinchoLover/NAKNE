import '../models/course_place.dart';
import '../models/local_course.dart';
import '../models/tourist_spot.dart';

const List<TouristSpot> touristSpots = [
  TouristSpot(
    id: 'homigot',
    name: '호미곶',
    description: '일출 방문 흐름이 강한 대표 관광지로, 대보항과 구룡포 생활권으로 전환하기 좋은 해안 거점입니다.',
    tags: ['일출', '해안', '항구연결'],
    statusBadge: '구룡포 전환 추천',
    localSwitchCount: 2,
    courses: [
      LocalCourse(
        id: 'homigot_coast_local',
        spotId: 'homigot',
        title: '호미곶 해안 로컬 코스',
        summary: '해맞이광장 방문 후 대보항과 해안 산책길을 거쳐 구룡포 방향으로 흐름을 넓히는 코스',
        duration: '약 2시간',
        distance: '약 4.1km',
        recommendedTime: '오전 8시 이후',
        switchScore: 88,
        tags: ['해안산책', '항구연결', '구룡포확장'],
        reason:
            '일출 관람 직후 호미곶에 머무는 방문 흐름을 대보항과 구룡포 방면으로 분산해 항구 생활권 체류를 만들 수 있습니다.',
        congestionReliefScore: 86,
        localBusinessScore: 84,
        walkingScore: 78,
        stayExtensionScore: 89,
        dispersionScore: 90,
        places: [
          CoursePlace(
            id: 'homigot_sunrise_square',
            name: '호미곶 해맞이광장',
            type: '대표관광지',
            description: '포항을 대표하는 일출 명소로 코스의 시작점입니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'daebo_harbor',
            name: '대보항',
            type: '항구생활권',
            description: '관광지에서 가까운 항구로 어선과 생활 상권의 분위기를 함께 볼 수 있습니다.',
            stayTime: '25분',
          ),
          CoursePlace(
            id: 'homigot_coastal_walk',
            name: '호미곶 해안 산책길',
            type: '해안산책',
            description: '해맞이광장의 밀집된 동선을 바다 가장자리 산책 흐름으로 풀어주는 구간입니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'daebo_local_cafe',
            name: '대보 로컬 카페',
            type: '로컬상권',
            description: '항구 주변에서 짧게 쉬며 지역 상권 소비로 이어지기 좋은 휴식 지점입니다.',
            stayTime: '35분',
          ),
          CoursePlace(
            id: 'guryongpo_link_point',
            name: '구룡포 방면 이동 지점',
            type: '생활권연결',
            description: '호미곶 방문을 끝점이 아닌 구룡포 생활권으로 이어주는 전환 노드입니다.',
            stayTime: '20분',
          ),
        ],
      ),
      LocalCourse(
        id: 'homigot_harbor_mood',
        spotId: 'homigot',
        title: '호미곶 항구 감성 코스',
        summary: '호미곶 상징 경관에서 대보항 식당과 바다 전망길로 이어지는 식사형 전환 동선',
        duration: '약 1시간 50분',
        distance: '약 3.2km',
        recommendedTime: '오전 10시~오후 2시',
        switchScore: 84,
        tags: ['항구식사', '바다전망', '로컬휴식'],
        reason: '사진 촬영 중심의 짧은 방문을 항구 식사와 전망 산책으로 확장해 호미곶 주변 소비와 체류 시간을 늘립니다.',
        congestionReliefScore: 80,
        localBusinessScore: 91,
        walkingScore: 76,
        stayExtensionScore: 86,
        dispersionScore: 82,
        places: [
          CoursePlace(
            id: 'homigot_symbol_area',
            name: '호미곶 상징광장',
            type: '대표관광지',
            description: '상생의 손과 광장 경관을 둘러보며 항구 방향 전환을 시작하는 지점입니다.',
            stayTime: '25분',
          ),
          CoursePlace(
            id: 'daebo_harbor_lane',
            name: '대보항 골목',
            type: '항구생활권',
            description: '작은 항구 골목을 따라 대표 관광지 밖 생활권의 밀도를 체감할 수 있습니다.',
            stayTime: '20분',
          ),
          CoursePlace(
            id: 'daebo_seafood_restaurant',
            name: '대보항 해산물 식당',
            type: '로컬식당',
            description: '해안 방문객을 인근 식당 소비로 연결하는 핵심 로컬 상권 지점입니다.',
            stayTime: '45분',
          ),
          CoursePlace(
            id: 'homigot_ocean_view_path',
            name: '호미곶 바다 전망길',
            type: '전망산책',
            description: '식사 후 짧은 해안 산책으로 이동 부담 없이 체류를 연장할 수 있습니다.',
            stayTime: '25분',
          ),
          CoursePlace(
            id: 'homigot_local_cafe',
            name: '호미곶 로컬 카페',
            type: '로컬상권',
            description: '코스의 마지막 체류 지점으로 다음 목적지 탐색 전 쉬어가기 좋습니다.',
            stayTime: '25분',
          ),
        ],
      ),
    ],
  ),
  TouristSpot(
    id: 'yeongildae',
    name: '영일대해수욕장',
    description: '야간 해변 방문이 집중되는 포항의 대표 수변 공간으로 포항운하와 죽도시장 연결성이 높습니다.',
    tags: ['야간해변', '해상누각', '시장연결'],
    statusBadge: '야간 분산 추천',
    localSwitchCount: 2,
    courses: [
      LocalCourse(
        id: 'yeongildae_night_walk',
        spotId: 'yeongildae',
        title: '영일대 로컬 야간 산책 코스',
        summary: '해변 야경에서 포항운하와 죽도시장으로 이어지는 저녁형 로컬 전환 동선',
        duration: '약 2시간 10분',
        distance: '약 3.4km',
        recommendedTime: '오후 5시 이후',
        switchScore: 91,
        tags: ['야간산책', '시장연결', '도보전환'],
        reason: '영일대에 집중된 야간 방문 흐름을 포항운하와 죽도시장 방향으로 자연스럽게 분산할 수 있는 코스입니다.',
        congestionReliefScore: 88,
        localBusinessScore: 92,
        walkingScore: 84,
        stayExtensionScore: 90,
        dispersionScore: 87,
        places: [
          CoursePlace(
            id: 'yeongildae_beach',
            name: '영일대해수욕장',
            type: '대표관광지',
            description: '야간 방문과 산책 수요가 높은 해변으로 코스의 출발점입니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'yeongildae_pavilion',
            name: '영일대 해상누각',
            type: '전망명소',
            description: '해변 방문객이 많이 모이는 지점으로 이후 동선을 분산하기 좋은 관찰 포인트입니다.',
            stayTime: '20분',
          ),
          CoursePlace(
            id: 'yeongildae_cafe_street',
            name: '영일대 카페거리',
            type: '로컬상권',
            description: '해변 체류를 주변 상권 소비로 연결하는 저녁 시간대 핵심 구간입니다.',
            stayTime: '35분',
          ),
          CoursePlace(
            id: 'pohang_canal_night',
            name: '포항운하',
            type: '수변산책',
            description: '해변의 붐비는 흐름을 도시 수변 산책로로 완만하게 전환합니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'jukdo_market_evening',
            name: '죽도시장',
            type: '전통시장',
            description: '야간 식사와 먹거리 소비로 이어져 해변 방문 이후 체류를 늘립니다.',
            stayTime: '35분',
          ),
        ],
      ),
      LocalCourse(
        id: 'yeongildae_market_link',
        spotId: 'yeongildae',
        title: '영일대 바다·시장 연결 코스',
        summary: '해안 산책과 로컬 식사를 거쳐 죽도시장과 중앙상가로 이어지는 소비 확장 코스',
        duration: '약 2시간 30분',
        distance: '약 4.0km',
        recommendedTime: '오후 3시~저녁',
        switchScore: 89,
        tags: ['바다산책', '먹거리', '상권연결'],
        reason: '해변 중심 관광을 식사와 시장 방문으로 이어 붙여 영일대 주변에 머물던 수요를 도심 상권으로 확장합니다.',
        congestionReliefScore: 85,
        localBusinessScore: 94,
        walkingScore: 82,
        stayExtensionScore: 88,
        dispersionScore: 84,
        places: [
          CoursePlace(
            id: 'yeongildae_start',
            name: '영일대 해변 입구',
            type: '대표관광지',
            description: '해변 방문객이 쉽게 인지할 수 있는 출발 지점입니다.',
            stayTime: '20분',
          ),
          CoursePlace(
            id: 'yeongildae_coastal_path',
            name: '영일대 해안 산책로',
            type: '해안산책',
            description: '바다를 따라 이동하며 다음 상권으로 넘어가기 전 체류 밀도를 낮춥니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'yeongildae_local_restaurant',
            name: '영일대 로컬 식당',
            type: '로컬식당',
            description: '해변 주변 식사 수요를 지역 상권으로 연결하는 중간 지점입니다.',
            stayTime: '45분',
          ),
          CoursePlace(
            id: 'jukdo_market_link',
            name: '죽도시장',
            type: '전통시장',
            description: '먹거리와 장보기 경험으로 이어져 단순 해변 방문을 로컬 소비로 전환합니다.',
            stayTime: '40분',
          ),
          CoursePlace(
            id: 'central_shopping_street',
            name: '중앙상가',
            type: '도심상권',
            description: '시장 방문 이후 도심 보행과 소규모 소비를 이어갈 수 있는 종착 구간입니다.',
            stayTime: '25분',
          ),
        ],
      ),
    ],
  ),
  TouristSpot(
    id: 'space_walk',
    name: '스페이스워크',
    description: '전망 체험 이후 체류가 짧아지기 쉬운 관광지로 환호공원과 영일대 방향 전환 설계가 중요합니다.',
    tags: ['전망', '환호공원', '영일대연결'],
    statusBadge: '전망 이후 전환 필요',
    localSwitchCount: 2,
    courses: [
      LocalCourse(
        id: 'space_walk_local_switch',
        spotId: 'space_walk',
        title: '환호공원 이후 로컬 전환 코스',
        summary: '스페이스워크 전망 체험 후 공원 산책과 영일대 식사, 죽도시장까지 흐름을 늘리는 코스',
        duration: '약 2시간 40분',
        distance: '약 4.8km',
        recommendedTime: '오후 2시 이후',
        switchScore: 87,
        tags: ['전망후전환', '공원산책', '시장확장'],
        reason: '전망 시설에서 끝나는 짧은 방문을 환호공원 보행과 영일대 상권, 죽도시장 소비로 연결해 체류 범위를 넓힙니다.',
        congestionReliefScore: 83,
        localBusinessScore: 89,
        walkingScore: 80,
        stayExtensionScore: 91,
        dispersionScore: 86,
        places: [
          CoursePlace(
            id: 'space_walk_landmark',
            name: '스페이스워크',
            type: '대표관광지',
            description: '전망 체험 수요가 집중되는 출발 지점입니다.',
            stayTime: '35분',
          ),
          CoursePlace(
            id: 'hwanho_park_trail',
            name: '환호공원 산책로',
            type: '공원산책',
            description: '전망 체험 직후 인파를 공원 내부 보행 흐름으로 자연스럽게 분산합니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'yeongildae_after_spacewalk',
            name: '영일대해수욕장',
            type: '해변연결',
            description: '환호공원에서 바다 방향으로 이어지는 대표적인 전환 목적지입니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'yeongildae_meal_stop',
            name: '영일대 로컬 식당',
            type: '로컬식당',
            description: '전망 관광 이후 식사 체류로 전환하기 좋은 상권 지점입니다.',
            stayTime: '45분',
          ),
          CoursePlace(
            id: 'jukdo_market_after_spacewalk',
            name: '죽도시장',
            type: '전통시장',
            description: '영일대 이후 시장 먹거리 소비로 코스의 로컬 전환 효과를 높입니다.',
            stayTime: '40분',
          ),
        ],
      ),
      LocalCourse(
        id: 'space_walk_ocean_walk',
        spotId: 'space_walk',
        title: '전망 이후 바다 산책 코스',
        summary: '스페이스워크와 환호공원을 지나 해안도로, 카페거리, 영일대로 이어지는 가벼운 산책형 동선',
        duration: '약 1시간 55분',
        distance: '약 3.6km',
        recommendedTime: '오후 4시~일몰 전',
        switchScore: 82,
        tags: ['바다전망', '카페거리', '가벼운산책'],
        reason: '전망 관람 후 바로 이동하는 방문객을 해안도로와 카페거리로 유도해 환호공원 밖 생활권 접점을 만듭니다.',
        congestionReliefScore: 79,
        localBusinessScore: 85,
        walkingScore: 88,
        stayExtensionScore: 83,
        dispersionScore: 80,
        places: [
          CoursePlace(
            id: 'space_walk_view',
            name: '스페이스워크 전망 구간',
            type: '대표관광지',
            description: '도시와 바다를 조망한 뒤 다음 보행 동선을 선택하는 시작점입니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'hwanho_park_plaza',
            name: '환호공원',
            type: '공원',
            description: '전망 시설 주변 체류를 완충하며 해안 방향 이동을 준비하는 공간입니다.',
            stayTime: '25분',
          ),
          CoursePlace(
            id: 'hwanho_coastal_road',
            name: '환호 해안도로',
            type: '해안산책',
            description: '공원 방문객을 바다 가장자리 보행 흐름으로 전환합니다.',
            stayTime: '25분',
          ),
          CoursePlace(
            id: 'duho_cafe_street',
            name: '두호동 카페거리',
            type: '로컬상권',
            description: '짧은 전망 관광을 카페 체류와 주변 소비로 연결합니다.',
            stayTime: '35분',
          ),
          CoursePlace(
            id: 'yeongildae_finish',
            name: '영일대해수욕장',
            type: '해변',
            description: '해안 산책의 종착점으로 야간 코스나 식사 코스로 이어지기 좋습니다.',
            stayTime: '30분',
          ),
        ],
      ),
    ],
  ),
  TouristSpot(
    id: 'jukdo_market',
    name: '죽도시장',
    description: '먹거리 소비가 강한 전통시장으로 포항운하와 철길숲을 활용하면 체류 시간을 확장할 수 있습니다.',
    tags: ['전통시장', '먹거리', '물길산책'],
    statusBadge: '체류 확장 우수',
    localSwitchCount: 2,
    courses: [
      LocalCourse(
        id: 'jukdo_water_walk',
        spotId: 'jukdo_market',
        title: '시장 이후 물길 산책 코스',
        summary: '죽도시장 먹거리 방문 후 포항운하와 송도해수욕장, 중앙상가, 철길숲으로 체류를 넓히는 코스',
        duration: '약 2시간 35분',
        distance: '약 4.5km',
        recommendedTime: '점심 이후',
        switchScore: 90,
        tags: ['물길산책', '도심상권', '체류확장'],
        reason: '시장 내부 소비에서 끝나는 흐름을 물길 산책과 도심 보행으로 확장해 방문객 체류 시간을 길게 만듭니다.',
        congestionReliefScore: 87,
        localBusinessScore: 90,
        walkingScore: 83,
        stayExtensionScore: 93,
        dispersionScore: 88,
        places: [
          CoursePlace(
            id: 'jukdo_market_main',
            name: '죽도시장',
            type: '대표관광지',
            description: '먹거리와 수산물 소비가 집중되는 포항 대표 전통시장입니다.',
            stayTime: '45분',
          ),
          CoursePlace(
            id: 'pohang_canal_walk',
            name: '포항운하',
            type: '수변산책',
            description: '시장 방문 후 밀집도를 낮추며 물길을 따라 이동하는 전환 구간입니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'songdo_beach',
            name: '송도해수욕장',
            type: '해변산책',
            description: '시장과 도심에서 바다 방향으로 체류 경험을 넓히는 산책 지점입니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'central_street_after_jukdo',
            name: '중앙상가',
            type: '도심상권',
            description: '시장 이후 도심 쇼핑과 카페 소비로 이어질 수 있는 생활권입니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'pohang_rail_forest',
            name: '포항 철길숲',
            type: '도심녹지',
            description: '코스 후반의 보행 피로를 줄이고 체류를 안정적으로 마무리하는 녹지 공간입니다.',
            stayTime: '30분',
          ),
        ],
      ),
      LocalCourse(
        id: 'jukdo_food_extension',
        spotId: 'jukdo_market',
        title: '죽도시장 먹거리 확장 코스',
        summary: '시장 먹거리에서 로컬 식당, 운하 카페, 철길숲 산책으로 이어지는 느린 소비형 동선',
        duration: '약 2시간 20분',
        distance: '약 3.8km',
        recommendedTime: '오후 1시~5시',
        switchScore: 86,
        tags: ['먹거리확장', '카페휴식', '철길숲'],
        reason: '시장 방문객을 주변 식당과 카페, 철길숲으로 분산해 단일 소비 지점에 머무르지 않는 로컬 순환을 만듭니다.',
        congestionReliefScore: 82,
        localBusinessScore: 93,
        walkingScore: 81,
        stayExtensionScore: 89,
        dispersionScore: 84,
        places: [
          CoursePlace(
            id: 'jukdo_food_alley',
            name: '죽도시장 먹거리 골목',
            type: '전통시장',
            description: '시장 방문객의 식사와 간식 수요가 모이는 시작 지점입니다.',
            stayTime: '35분',
          ),
          CoursePlace(
            id: 'jukdo_local_restaurant',
            name: '시장 주변 로컬 식당',
            type: '로컬식당',
            description: '시장 바깥 상권까지 소비 범위를 넓히는 식사 지점입니다.',
            stayTime: '40분',
          ),
          CoursePlace(
            id: 'pohang_canal_rest',
            name: '포항운하 산책 구간',
            type: '수변산책',
            description: '먹거리 중심 방문 후 가볍게 걷도록 유도하는 전환 구간입니다.',
            stayTime: '25분',
          ),
          CoursePlace(
            id: 'canal_local_cafe',
            name: '운하 근처 카페',
            type: '로컬카페',
            description: '시장 이후 휴식 체류를 만들고 주변 상권 체감도를 높입니다.',
            stayTime: '35분',
          ),
          CoursePlace(
            id: 'rail_forest_finish',
            name: '철길숲',
            type: '도심녹지',
            description: '먹거리 코스를 산책과 휴식으로 마무리하며 체류 시간을 자연스럽게 늘립니다.',
            stayTime: '25분',
          ),
        ],
      ),
    ],
  ),
  TouristSpot(
    id: 'guryongpo_house_street',
    name: '구룡포 일본인 가옥거리',
    description: '근대문화거리 방문 흐름을 구룡포시장, 항구, 과메기문화관으로 연결하기 좋은 역사·항구 생활권입니다.',
    tags: ['근대문화', '항구생활', '시장연결'],
    statusBadge: '항구생활권 연결 우수',
    localSwitchCount: 2,
    courses: [
      LocalCourse(
        id: 'guryongpo_harbor_life',
        spotId: 'guryongpo_house_street',
        title: '구룡포 항구생활권 코스',
        summary: '일본인 가옥거리에서 시장과 항구, 과메기문화관, 해안 산책길로 이어지는 생활권 체감 코스',
        duration: '약 2시간 15분',
        distance: '약 3.1km',
        recommendedTime: '오전 11시~오후 4시',
        switchScore: 92,
        tags: ['항구생활', '시장연결', '문화확장'],
        reason:
            '역사 거리 관람으로 끝나는 방문을 시장과 항구의 생활 장면, 과메기 문화 콘텐츠로 확장해 지역성을 선명하게 보여줍니다.',
        congestionReliefScore: 89,
        localBusinessScore: 95,
        walkingScore: 85,
        stayExtensionScore: 90,
        dispersionScore: 91,
        places: [
          CoursePlace(
            id: 'guryongpo_house_street_start',
            name: '일본인 가옥거리',
            type: '대표관광지',
            description: '근대문화 경관을 보기 위해 방문객이 모이는 구룡포의 대표 지점입니다.',
            stayTime: '35분',
          ),
          CoursePlace(
            id: 'guryongpo_market',
            name: '구룡포시장',
            type: '전통시장',
            description: '역사 관광 이후 지역 먹거리와 생활 상권으로 전환되는 핵심 장소입니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'guryongpo_harbor',
            name: '구룡포항',
            type: '항구생활권',
            description: '항구의 작업 풍경과 바다 생활권을 직접 느낄 수 있는 구간입니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'gwamegi_culture_center',
            name: '과메기문화관',
            type: '문화공간',
            description: '구룡포의 계절 먹거리와 지역 산업 이야기를 연결하는 문화 지점입니다.',
            stayTime: '30분',
          ),
          CoursePlace(
            id: 'guryongpo_coastal_walk',
            name: '구룡포 해안 산책길',
            type: '해안산책',
            description: '시장과 항구 방문 뒤 바다를 따라 체류를 마무리하는 산책 구간입니다.',
            stayTime: '30분',
          ),
        ],
      ),
      LocalCourse(
        id: 'guryongpo_history_market',
        spotId: 'guryongpo_house_street',
        title: '구룡포 역사·시장 코스',
        summary: '근대문화거리의 역사 감상 후 구룡포시장, 항구, 로컬 카페로 이어지는 짧고 밀도 있는 전환 코스',
        duration: '약 1시간 55분',
        distance: '약 2.4km',
        recommendedTime: '오후 1시~일몰 전',
        switchScore: 88,
        tags: ['역사산책', '시장소비', '항구카페'],
        reason: '사진 중심의 거리 방문을 시장 먹거리와 항구 주변 휴식으로 연결해 구룡포 안에서 소비와 보행을 순환시킵니다.',
        congestionReliefScore: 84,
        localBusinessScore: 94,
        walkingScore: 87,
        stayExtensionScore: 86,
        dispersionScore: 85,
        places: [
          CoursePlace(
            id: 'guryongpo_modern_street',
            name: '근대문화거리',
            type: '역사문화',
            description: '일본인 가옥거리 주변의 역사적 분위기를 걸으며 이해하는 구간입니다.',
            stayTime: '25분',
          ),
          CoursePlace(
            id: 'guryongpo_stair_view',
            name: '구룡포 계단 전망',
            type: '전망포인트',
            description: '거리 관람객을 항구와 시장 방향으로 안내하기 좋은 중간 전망 지점입니다.',
            stayTime: '15분',
          ),
          CoursePlace(
            id: 'guryongpo_market_food',
            name: '구룡포시장 먹거리',
            type: '전통시장',
            description: '역사 산책 이후 지역 먹거리 소비로 자연스럽게 이어집니다.',
            stayTime: '35분',
          ),
          CoursePlace(
            id: 'guryongpo_harbor_edge',
            name: '구룡포항 가장자리',
            type: '항구산책',
            description: '시장 방문 후 항구 생활권의 실제 풍경을 가까이서 볼 수 있습니다.',
            stayTime: '20분',
          ),
          CoursePlace(
            id: 'guryongpo_local_cafe',
            name: '구룡포 로컬 카페',
            type: '로컬상권',
            description: '코스의 마지막 휴식 지점으로 역사와 항구 방문의 체류 시간을 늘립니다.',
            stayTime: '30분',
          ),
        ],
      ),
    ],
  ),
];

void validateDummyData() {
  _ensure(touristSpots.length == 5, '관광지는 정확히 5개여야 합니다.');

  for (final spot in touristSpots) {
    _ensure(spot.id.trim().isNotEmpty, 'TouristSpot.id가 비어 있습니다.');
    _ensure(
      spot.name.trim().isNotEmpty,
      '${spot.id}: TouristSpot.name이 비어 있습니다.',
    );
    _ensure(
      spot.description.trim().isNotEmpty,
      '${spot.id}: TouristSpot.description이 비어 있습니다.',
    );
    _ensure(spot.courses.length >= 2, '${spot.id}: 각 관광지에는 최소 2개 코스가 있어야 합니다.');
    _ensure(
      spot.localSwitchCount == spot.courses.length,
      '${spot.id}: localSwitchCount가 courses.length와 일치하지 않습니다.',
    );

    final courseIds = <String>{};
    for (final course in spot.courses) {
      _ensure(
        courseIds.add(course.id),
        '${spot.id}: 중복된 LocalCourse.id가 있습니다. (${course.id})',
      );
      _ensure(
        course.spotId == spot.id,
        '${course.id}: LocalCourse.spotId가 부모 TouristSpot.id와 일치하지 않습니다.',
      );
      _validateCourse(course);
    }
  }
}

void _validateCourse(LocalCourse course) {
  _ensure(course.id.trim().isNotEmpty, 'LocalCourse.id가 비어 있습니다.');
  _ensure(course.spotId.trim().isNotEmpty, '${course.id}: spotId가 비어 있습니다.');
  _ensure(course.title.trim().isNotEmpty, '${course.id}: title이 비어 있습니다.');
  _ensure(course.summary.trim().isNotEmpty, '${course.id}: summary가 비어 있습니다.');
  _ensure(course.reason.trim().isNotEmpty, '${course.id}: reason이 비어 있습니다.');
  _ensure(course.places.length >= 5, '${course.id}: 코스에는 최소 5개 장소가 있어야 합니다.');

  final scores = {
    'switchScore': course.switchScore,
    'congestionReliefScore': course.congestionReliefScore,
    'localBusinessScore': course.localBusinessScore,
    'walkingScore': course.walkingScore,
    'stayExtensionScore': course.stayExtensionScore,
    'dispersionScore': course.dispersionScore,
  };

  for (final entry in scores.entries) {
    _ensure(
      entry.value >= 0 && entry.value <= 100,
      '${course.id}: ${entry.key}는 0 이상 100 이하이어야 합니다.',
    );
  }

  final placeIds = <String>{};
  for (final place in course.places) {
    _ensure(
      placeIds.add(place.id),
      '${course.id}: 중복된 CoursePlace.id가 있습니다. (${place.id})',
    );
    _ensure(
      place.id.trim().isNotEmpty,
      '${course.id}: CoursePlace.id가 비어 있습니다.',
    );
    _ensure(
      place.name.trim().isNotEmpty,
      '${course.id}/${place.id}: CoursePlace.name이 비어 있습니다.',
    );
    _ensure(
      place.type.trim().isNotEmpty,
      '${course.id}/${place.id}: CoursePlace.type이 비어 있습니다.',
    );
    _ensure(
      place.description.trim().isNotEmpty,
      '${course.id}/${place.id}: CoursePlace.description이 비어 있습니다.',
    );
  }
}

void _ensure(bool condition, String message) {
  if (!condition) {
    throw AssertionError(message);
  }
}
