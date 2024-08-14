document.addEventListener('DOMContentLoaded', function () {
    // Bootstrap modal instance
    var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'), {
        keyboard: false
    });

    myModal.show();
});




// 플러스 버튼 호버 효과
const PlusBtn = document.querySelectorAll('.Plus-Plan');

for (let i = 0; i < PlusBtn.length; i++) {

    PlusBtn[i].addEventListener('mousedown', function () {

        PlusBtn[i].classList.add('PlusBtnClick');
    });

    PlusBtn[i].addEventListener('mouseup', function () {

        PlusBtn[i].classList.remove('PlusBtnClick');

    });
}




// 날짜 데이터 저장
var dateStoreList = [];

// 날짜 정보 가져오기
var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)


var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());

// 현재 날짜(로컬 기준) 가져오기
var date2 = new Date();
// UTC 시간으로 변환
var utc2 = date2.getTime() + (date2.getTimezoneOffset() * 60 * 1000);

// 한국 KST 기준 시간 더하기
var kstGap2 = 9 * 60 * 60 * 1000;

// 한국 시간으로 date 객체 만들기
var today2 = new Date(utc2 + kstGap2);

// 현재 연도와 월을 가져옵니다.
var year2 = today2.getFullYear();
var month2 = today2.getMonth(); // 현재 월 (0부터 11까지)

// 다음 달을 계산하기 위해 월을 1 더합니다.
var nextMonth = month2 + 1;

// // 다음 달이 12월이면, 연도를 1 더하고 월을 0으로 설정합니다.
// if (nextMonth > 11) {
//     nextMonth = 0;
//     year2++;
// }

// 다음 달의 첫 날을 나타내는 Date 객체를 생성합니다.
var thisMonth2 = new Date(year2, nextMonth, 1);
// 달력에서 표기하는 날짜 객체


var currentYear1 = thisMonth.getFullYear(); // 달력에서 표기하는 연
var currentMonth1 = thisMonth.getMonth(); // 달력에서 표기하는 월
var currentDate1 = thisMonth.getDate(); // 달력에서 표기하는 일

var currentYear2 = thisMonth2.getFullYear(); // 달력에서 표기하는 연
var currentMonth2 = thisMonth2.getMonth(); // 달력에서 표기하는 월
var currentDate2 = thisMonth2.getDate(); // 달력에서 표기하는 일

// kst 기준 현재시간
// console.log(thisMonth);

// dateStoreList에 들어오는 길이 저장
var StrLen
// dateStoreList[0]에 들어오는 값의 year값
var year3

// dateStoreList[0]에 들어오는 값의 month값
var month3
// dateStoreList[0]에 들어오는 값의 달력길이 (7,8,9는 길이가 1인데 10,11,12는 길이가 2임)
var month3Len
// dateStoreList[0]에 들어오는 값의 날짜값 (이것도 7,8,9는 길이가 1인데 10,11,12는 길이가 2임)
var date3

// var  = new Date(year3, month3, date3); // 한국 시간으로 date 객체 만들기(오늘)

// dateStoreList에 들어오는 길이 저장
var StrLen1
// dateStoreList[0]에 들어오는 값의 year값
var year31

// dateStoreList[0]에 들어오는 값의 month값
var month31
// dateStoreList[0]에 들어오는 값의 달력길이 (7,8,9는 길이가 1인데 10,11,12는 길이가 2임)
var month3Len1
// dateStoreList[0]에 들어오는 값의 날짜값 (이것도 7,8,9는 길이가 1인데 10,11,12는 길이가 2임)
var date31

// var  = new Date(year3, month3, date3); // 한국 시간으로 date 객체 만들기(오늘)


var selectMonth3
var selectMonth4


var currentYear3 // 달력에서 표기하는 연
var currentMonth3 // 달력에서 표기하는 월
var currentDate3 // 달력에서 표기하는 일


var currentYear4 // 달력에서 표기하는 연
var currentMonth4 // 달력에서 표기하는 월
var currentDate4 // 달력에서 표기하는 일

var smallCalendarCount = 0
var todaySelectCount = 0
var storei

function appendSmallCalendar() {
    $('.Plan-write-container').empty();
    $('.Plan-write-container').css('border', '0px');
    $('.dates3').empty();
    $('.Small-Calendar').empty();
    $('.Plan-write-container').attr('id', ''); 


    var SelectCalendar =
        '<div class="sec_cal" >'
        + '<div class="cal_nav" style="margin-left: 0; width: 350px;">'
        + '<a href="javascript:;" class="nav-btn go-prev2"></a>'
        + '<div class="year-month3">'
        + '<a type="button" class="a-modal-custom" data-bs-toggle="modal" data-bs-target="#staticBackdrop">'

        + '</a></div>'
        + '<a href="javascript:;" class="nav-btn go-next2"></a>'
        + '</div>'


        + '<div class="cal_wrap" >'
        + '<div class="days">'
        + '<div class="day">SUN</div>'
        + '<div class="day">MON</div>'
        + '<div class="day">TUE</div>'
        + '<div class="day">WED</div>'
        + '<div class="day">THU</div>'
        + '<div class="day">FRI</div>'
        + '<div class="day">SAT</div>'
        + '</div>'
        + '<div class="dates3"></div>'
        + '</div>'
        + '</div>';

    $('.Small-Calendar').append(SelectCalendar);

    renderCalender3(selectMonth3);


    // 이전달로 이동
    $('.go-prev2').on('click', function () {

        smallCalendarCount = 0
        var temp = selectMonth3;
        selectMonth3 = selectMonth4;
        selectMonth4 = temp;

        if (selectMonth3.getMonth() < selectMonth4.getMonth()) {

            renderCalender3(selectMonth3);
        } else if (selectMonth3.getMonth() == selectMonth4.getMonth()) {

        } else {

        }
    });

    // 다음달로 이동
    $('.go-next2').on('click', function () {


        smallCalendarCount = 1;
        var temp = selectMonth3;
        selectMonth3 = selectMonth4;
        selectMonth4 = temp;
        if (selectMonth3.getMonth() > selectMonth4.getMonth()) {

            renderCalender3(selectMonth3);
        } else if (selectMonth3.getMonth() == selectMonth4.getMonth()) {

        } else {

        }
    });


}





