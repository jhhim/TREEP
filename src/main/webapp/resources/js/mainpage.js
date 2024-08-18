
/*************** 메인 베너 TREEP버튼 ***************/
$('.search-place').hide();
$('.Treep-btn').click(function (event) {
  event.stopPropagation();
});

$(document).on('click', function (event) {
  if (!$(event.target).closest('.search-place').length) {
    $('.search-place').hide();
    $('.search-place-nav').val('');
    $('.Treep-btn').show();
  }
});
/*************** TREEP PICK 분류 선택 ***************/
function loadArticles(filter) {
    $.ajax({
        url: basePath + '/filtercategory',
        type: 'GET',
        data: { category: filter },
        dataType: 'json',
        success: function(data) {
            console.log('Loaded data:', data); // 데이터 확인

            // 슬릭 슬라이더 제거
            if ($('.responsive').hasClass('slick-initialized')) {
                $('.responsive').slick('unslick'); // 기존 슬릭 제거
            }

            // 카드 내용 비우기
            $('.card-wrap').empty();

            // 데이터가 없는 경우 처리
            if (data.length === 0) {
                $('.card-wrap').html('<h2>도시가 존재하지 않습니다.</h2>');
                $('.recommend-prev-btn').hide();
                $('.recommend-next-btn').hide();
                return;
            }

            // 카드 생성
            data.forEach(function(article) {
                var card = '<article class="main-card">' +
                    '<a href="#">' + 
                        '<img src="' + basePath + '/resources/img/city/' + article.city_img + '" alt="' + article.city_name + '">' +
                        '<div class="main-card-content">' +
                            '<h3>' + article.city_name + '</h3>' +
                            '<span>' + article.city_country + '</span>' +
                        '</div>' +
                    '</a>' +
                '</article>';

                $('.card-wrap').append(card);
            });

            // 슬릭 슬라이더 초기화
            $('.responsive').slick({
                infinite: false,
                speed: 300,
                slidesToShow: 4,
                slidesToScroll: 1,
                arrows: false,
                responsive: [
                    {
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3,
                            infinite: true,
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 2
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                ]
            }).on('init', updateNavButtons)
              .on('beforeChange', updateNavButtons)
              .on('afterChange', updateNavButtons);

            // 슬릭 슬라이더 버튼 기능 재설정
            $('.recommend-prev-btn').off('click').on('click', function () {
                $('.responsive').slick('slickPrev');
            });
            $('.recommend-next-btn').off('click').on('click', function () {
                $('.responsive').slick('slickNext');
            });

            // 슬릭 슬라이더 버튼 보이기/숨기기 기능
            function updateNavButtons() {
                var slick = $('.responsive').slick('getSlick');
                var currentSlide = slick.currentSlide;
                var slideCount = slick.slideCount;
                var slidesToShow = slick.options.slidesToShow;

                if (currentSlide === 0) {
                    $('.recommend-prev-btn').hide();
                } else {
                    $('.recommend-prev-btn').show();
                }

                if (currentSlide >= slideCount - slidesToShow) {
                    $('.recommend-next-btn').hide();
                } else {
                    $('.recommend-next-btn').show();
                }
            }

            // 초기 상태 설정
            updateNavButtons();
        },
        error: function(error) {
            console.error('오류:', error);
        }
    });
}

// 페이지 로드 시 초기화
loadArticles('all');

$('.place-category').on('click', function () {
    let filter = $(this).text();
    $('.place-category').removeClass('category-selected');
    $(this).addClass('category-selected');
    loadArticles(filter);
});




/*************** 메인 베너 TREEP버튼 ***************/
function addSearch() {
  $('.search-place').toggle('slide');
  $('.Treep-btn').hide();
}


/*************** TYPE효과 ***************/
const conditions = [
  { threshold: 1150, action: () => TypeHangul.type('#together-type'), hasBeenTriggered: false },
  { threshold: 1385, action: () => TypeHangul.type('#board-type'), hasBeenTriggered: false },
  { threshold: 1680, action: () => TypeHangul.type('#join-type'), hasBeenTriggered: false }
];

function handleScroll() {
  const scrollY = window.scrollY;

  for (let i = 0; i < conditions.length; i++) {
    const condition = conditions[i];

    if (scrollY > condition.threshold && !condition.hasBeenTriggered) {
      condition.action();
      condition.hasBeenTriggered = true;
    }
  }

  if (conditions.every(condition => condition.hasBeenTriggered)) {
    window.removeEventListener('scroll', handleScroll);
  }
}

window.addEventListener('scroll', handleScroll);


/********************************* searchbox *****************************************/

fetchCities("");


const searchInput = $('.search-place-nav');
const searchResultsContainer = $('.search-place-scroll');

searchInput.on('input', function() {
    const searchText = $(this).val() || "";
    fetchCities(searchText);
});

function fetchCities(searchText) {
    $.ajax({
        url: `${basePath}/searchcity`,
        type: 'GET',
        data: { searchText: searchText },
        success: function(data) {
            searchResultsContainer.empty();
            
            let cityHtml = '';
            data.forEach(item => {
                // 조건에 따라 city_country 값을 변환
                let countryName = item.city_country;
                if (countryName === '국내') {
                    countryName = '대한민국';
                }

                // HTML 생성
                cityHtml += '<a href="#" class="search-box-wrap" data-bs-toggle="modal" data-bs-target="#detail-modal" data-city=\'' + JSON.stringify(item) + '\'>';
                cityHtml += '<i class="fa-solid fa-location-dot"></i>';
                cityHtml += '<div class="search-left">';
                cityHtml += '<h5>' + item.city_name + '</h5>';
                cityHtml += '<span>' + countryName + '</span>';
                cityHtml += '</div></a>';
            });

            searchResultsContainer.html(cityHtml);
        },
        error: function(xhr, status, error) {
            console.error('오류:', error);
        }
    });
}
/********************************* 모달 *****************************************/
$(document).on('click', '.search-box-wrap', function() {
    const cityData = $(this).attr('data-city');
    
    const decodedCityData = cityData.replace(/&quot;/g, '"');
    
    try {
        const city = JSON.parse(decodedCityData);
        console.log('Parsed City:', city);
		let countryName = city.city_country;
        if (countryName === '국내') {
            countryName = '대한민국';
        }

        $('#modal-city-name').text(city.city_name);
        $('#modal-city-info').text(city.city_info);
        $('#modal-city-country').text(countryName);
        $('#modal-city-image').attr('src', `${basePath}/resources/img/city/${city.city_img}`);
    } catch (error) {
        console.error('Error parsing city data:', error);
    }
});