$(document).ready(function () {
    calendarInit();

});






// 모달 안 달력 만들기 ====================================================
function calendarInit() {







    // 캘린더 렌더링
    renderCalender(thisMonth, thisMonth2);

    // storeDate();




    function renderCalender(thisMonth, thisMonth2) {

        // 렌더링을 위한 데이터 정리
        currentYear1 = thisMonth.getFullYear();
        currentMonth1 = thisMonth.getMonth();
        currentDate1 = thisMonth.getDate();

        currentYear2 = thisMonth2.getFullYear();
        currentMonth2 = thisMonth2.getMonth();
        currentDate2 = thisMonth2.getDate();

        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay1 = new Date(currentYear1, currentMonth1, 0);
        var prevDate1 = startDay1.getDate();
        var prevDay1 = startDay1.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay1 = new Date(currentYear1, currentMonth1 + 1, 0);
        var nextDate1 = endDay1.getDate();
        var nextDay1 = endDay1.getDay();

        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay2 = new Date(currentYear2, currentMonth2, 0);
        var prevDate2 = startDay2.getDate();
        var prevDay2 = startDay2.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay2 = new Date(currentYear2, currentMonth2 + 1, 0);
        var nextDate2 = endDay2.getDate();
        var nextDay2 = endDay2.getDay();


        // console.log(prevDate1, prevDay1, nextDate1, nextDay1);
        // console.log(prevDate2, prevDay2, nextDate2, nextDay2);
        // 현재 월 표기
        $('.year-month1').text(currentYear1 + '.' + (currentMonth1 + 1));
        $('.year-month2').text(currentYear2 + '.' + (currentMonth2 + 1));

        // 렌더링 html 요소 생성
        calendar1 = document.querySelector('.dates1')
        calendar1.innerHTML = '';
        calendar2 = document.querySelector('.dates2')
        calendar2.innerHTML = '';

        // 왼쪽 달력
        // 지난달dates1
        if (prevDay1 == 6) {

        } else {
            for (var i = prevDate1 - prevDay1; i <= prevDate1; i++) {
                calendar1.innerHTML = calendar1.innerHTML + '<div class="day prev disable hidden">' + i + '</div>'
            }

        }
        // 이번달dates1
        for (var i = 1; i <= nextDate1; i++) {
            calendar1.innerHTML = calendar1.innerHTML + '<div class="day current" data-date=' + currentYear1 + currentMonth1 + i + ' onclick=dateClick()>' + i + '</div>'

        }
        // 다음달dates1
        for (var i = 1; i <= (7 - nextDay1 == 7 ? 0 : 6 - nextDay1); i++) {
            calendar1.innerHTML = calendar1.innerHTML + '<div class="day next hidden ">' + i + '</div>'
        }

        // 오른쪽 달력
        // 지난달dates2
        if (prevDay2 == 6) {

        } else {
            for (var i = prevDate2 - prevDay2; i <= prevDate2; i++) {
                calendar2.innerHTML = calendar2.innerHTML + '<div class="day prev disable hidden">' + i + '</div>'
            }

        }
        // 이번달dates2
        for (var i = 1; i <= nextDate2; i++) {
            calendar2.innerHTML = calendar2.innerHTML + '<div class="day current" data-date=' + currentYear2 + currentMonth2 + i + ' onclick=dateClick()>' + i + '</div>'

        }
        // 다음달dates2
        for (var i = 1; i <= (7 - nextDay2 == 7 ? 0 : 6 - nextDay2); i++) {
            calendar2.innerHTML = calendar2.innerHTML + '<div class="day next hidden ">' + i + '</div>'
        }

        // 오늘 날짜 표기
        // if (today.getMonth() == currentMonth1) {
        //     todayDate = today.getDate();
        //     var currentMonthDate = document.querySelectorAll('.dates1 .current');
        //     currentMonthDate[todayDate - 1].classList.add('today');
        // }

        dateClick();

    }

    // 이전달로 이동
    $('.go-prev').on('click', function () {
        thisMonth = new Date(currentYear1, currentMonth1 - 1, 1);
        thisMonth2 = new Date(currentYear2, currentMonth2 - 1, 1);
        renderCalender(thisMonth, thisMonth2);
    });

    // 다음달로 이동
    $('.go-next').on('click', function () {
        thisMonth = new Date(currentYear1, currentMonth1 + 1, 1);
        thisMonth2 = new Date(currentYear2, currentMonth2 + 1, 1);
        renderCalender(thisMonth, thisMonth2);
    });

    function dateClick() {
        const dayList1 = document.querySelectorAll('.dates1 .current')
        const dayList2 = document.querySelectorAll('.dates2 .current')
        // console.log(dayList1)
        var DateClickcount = 0;
        var firstClick = -1;
        var secondClick = -1;
        const dates1 = document.querySelectorAll('.dates1 .day.current')
        const dates2 = document.querySelectorAll('.dates2 .day.current')

        for (let i = 0; i < dayList1.length; i++) {

            dayList1[i].addEventListener('click', function () {
                if (DateClickcount == 2) {
                    DateClickcount = 0;

                    // dates1[firstClick].classList.remove('today');
                    // dates1[secondClick].classList.remove('today');
                    // dates2[firstClick].classList.remove('today');
                    // dates2[secondClick].classList.remove('today');

                    if (dayList1.length > dayList2.length & secondClick == 30) {
                        dates1[secondClick].classList.remove('today');
                        dates1[firstClick].classList.remove('today');
                        dates2[firstClick].classList.remove('today');
                    } else if (dayList1.length > dayList2.length & firstClick == 30) {
                        dates1[firstClick].classList.remove('today');
                        dates1[secondClick].classList.remove('today');
                        dates2[secondClick].classList.remove('today');
                    } else if (dayList1.length < dayList2.length & firstClick == 30) {
                        dates1[secondClick].classList.remove('today');
                        dates2[firstClick].classList.remove('today');
                    } else if (dayList1.length < dayList2.length & secondClick == 30) {
                        dates1[firstClick].classList.remove('today');
                        dates2[secondClick].classList.remove('today');
                    } else {
                        dates1[firstClick].classList.remove('today');
                        dates1[secondClick].classList.remove('today');
                        dates2[firstClick].classList.remove('today');
                        dates2[secondClick].classList.remove('today');
                    }

                    firstClick = -1;
                    secondClick = -1;
                }

                if (firstClick == -1) {
                    firstClick = i;
                    console.log(firstClick)
                } else if (firstClick != -1 & secondClick == -1) {
                    secondClick = i;
                    console.log(secondClick)

                }

                // const DayTitle = document.querySelector('.DayTitle');
                // dates1[i]
                var dateStr = dates1[i].getAttribute('data-date')
                dates1[i].classList.add('today')
                DateClickcount++;
                dateStoreList.unshift(dateStr);

                // if(dateStoreList.length == 1){
                // StrLen = (String(dateStoreList[0]).length)
                // year3 = Number(String(dateStoreList[0]).substring(0,4));
                // month3 = Number(String(dateStoreList[0]).substring(4,5)) != (10 || 11 || 12) ? Number(String(dateStoreList[0]).substring(4,5)) : Number(String(dateStoreList[0]).substring(4,6))
                // month3Len = Number(String(month3).length);
                // date3 = Number(String(dateStoreList[0]).substring(4+month3Len,StrLen))
                // selectMonth3 = new Date(year3, month3, date3);

                // }else{
                StrLen = (String(dateStoreList[0]).length)
                year3 = Number(String(dateStoreList[0]).substring(0, 4));
                month3 = Number(String(dateStoreList[0]).substring(4, 5)) != (10 || 11 || 12) ? Number(String(dateStoreList[0]).substring(4, 5)) : Number(String(dateStoreList[0]).substring(4, 6))
                month3Len = Number(String(month3).length);
                date3 = Number(String(dateStoreList[0]).substring(4 + month3Len, StrLen))

                StrLen1 = (String(dateStoreList[1]).length)
                year31 = Number(String(dateStoreList[1]).substring(0, 4));
                month31 = Number(String(dateStoreList[1]).substring(4, 5)) != (10 || 11 || 12) ? Number(String(dateStoreList[1]).substring(4, 5)) : Number(String(dateStoreList[1]).substring(4, 6))
                month3Len1 = Number(String(month3).length);
                date31 = Number(String(dateStoreList[1]).substring(4 + month3Len1, StrLen1))


                if (month3 == month31) {
                    if (date3 > date31) {
                        selectMonth3 = new Date(year31, month31, date31);
                        selectMonth4 = new Date(year3, month3, date3);
                    } else {
                        selectMonth3 = new Date(year3, month3, date3);
                        selectMonth4 = new Date(year31, month31, date31);
                    }
                }
                else if (month3 > month31) {
                    selectMonth4 = new Date(year3, month3, date3);
                    selectMonth3 = new Date(year31, month31, date31);
                } else {

                    selectMonth3 = new Date(year3, month3, date3);
                    selectMonth4 = new Date(year31, month31, date31);

                }
                // }




                // console.log(date3)              
                // 달력 누를 날짜로 day값 변경하기
                // DayTitle.innerText = 'Day' + (i + 1);

                //  dayList[i].


                // renderCalender3(selectMonth3);
                // storeDate(selectMonth3);
            })

        }


        for (let i = 0; i < dayList2.length; i++) {

            dayList2[i].addEventListener('click', function () {
                if (DateClickcount == 2) {
                    DateClickcount = 0;
                    // dates2[firstClick].classList.remove('today');
                    // dates2[secondClick].classList.remove('today');
                    // dates1[firstClick].classList.remove('today');
                    // dates1[secondClick].classList.remove('today');

                    if (dayList1.length > dayList2.length & secondClick == 30) {
                        dates1[secondClick].classList.remove('today');
                        dates2[firstClick].classList.remove('today');
                    } else if (dayList1.length > dayList2.length & firstClick == 30) {
                        dates1[firstClick].classList.remove('today');
                        dates2[secondClick].classList.remove('today');
                    } else if (dayList1.length < dayList2.length & firstClick == 30 || firstClick == 29) {
                        dates1[secondClick].classList.remove('today');
                        dates2[firstClick].classList.remove('today');
                        dates2[secondClick].classList.remove('today');
                    } else if (dayList1.length < dayList2.length & secondClick == 30 || firstClick == 29) {
                        dates1[firstClick].classList.remove('today');
                        dates2[secondClick].classList.remove('today');
                        dates2[firstClick].classList.remove('today');
                    } else {
                        dates1[firstClick].classList.remove('today');
                        dates1[secondClick].classList.remove('today');
                        dates2[firstClick].classList.remove('today');
                        dates2[secondClick].classList.remove('today');
                    }

                    firstClick = -1;
                    secondClick = -1;
                }

                if (firstClick == -1) {
                    firstClick = i;
                    console.log(firstClick)
                } else if (firstClick != -1 & secondClick == -1) {
                    secondClick = i;
                    console.log(secondClick)
                }

                // const DayTitle = document.querySelector('.DayTitle');
                // dates1[i]
                var dateStr = dates2[i].getAttribute('data-date')
                dates2[i].classList.add('today')
                DateClickcount++;
                dateStoreList.unshift(dateStr);


                StrLen = (String(dateStoreList[0]).length)
                year3 = Number(String(dateStoreList[0]).substring(0, 4));
                month3 = Number(String(dateStoreList[0]).substring(4, 5)) != (10 || 11 || 12) ? Number(String(dateStoreList[0]).substring(4, 5)) : Number(String(dateStoreList[0]).substring(4, 6))
                month3Len = Number(String(month3).length);
                date3 = Number(String(dateStoreList[0]).substring(4 + month3Len, StrLen))
                selectMonth3 = new Date(year3, month3, date3);


                // if(dateStoreList.length == 1){
                //     StrLen = (String(dateStoreList[0]).length)
                //     year3 = Number(String(dateStoreList[0]).substring(0,4));
                //     month3 = Number(String(dateStoreList[0]).substring(4,5)) != (10 || 11 || 12) ? Number(String(dateStoreList[0]).substring(4,5)) : Number(String(dateStoreList[0]).substring(4,6))
                //     month3Len = Number(String(month3).length);
                //     date3 = Number(String(dateStoreList[0]).substring(4+month3Len,StrLen))
                //     selectMonth3 = new Date(year3, month3, date3);

                //     }else{
                StrLen = (String(dateStoreList[0]).length)
                year3 = Number(String(dateStoreList[0]).substring(0, 4));
                month3 = Number(String(dateStoreList[0]).substring(4, 5)) != (10 || 11 || 12) ? Number(String(dateStoreList[0]).substring(4, 5)) : Number(String(dateStoreList[0]).substring(4, 6))
                month3Len = Number(String(month3).length);
                date3 = Number(String(dateStoreList[0]).substring(4 + month3Len, StrLen))

                StrLen1 = (String(dateStoreList[1]).length)
                year31 = Number(String(dateStoreList[1]).substring(0, 4));
                month31 = Number(String(dateStoreList[1]).substring(4, 5)) != (10 || 11 || 12) ? Number(String(dateStoreList[1]).substring(4, 5)) : Number(String(dateStoreList[1]).substring(4, 6))
                month3Len1 = Number(String(month3).length);
                date31 = Number(String(dateStoreList[1]).substring(4 + month3Len1, StrLen1))

                if (month3 == month31) {
                    if (date3 > date31) {
                        selectMonth3 = new Date(year31, month31, date31);
                        selectMonth4 = new Date(year3, month3, date3);
                    } else {
                        selectMonth3 = new Date(year3, month3, date3);
                        selectMonth4 = new Date(year31, month31, date31);
                    }
                }
                else if (month3 > month31) {
                    selectMonth4 = new Date(year3, month3, date3);
                    selectMonth3 = new Date(year31, month31, date31);
                } else {

                    selectMonth3 = new Date(year3, month3, date3);
                    selectMonth4 = new Date(year31, month31, date31);

                }

                // }

                // console.log(date3)              
                // 달력 누를 날짜로 day값 변경하기
                // DayTitle.innerText = 'Day' + (i + 1);

                //  dayList[i].


                // renderCalender3(selectMonth3);
                // storeDate(selectMonth3);
            })

        }


    }




    // appendSmallCalendar()
    // ====================================================데이트 클릭




    // function storeDate(a, b, c){

    //     return selectMonth3;
    // }


    // console.log(selectMonth3)



    // 날짜 정보 가져오기
    //var date3 = new Date(); // 현재 날짜(로컬 기준) 가져오기
    // var utc3 = date3.getTime() + (date3.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    // var kstGap3 = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기

}



function renderCalender3(selectMonth3) {

    console.log("renderCalender3실행")

    console.log(selectMonth3)
    console.log(selectMonth4)


    // 렌더링을 위한 데이터 정리
    currentYear3 = selectMonth3.getFullYear();
    currentMonth3 = selectMonth3.getMonth();
    currentDate3 = selectMonth3.getDate();

    currentYear4 = selectMonth4.getFullYear();
    currentMonth4 = selectMonth4.getMonth();
    currentDate4 = selectMonth4.getDate();

    // 이전 달의 마지막 날 날짜와 요일 구하기
    var startDay3 = new Date(currentYear3, currentMonth3, 0);
    var prevDate3 = startDay3.getDate();
    var prevDay3 = startDay3.getDay();

    // 이번 달의 마지막날 날짜와 요일 구하기
    var endDay3 = new Date(currentYear3, currentMonth3 + 1, 0);
    var nextDate3 = endDay3.getDate();
    var nextDay3 = endDay3.getDay();

    // // 이전 달의 마지막 날 날짜와 요일 구하기
    // var startDay4 = new Date(currentYear4, currentMonth4, 0);
    // var prevDate4 = startDay4.getDate();
    // var prevDay4 = startDay4.getDay();

    // // 이번 달의 마지막날 날짜와 요일 구하기
    // var endDay4 = new Date(currentYear4, currentMonth4 + 1, 0);
    // var nextDate4 = endDay4.getDate();
    // var nextDay4 = endDay4.getDay();


    // console.log(prevDate1, prevDay1, nextDate1, nextDay1);
    // 현재 월 표기
    $('.year-month3 a').text(currentYear3 + '.' + (currentMonth3 + 1));
    // $('.year-month3 a').on('click',function(){
    //     selectMonth3.setMonth() = -1
    //     selectMonth4.setMonth() = -1
    // })
    // 렌더링 html 요소 생성
    calendar3 = document.querySelector('.dates3')
    calendar3.innerHTML = '';


    // 왼쪽 달력
    // 지난달dates3
    if (prevDay3 == 6) {

    } else {
        for (var i = prevDate3 - prevDay3; i <= prevDate3; i++) {
            calendar3.innerHTML = calendar3.innerHTML + '<div class="day prev disable hidden">' + i + '</div>'
        }

    }
    // 이번달dates3
    for (var i = 1; i <= nextDate3; i++) {
        if (month3 == month31) {
            // if(selectMonth3.getDate() != selectMonth4.getDate())
            if (i >= selectMonth3.getDate() && i <= selectMonth4.getDate()) {

                calendar3.innerHTML = calendar3.innerHTML + '<div class="day current todayselect" data-date=' + currentYear3 + currentMonth3 + i + '>' + i + '</div>'
                todaySelectCount++;
            } else {

                calendar3.innerHTML = calendar3.innerHTML + '<div class="day current" data-date=' + currentYear3 + currentMonth3 + i + '>' + i + '</div>'
            }
        } else {
            if (smallCalendarCount == 1 & selectMonth3.getDate() >= i) {

                calendar3.innerHTML = calendar3.innerHTML + '<div class="day current todayselect" data-date=' + currentYear3 + currentMonth3 + i + '>' + i + '</div>'
                todaySelectCount++;
            } else if (smallCalendarCount == 0 & selectMonth3.getDate() <= i) {
                calendar3.innerHTML = calendar3.innerHTML + '<div class="day current todayselect" data-date=' + currentYear3 + currentMonth3 + i + '>' + i + '</div>'
                todaySelectCount++;
            }
            else {
                calendar3.innerHTML = calendar3.innerHTML + '<div class="day current" data-date=' + currentYear3 + currentMonth3 + i + '>' + i + '</div>'
            }
        }

    }
    // 다음달dates3
    for (var i = 1; i <= (7 - nextDay3 == 7 ? 0 : 6 - nextDay3); i++) {
        if (i <= selectMonth3.getDate()) {
            calendar3.innerHTML = calendar3.innerHTML + '<div class="day next hidden " data-date=' + currentYear3 + currentMonth3 + i + '>' + i + '</div>'
        } else {

            calendar3.innerHTML = calendar3.innerHTML + '<div class="day next hidden " data-date=' + currentYear3 + currentMonth3 + i + '>' + i + '</div>'
        }
    }


    // 오른쪽 달력
    // 지난달dates2
    // for (var i = prevDate2 - prevDay2; i <= prevDate2; i++) {
    //     calendar2.innerHTML = calendar2.innerHTML + '<div class="day prev disable hidden">' + i + '</div>'
    // }
    // // 이번달dates2
    // for (var i = 1; i <= nextDate2; i++) {
    //     calendar2.innerHTML = calendar2.innerHTML + '<div class="day current" data-date=' + i + '>' + i + '</div>'

    // }
    // // 다음달dates2
    // for (var i = 1; i <= (7 - nextDay2 == 7 ? 0 : 6 - nextDay2); i++) {
    //     calendar2.innerHTML = calendar2.innerHTML + '<div class="day next hidden ">' + i + '</div>'
    // }

    // // 오늘 날짜 표기
    // if (today.getMonth() == currentMonth1) {
    //     todayDate = today.getDate();
    //     var currentMonthDate = document.querySelectorAll('.dates1 .current');
    //     currentMonthDate[todayDate - 1].classList.add('today');
    // }

    const tttt = document.querySelectorAll('.todayselect');
    console.log('todaySelectCount : ' + todaySelectCount)
    console.log('선택된 날 갯수 : ' + tttt.length)
    console.log(month3 + 'asd' + month31)
    var differenceInTime = selectMonth4.getTime() - selectMonth3.getTime()
    const millisecondsPerDay = 24 * 60 * 60 * 1000; // 하루를 밀리초로 변환
    const differenceInDays = Math.round(differenceInTime / millisecondsPerDay);
    console.log(`다음달 누르기 전${differenceInDays}`)
    var differenceInTime1 = selectMonth3.getTime() - selectMonth4.getTime()
    const millisecondsPerDay1 = 24 * 60 * 60 * 1000; // 하루를 밀리초로 변환
    const differenceInDays1 = Math.round(differenceInTime1 / millisecondsPerDay1);
    console.log(`다음달 누른 후${differenceInDays1}`)
    // if (differenceInDays < 0){
    //     differenceInDays = differenceInDays * -1
    // }




    if (month3 == month31) {
        for (let i = 0; i < tttt.length; i++) {
            tttt[i].addEventListener('click', function () {
                // $('.Plan-write-container').css('border', '1px solid #d2d2d2');
    
                // 모든 Plan-write-container를 숨김
                $('.Plan-write-container').hide();
    
                // 고유한 Plan-write-container ID 생성
                var containerId = `Plan-write-container${i + 1}`;
    
                // 해당 Day의 Plan-write-container가 이미 있는지 확인
                if (!$(`#${containerId}`).length) {
                    // Plan-write-container가 없으면 새로 생성
                    var PlanCardAppend =
                        `<div class="Plan-write-container" id="${containerId}">`
                        + '<div class="Plan-Write-DayTitle">'
                        + `<h1 class="DayTitle">Day${i + 1}</h1>`
                        + '<p class="CalenderTitle">2024-08-06</p>'
                        + '<i class="fa-solid fa-trash"></i>'
                        + '</div>'
                        + `<div class="Detail-container" id="Detail-container${i+1}">`
                        + '<div class="Line"></div>'
                        + `<ul class="sortable container md" id="sortable${i + 1}"></ul>` // Day별 고유한 ID
                        + '<div class="Plus-Btn-container">'
                        + `<button class="Plus-Plan openOffcanvas" type="button" id="openOffcanvas${i + 1}"><i class="fa-regular fa-calendar-plus"></i>`
                        + '일정 추가</button>'
                        + '</div>'
                        + '</div>'; // Plan-write-container 종료
    
                    // 새로 생성한 Plan-write-container를 추가
                    $('.Plan-write-container').parent().append(PlanCardAppend);
                }
    
                // 해당 Day의 Plan-write-container만 보이도록 설정
                $(`#${containerId}`).show();
    
                // URL을 변경
                history.pushState(null, '', `maketrip?day=${i + 1}`);
    
                // 오프캔버스 설정
                const placeOff = document.querySelector('.place-offcanvas');
                placeOff.id = `place-offcanvas${i + 1}`;
    
                const closeOff = document.querySelector('.closeOff');
                closeOff.id = `closeOffcanvas${i + 1}`;
    
                const openBtn = document.getElementById(`openOffcanvas${i + 1}`);
                const closeBtn = document.getElementById(`closeOffcanvas${i + 1}`);
                const offcanvas = document.getElementById(`place-offcanvas${i + 1}`);
    
                openBtn.addEventListener('click', function () {
                    offcanvas.classList.add('show');
                    console.log("오프캔버스 클릭");
                });
    
                closeBtn.addEventListener('click', function () {
                    offcanvas.classList.remove('show');
                    document.getElementById('autocomplete').value = '';
          

                });
    
                // sortable 초기화
                initializeSortable(i + 1); // Day별로 sortable을 초기화

                // $(function () {
                //     $(`#sortable${i + 1}`).sortable({
                //         update: function () {
                //             updateIndexes(); // 순서 업데이트 함수 호출
                //         }
                //     });
                // });
            });
        }
     } else if (month3 != month31) {

        if (differenceInDays >= 0) {

            for (let i = 0; i < tttt.length; i++) {
                tttt[i].addEventListener('click', function () {
                    // $('.Plan-write-container').css('border', '1px solid #d2d2d2');
        
                    // 모든 Plan-write-container를 숨김
                    $('.Plan-write-container').hide();
        
                    // 고유한 Plan-write-container ID 생성
                    var containerId = `Plan-write-container${i + 1}`;
        
                    // 해당 Day의 Plan-write-container가 이미 있는지 확인
                    if (!$(`#${containerId}`).length) {
                        // Plan-write-container가 없으면 새로 생성
                        var PlanCardAppend =
                            `<div class="Plan-write-container" id="${containerId}">`
                            + '<div class="Plan-Write-DayTitle">'
                            + `<h1 class="DayTitle">Day${i + 1}</h1>`
                            + '<p class="CalenderTitle">2024-08-06</p>'
                            + '<i class="fa-solid fa-trash"></i>'
                            + '</div>'
                            + `<div class="Detail-container" id="Detail-container${i+1}">`
                            + '<div class="Line"></div>'
                            + `<ul class="sortable container md" id="sortable${i + 1}"></ul>` // Day별 고유한 ID
                            + '<div class="Plus-Btn-container">'
                            + `<button class="Plus-Plan openOffcanvas" type="button" id="openOffcanvas${i + 1}"><i class="fa-regular fa-calendar-plus"></i>`
                            + '일정 추가</button>'
                            + '</div>'
                            + '</div>'; // Plan-write-container 종료
        
                        // 새로 생성한 Plan-write-container를 추가
                        $('.Plan-write-container').parent().append(PlanCardAppend);
                    }
        
                    // 해당 Day의 Plan-write-container만 보이도록 설정
                    $(`#${containerId}`).show();
        
                    // URL을 변경
                    history.pushState(null, '', `maketrip?day=${i + 1}`);
        
                    // 오프캔버스 설정
                    const placeOff = document.querySelector('.place-offcanvas');
                    placeOff.id = `place-offcanvas${i + 1}`;
        
                    const closeOff = document.querySelector('.closeOff');
                    closeOff.id = `closeOffcanvas${i + 1}`;
        
                    const openBtn = document.getElementById(`openOffcanvas${i + 1}`);
                    const closeBtn = document.getElementById(`closeOffcanvas${i + 1}`);
                    const offcanvas = document.getElementById(`place-offcanvas${i + 1}`);
        
                    openBtn.addEventListener('click', function () {
                        offcanvas.classList.add('show');
                        console.log("오프캔버스 클릭");
                    });
        
                    closeBtn.addEventListener('click', function () {
                        offcanvas.classList.remove('show');
                        document.getElementById('autocomplete').value = '';
              
    
                    });
        
                    // sortable 초기화
                    initializeSortable(i + 1); // Day별로 sortable을 초기화
    
                    // $(function () {
                    //     $(`#sortable${i + 1}`).sortable({
                    //         update: function () {
                    //             updateIndexes(); // 순서 업데이트 함수 호출
                    //         }
                    //     });
                    // });
                });
                storei = i
            }
        } else if (differenceInDays < 0) {
            console.log('differenceInDays이 0보다 작을때')
            // const jj = 0;
            console.log(storei)
            console.log(tttt.length)
            for (let i = 0; i < tttt.length; i++) {
                tttt[i].addEventListener('click', function () {
                    // $('.Plan-write-container').css('border', '1px solid #d2d2d2');
        
                    // 모든 Plan-write-container를 숨김
                    $('.Plan-write-container').hide();
        
                    // 고유한 Plan-write-container ID 생성
                    var containerId = `Plan-write-container${i + storei+2}`;
        
                    // 해당 Day의 Plan-write-container가 이미 있는지 확인
                    if (!$(`#${containerId}`).length) {
                        // Plan-write-container가 없으면 새로 생성
                        var PlanCardAppend =
                            `<div class="Plan-write-container" id="${containerId}">`
                            + '<div class="Plan-Write-DayTitle">'
                            + `<h1 class="DayTitle">Day${i + storei+2 }</h1>`
                            + '<p class="CalenderTitle">2024-08-06</p>'
                            + '<i class="fa-solid fa-trash"></i>'
                            + '</div>'
                            + `<div class="Detail-container" id="Detail-container${i+storei+2}">`
                            + '<div class="Line"></div>'
                            + `<ul class="sortable container md" id="sortable${i + storei+2}"></ul>` // Day별 고유한 ID
                            + '<div class="Plus-Btn-container">'
                            + `<button class="Plus-Plan openOffcanvas" type="button" id="openOffcanvas${i + storei+2}"><i class="fa-regular fa-calendar-plus"></i>`
                            + '일정 추가</button>'
                            + '</div>'
                            + '</div>'; // Plan-write-container 종료
        
                        // 새로 생성한 Plan-write-container를 추가
                        $('.Plan-write-container').parent().append(PlanCardAppend);
                    }
        
                    // 해당 Day의 Plan-write-container만 보이도록 설정
                    $(`#${containerId}`).show();
        
                    // URL을 변경
                    history.pushState(null, '', `maketrip?day=${i + storei+2}`);
        
                    // 오프캔버스 설정
                    const placeOff = document.querySelector('.place-offcanvas');
                    placeOff.id = `place-offcanvas${i + storei+2}`;
        
                    const closeOff = document.querySelector('.closeOff');
                    closeOff.id = `closeOffcanvas${i + storei+2}`;
        
                    const openBtn = document.getElementById(`openOffcanvas${i +storei+2}`);
                    const closeBtn = document.getElementById(`closeOffcanvas${i + storei+2}`);
                    const offcanvas = document.getElementById(`place-offcanvas${i + storei+2}`);
        
                    openBtn.addEventListener('click', function () {
                        offcanvas.classList.add('show');
                        console.log("오프캔버스 클릭");
                    });
        
                    closeBtn.addEventListener('click', function () {
                        offcanvas.classList.remove('show');
                        document.getElementById('autocomplete').value = '';
              
    
                    });
        
                    // sortable 초기화
                    initializeSortable(i + storei+2); // Day별로 sortable을 초기화
    
                    // $(function () {
                    //     $(`#sortable${i + 1}`).sortable({
                    //         update: function () {
                    //             updateIndexes(); // 순서 업데이트 함수 호출
                    //         }
                    //     });
                    // });
                });
            }
        }
    }
}



const dates3 = document.querySelectorAll('.dates3 .day.current')

for (let i = 0; i < dates3.length; i++) {
    var dateStr = dates3[i].getAttribute('data-date')
    for (let j = 0; j < dateStoreList.length; j++) {
        if (dateStr === dateStoreList[j]) {
            dates3[i].classList.add('today')
        }
    }

}

// sortable 순서 변경 업데이트
function initializeSortable(dayIndex) {
    $(`#sortable${dayIndex}`).sortable({
        update: function () {
            updateIndexes(dayIndex); // 해당 Day의 순서 업데이트 함수 호출
        }
    });
}

// 순서 업데이트 함수
function updateIndexes(dayIndex) {
    $(`#sortable${dayIndex} li`).each(function (index) {
        const itemText = $(this).html().split('. ')[1]; // 기존 텍스트 가져오기
        $(this).html(`${index + 1}. ${itemText}`); // 새로운 순서 번호로 업데이트
    });
}

// sortable 순서 변경 업데이트

// $(function () {
//     $(".sortable").sortable({
//         update: function () {
//             updateIndexes(); // 순서 업데이트 함수 호출
//         }
//     });
// });

// // 순서 업데이트 함수
// function updateIndexes() {
//     $(".sortable li").each(function (index) {
//         const itemText = $(this).html().split('. ')[1]; // 기존 텍스트 가져오기
//         $(this).html(`${index + 1}. ${itemText}`); // 새로운 순서 번호로 업데이트
//     });
// }


document.addEventListener('DOMContentLoaded', function () {

    const placeList = document.querySelector('.place-list');
    const autocompleteInput = document.getElementById(`autocomplete`);
    const selectPlaceList = document.getElementById(`select-place-list`);



    let map;
    let service;
    let infowindow;
    let autocomplete;

    function initialize() {
        const initialLocation = new google.maps.LatLng(37.7749, -122.4194); // Initial location (San Francisco)
        map = new google.maps.Map(document.getElementById('map'), {
            center: initialLocation,
            zoom: 15,
            gestureHandling: 'greedy'
        });
        infowindow = new google.maps.InfoWindow();

        autocomplete = new google.maps.places.Autocomplete(autocompleteInput);
        autocomplete.addListener('place_changed', onPlaceChanged);
    }

    function onPlaceChanged() {
        const place = autocomplete.getPlace();
        if (place.geometry) {
            const location = place.geometry.location;
            map.setCenter(location);
            searchNearby(location);
        } else {
            alert("No details available for input: '" + place.name + "'");
        }


    }

    function searchNearby(location) {
        const request = {
            location: location,
            radius: '1500',
            type: ['tourist_attraction']
        };

        service = new google.maps.places.PlacesService(map);
        service.nearbySearch(request, function (results, status) {
            if (status === google.maps.places.PlacesServiceStatus.OK) {
                placeList.innerHTML = '';
                results.forEach(result => {
                    createMarker(result);
                    getPlaceDetails(result.place_id);
                });
            }
        });
    }

    function getPlaceDetails(placeId) {

        const request = {
            placeId: placeId,
            fields: ['name', 'rating', 'formatted_address', 'photos', 'reviews']
        };

        service.getDetails(request, function (place, status) {
            if (status === google.maps.places.PlacesServiceStatus.OK) {
                const photo = place.photos && place.photos.length > 0
                    ? `<img src="${place.photos[0].getUrl({ maxWidth: 200, maxHeight: 100 })}" alt="${place.name}">`
                    : '';
                const reviews = place.reviews && place.reviews.length > 0
                    ? place.reviews.map(review => `<p>${review.text}</p>`).join('')
                    : '<p>No reviews available</p>';

                const starRating = getStarRating(place.rating || 0);

                const placeItem = document.createElement('div');

                placeList.id = `placeList`
                placeItem.classList.add(`place-item`);
                placeItem.innerHTML = `
              <h4 class="select-place-name">${place.name}</h4>
              <div class="star-rating">
                ${starRating} ${place.rating} 점
              </div>
              <p>${place.formatted_address}</p>
              ${photo}
              <button class="toggle-reviews" id="review-show-btn">리뷰 보기</button>
              <div class="reviews">${reviews}</div>
            `;

                placeList.appendChild(placeItem);

                const toggleButton = placeItem.querySelector('.toggle-reviews');
                const reviewsDiv = placeItem.querySelector('.reviews');


                toggleButton.addEventListener('click', function (event) {
                    event.stopPropagation();

                    if (reviewsDiv.style.display === 'none' || reviewsDiv.style.display === '') {
                        reviewsDiv.style.display = 'block';
                        toggleButton.textContent = '리뷰 닫기';
                    } else {
                        reviewsDiv.style.display = 'none';
                        toggleButton.textContent = '리뷰 보기';
                    }
                });
            }
        });
    }

    function getStarRating(rating) {
        const fullStars = Math.floor(rating);
        const halfStar = rating % 1 >= 0.5 ? 1 : 0;
        const emptyStars = 5 - fullStars - halfStar;

        return (
            '<i class="fas fa-star"></i>'.repeat(fullStars) +
            '<i class="fas fa-star-half-alt"></i>'.repeat(halfStar) +
            '<i class="far fa-star"></i>'.repeat(emptyStars)
        );
    }

    function createMarker(place) {
        const marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function () {
            infowindow.setContent(`
            <div style="font-weight: bold;">${place.name}</div>
            <div>${place.formatted_address}</div>
          `);
            infowindow.open(map, this);
        });
    }

    // 장소 리스트에서 선택!
    placeList.addEventListener('click', function (event) {
        const placeItem = event.target.closest(`.place-item`);
        if (placeItem) {

            const placeName = placeItem.querySelector('.select-place-name').textContent;
            console.log("선택한 장소: " + placeName);


            // 기존 아이템들에서 placeName이 포함된 항목이 있는지 확인
            const existingItems = selectPlaceList.querySelectorAll('.selected-place-item');
            const isAlreadyAdded = Array.from(existingItems).some(item => {
                return item.textContent.includes(placeName);
            });

            if (isAlreadyAdded) {
                alert('이미 선택된 장소입니다!');
                return;
            }

            const listItem = document.createElement('div');
            listItem.classList.add('list-group-item', 'selected-place-item');

            // 장소 이름과 X 버튼 추가
            listItem.innerHTML = `
            <div style="padding: 4px;">${placeName}<button class="remove-item-btn" style="margin-left: 3px; color: red;">X</button></div>
        `;

            selectPlaceList.append(listItem);
            // X 버튼에 이벤트 리스너 추가
            const removeBtn = listItem.querySelector('.remove-item-btn');
            removeBtn.addEventListener('click', function () {
                listItem.remove();
                updateNoPlacesMessage();
            });

            updateNoPlacesMessage();
            alert(placeName + '이 추가되었습니다.!')


        }

    });

    const noPlacesMessage = document.getElementById('no-places-message');
    const topBorder = document.getElementById('top-border');
    const bottomBorder = document.getElementById('bottom-border');
    const selectButton = document.getElementById('place-select-button');
    const selectResetButton = document.getElementById('select-place-reset');


    function updateNoPlacesMessage() {
        const hasPlaces = selectPlaceList.children.length > 0;
        noPlacesMessage.style.display = hasPlaces ? 'none' : 'block';
        topBorder.style.display = hasPlaces ? 'block' : 'none';
        bottomBorder.style.display = hasPlaces ? 'block' : 'none';
        selectButton.style.display = hasPlaces ? 'block' : 'none';
        selectResetButton.style.display = hasPlaces ? 'block' : 'none';
    }
  
        // 선택한 장소 적용 이벤트
        selectButton.addEventListener('click', function () {
            
            // 현재 보이는 Plan-write-container에서 Detail-container를 가져옴
            const visibleContainer = $('.Plan-write-container:visible');
            const addPlaceContainer = visibleContainer.find('.Detail-container');
   
            const ulElement = addPlaceContainer.find('ul'); // 대상 <ul> 요소 선택

            const text = selectPlaceList.textContent; // <div> 안의 텍스트 가져오기
            const items = text.split('X').map(item => item.trim()).filter(item => item !== '');
    
            // 저장버튼 활성화
            function updateSubmitButtonVisibility() {
   
                if (ulElement.children('li').length > 0) {
                    $('.final-submit-Container').show();
                } else {
                    $('.final-submit-Container').hide();
                }
            }

            // 각 항목을 <li> 태그로 감싸서 <ul>에 추가
            items.forEach((item) => {
                if (item) {
                     // 중복 확인: ulElement 안의 li 요소들 중에 item과 동일한 텍스트가 있는지 확인
            const isDuplicate = ulElement.children('li').toArray().some(li => $(li).text().trim().includes(item));

            const getid=document.querySelector('.place-offcanvas').id;
            reformgetid = getid.substring(15)
            console.log("구한 오프캔버스 아이디:"+reformgetid);
        
            if (!isDuplicate) { // 중복이 아닌 경우에만 추가
                const liElement = document.createElement('li');
                liElement.className = `inDayPlace`;
                liElement.innerHTML = `${ulElement.children().length + 1}. ${item} <i class="fa-solid fa-trash" id="place-trash"></i>`;
                ulElement.append(liElement);
                    // 삭제 버튼 이벤트 리스너 추가
                    ulElement.on("click", ".fa-trash", function () {

                        $(this).closest("li").remove(); // 해당 <li> 요소 삭제
                        updateIndexes(reformgetid); // 아이템 삭제 후 인덱스 업데이트

                        updateSubmitButtonVisibility(); // 아이템 삭제 후 버튼 상태 업데이트

                    });
                }
            }
            });
    
            updateIndexes(reformgetid); // 추가 후 인덱스 업데이트
            updateSubmitButtonVisibility(); // 아이템 삭제 후 버튼 상태 업데이트

        });
    



    // 선택 장소 리셋 버튼
    selectResetButton.addEventListener('click', function () {

        // const selectPlace = document.querySelector('.selected-places-section')     
        console.log("리셋 버튼 클릭");
        selectPlaceList.innerHTML = ``;
        updateNoPlacesMessage();
    })

    updateNoPlacesMessage();
    initialize();
});






