/*********************** free board *******************************/



// 카드에 마우스 올라왔을 때 이벤트 발생
const card = document.querySelectorAll('.card-custom');

card.forEach((a, index) =>{
    

    a.addEventListener('mouseover',function(){
         this.style.border = '2px solid rgb(127, 216, 88)';
         this.style.transform='scale(1.02)';
         this.style.boxShadow='rgba(100, 100, 111, 0.2) 0px 7px 29px 0px';
         this.querySelector('.pi').style.backgroundColor='rgb(127, 216, 88)';
         this.querySelector('.pi').style.transform='rotate(90deg)';
     
     });
 
     a.addEventListener('mouseout',function(){
         this.style.border = '2px solid #D2D2D2';
         this.style.transform='scale(1)';
         this.style.boxShadow='none';
         this.querySelector('.pi').style.backgroundColor='rgb(42, 157, 143,0)';
         this.querySelector('.pi').style.transform='rotate(0)';
         
     });
 
 })


 // 지금은 안 쓰는 기능 혹시 몰라 남겨둠
// const continent = document.querySelectorAll('.continent');
// const continents = document.querySelectorAll('.continent');


// continent.forEach((a, index) =>{
     
//     a.addEventListener('click',function(){
//     continents.forEach((b,index) => {
//         b.classList.remove('select_continent_outline'); 
//     });
//     this.classList.add('select_continent_outline');

    
// });

// })


// 여행지버튼 정렬버튼 클릭시 스타일 변경 및 최대 3개 넘길 시 alert 창
const locationBtn = document.querySelectorAll('.locationBtn');
const lineupBtn = document.querySelectorAll('.lineupBtn');
const gradeBtn = document.querySelectorAll('.gradeBtn');

let LocationCount = 0;
let LineupCount = 0;
let GradeCount = 0;
for(let i = 0; i < locationBtn.length; i++){

    locationBtn[i].addEventListener('click',function(){

        if(locationBtn[i].classList.contains("clickBtn")){
            locationBtn[i].classList.remove('clickBtn');
            
            if(LocationCount!=0){
                --LocationCount;
               if(LocationCount==0 & LineupCount==0 & GradeCount == 0){
                const d = document.querySelector('.filter-submitBtn');
                d.classList.remove('filter-submitBtn-Click');
                }
            }
            
            console.log(LocationCount);
        }else{
            // if(LocationCount >= 3){
                // alert('최대 3개까지 선택 가능합니다.');
            // }else{
                locationBtn[i].classList.add('clickBtn');
                const d = document.querySelector('.filter-submitBtn');
                d.classList.remove('filter-submitBtn-nonClick');
                d.classList.add('filter-submitBtn-Click');

                LocationCount++;
                console.log(LocationCount);
            // }
        }
    })

}


// 정렬 버튼 클릭 시 스타일 변경
for(let i = 0; i < lineupBtn.length; i++){

    lineupBtn[i].addEventListener('click',function(){
    for(let j = 0; j < lineupBtn.length; j++){
            if(i != j){
                
                lineupBtn[j].classList.remove('clickBtn');
                LineupCount=0;
            }
        }
        if(lineupBtn[i].classList.contains("clickBtn")){
            lineupBtn[i].classList.remove('clickBtn');
            
            if(LineupCount!=0){
                --LineupCount;
               if(LocationCount==0 & LineupCount==0 & GradeCount == 0){
                const d = document.querySelector('.filter-submitBtn');
                d.classList.remove('filter-submitBtn-Click');
                }
            }
            
            console.log(LineupCount);
        }else{
           
                lineupBtn[i].classList.add('clickBtn');
                const d = document.querySelector('.filter-submitBtn');
                d.classList.remove('filter-submitBtn-nonClick');
                d.classList.add('filter-submitBtn-Click');
    
                LineupCount++;
                console.log(LineupCount);
            
        }
    })
    
    }

// 등급버튼 클릭시 스타일 변경 및 최대 3개 넘길 시 alert 창
for(let i = 0; i < gradeBtn.length; i++){

    gradeBtn[i].addEventListener('click',function(){
        if(gradeBtn[i].classList.contains("clickBtn")){
            gradeBtn[i].classList.remove('clickBtn');
            
            if(GradeCount!=0){
                --GradeCount;
               if(LocationCount==0 & LineupCount==0 & GradeCount == 0){
                const d = document.querySelector('.filter-submitBtn');
                d.classList.remove('filter-submitBtn-Click');
                }
            }
            
            console.log(GradeCount);
        }else{
            if(GradeCount >= 3){
               
                alert('최대 3개까지 선택 가능합니다.');
            }else{
                gradeBtn[i].classList.add('clickBtn');
                const d = document.querySelector('.filter-submitBtn');
                d.classList.remove('filter-submitBtn-nonClick');
                d.classList.add('filter-submitBtn-Click');
    
                GradeCount++;
                console.log(GradeCount);
            }
        }
    })
    
}

// 초기화 버튼 클릭시 눌리는 것처럼 보이기

    
    
    
    
    // 모달 초기화 및 닫기 눌렀을 때 form요소 내용 리셋
    const form =  document.querySelector('.MyModal');
    
    function resetModal(){

        LocationCount = 0;
        LineupCount = 0;
        GradeCount = 0;
        const d = document.querySelector('.filter-submitBtn');
        d.classList.remove('filter-submitBtn-Click');

        locationBtn.forEach((a,index) =>{       
        a.classList.remove('clickBtn');
      })

      lineupBtn.forEach((a,index) =>{
        a.classList.remove('clickBtn')
      })

      gradeBtn.forEach((a,index) =>{
        a.classList.remove('clickBtn')
      })
         
         
}

/*************************************************************************************/

/*********************** join board *******************************/
// 카드 추가 함수
function appendCardfd() {
    for (let i = 0; i < 8; i++) {

        if(i < 4){
        var cardfd =


            '<div class="col card-queryfd">'
            + '<a href="FriendDetailBoard.html">'
            + '<div class="card h-100 siren-card-customfd">'
            + '<div class="card-body h-25 ratio "style="--bs-aspect-ratio: 50%;">'
            + '<img src="/sns/resources/img/board/car2.png" class="card-img-top boardImgfd" onerror="this.src=\'/sns/resources/img/board/car1.png\'" alt="">'
            // + '<img src="/sns/resources/img/board/siren.png" class="sirenImg" alt="">'
            // + '<h3 class="sirenTitle"></h3>'
            + '</div>'
            + ''
            + '<h5 class="card-titlefd p-3"><img src="/sns/resources/img/board/siren.png" class="sirenImgfd" alt="">파리 여행 동행분 구합니다</h5>'
            + '<div class="col plus-customfd d-flex align-self-end align-item-center m-4">'
            + '<div class="pifd">'
            + '<i class="plusicon-customfd fa-solid fa-plus"></i>'
            + '</div>'
            + '</div>'
            + '<div class="card-footer">'
            + '<small class="text-body-secondary d-flex justify-content-between">'
            + '<p class="mb-0">2024.07.29</p>'
            + '<p class="mb-0"> 조회수 : 134 </p>'
            + '<p class="mb-0">LIKE : 64</p>'
            + '</small>'
            + '</div>'
            + '</div>'
            + '</a>'
            + '</div>'

        $('.cardFormfd').append(cardfd);
        
        }

    }

}

appendCardfd();


// 일반 카드 스타일 변경
const cardfd = document.querySelectorAll('.card-customfd');
cardfd.forEach((a, index) => {


    a.addEventListener('mouseover', function () {
        this.style.border = '2px solid rgb(127, 216, 88)';
        this.style.transform = 'scale(1.02)';
        this.style.boxShadow = 'rgba(100, 100, 111, 0.2) 0px 7px 29px 0px';
        this.querySelector('.pifd').style.backgroundColor = 'rgb(127, 216, 88)';
        this.querySelector('.pifd').style.transform = 'rotate(90deg)';

    });

    a.addEventListener('mouseout', function () {
        this.style.border = '2px solid #D2D2D2';
        this.style.transform = 'scale(1)';
        this.style.boxShadow = 'none';
        this.querySelector('.pifd').style.backgroundColor = 'rgb(42, 157, 143,0)';
        this.querySelector('.pifd').style.transform = 'rotate(0)';

    });

})

// 급구 카드 스타일 변경
const cardfd1 = document.querySelectorAll('.siren-card-customfd');
cardfd1.forEach((a, index) => {


    a.addEventListener('mouseover', function () {
        this.style.border = '2px solid red';
        this.style.transform = 'scale(1.02)';
        this.style.boxShadow = 'rgba(100, 100, 111, 0.2) 0px 7px 29px 0px';
        this.querySelector('.pifd').style.backgroundColor = 'red';
        this.querySelector('.pifd').style.transform = 'rotate(90deg)';

    });

    a.addEventListener('mouseout', function () {
        this.style.border = '2px solid #D2D2D2';
        this.style.transform = 'scale(1)';
        this.style.boxShadow = 'none';
        this.querySelector('.pifd').style.backgroundColor = 'rgb(42, 157, 143,0)';
        this.querySelector('.pifd').style.transform = 'rotate(0)';

    });

})




// 여행지버튼 클릭시 스타일 변경 및 최대 3개 넘길 시 alert 창
const locationBtnfd = document.querySelectorAll('.locationBtnfd');
const lineupBtnfd = document.querySelectorAll('.lineupBtnfd');
const gradeBtnfd = document.querySelectorAll('.gradeBtnfd');
const locationBtnfdChk = document.querySelectorAll('.locationBtnfdChk');

let LocationCountfd = 0;
let LineupCountfd = 0;
let GradeCountfd = 0;
for(let i = 0; i < locationBtnfd.length; i++){
   
    locationBtnfd[i].addEventListener('click',function(){

        if(locationBtnfdChk[i].classList.contains("clickBtnfd")){
            locationBtnfdChk[i].classList.remove('clickBtnfd');
            
            if(LocationCountfd!=0){
                --LocationCountfd;
               if(LocationCountfd==0 & LineupCountfd==0 & GradeCountfd == 0){
                const dfd = document.querySelector('.filter-submitBtnfd');
                dfd.classList.remove('filter-submitBtn-Clickfd');
                }
            }
            
            console.log(LocationCountfd);
        }else{
            if(LocationCountfd >= 3){
                alert('최대 3개까지 선택 가능합니다.');
            }else{
                locationBtnfdChk[i].classList.add('clickBtnfd');
                const dfd = document.querySelector('.filter-submitBtnfd');
                dfd.classList.remove('filter-submitBtn-nonClickfd');
                dfd.classList.add('filter-submitBtn-Clickfd');

                LocationCountfd++;
                console.log(LocationCountfd);
            }
        }
    })

}
// 정렬버튼 클릭시 스타일 변경 및 최대 3개 넘길 시 alert 창
for(let i = 0; i < lineupBtnfd.length; i++){

lineupBtnfd[i].addEventListener('click',function(){

for(let j = 0; j < lineupBtnfd.length; j++){
        if(i != j){
            
            lineupBtnfd[j].classList.remove('clickBtnfd');
            LineupCountfd=0;
        }
    }
    if(lineupBtnfd[i].classList.contains("clickBtnfd")){
        lineupBtnfd[i].classList.remove('clickBtnfd');
        
        if(LineupCountfd!=0){
            --LineupCountfd;
           if(LocationCountfd==0 & LineupCountfd==0 & GradeCountfd == 0){
            const dfd = document.querySelector('.filter-submitBtnfd');
            dfd.classList.remove('filter-submitBtn-Clickfd');
            }
        }
        
        console.log(LineupCountfd);
    }else{



            lineupBtnfd[i].classList.add('clickBtnfd');
            const dfd = document.querySelector('.filter-submitBtnfd');
            dfd.classList.remove('filter-submitBtn-nonClickfd');
            dfd.classList.add('filter-submitBtn-Clickfd');

            LineupCountfd++;
            console.log(LineupCountfd);

    }
})

}

// 등급버튼 클릭시 스타일 변경 및 최대 3개 넘길 시 alert 창
for(let i = 0; i < gradeBtnfd.length; i++){

    gradeBtnfd[i].addEventListener('click',function(){
        if(gradeBtnfd[i].classList.contains("clickBtnfd")){
            gradeBtnfd[i].classList.remove('clickBtnfd');
            
            if(GradeCountfd!=0){
                --GradeCountfd;
               if(LocationCountfd==0 & LineupCountfd==0 & GradeCountfd == 0){
                const dfd = document.querySelector('.filter-submitBtnfd');
                dfd.classList.remove('filter-submitBtn-Clickfd');
                }
            }
            
            console.log(GradeCountfd);
        }else{
            if(GradeCountfd >= 3){
                // lineupBtn쪽에선 필요 없는 기능임 어짜피 최대 3개라서
                alert('최대 3개까지 선택 가능합니다.');
            }else{
                gradeBtnfd[i].classList.add('clickBtnfd');
                const dfd = document.querySelector('.filter-submitBtnfd');
                dfd.classList.remove('filter-submitBtn-nonClickfd');
                dfd.classList.add('filter-submitBtn-Clickfd');
    
                GradeCountfd++;
                console.log(GradeCountfd);
            }
        }
    })
    
}


    
    
    
    
    
    // 모달 초기화 및 닫기 눌렀을 때 form요소 내용 리셋
    const formfd =  document.querySelector('.MyModalfd');
    
    function resetModalfd(){

        LocationCountfd = 0;
        LineupCountfd = 0;
        GradeCountfd = 0;
        const dfd = document.querySelector('.filter-submitBtnfd');
        dfd.classList.remove('filter-submitBtn-Clickfd');

        locationBtnfd.forEach((a,index) =>{       
        a.classList.remove('clickBtnfd');
      })

      lineupBtnfd.forEach((a,index) =>{
        a.classList.remove('clickBtnfd')
      })

      gradeBtnfd.forEach((a,index) =>{
        a.classList.remove('clickBtnfd')
      })
         
}
/*********************** ask board *******************************/

function appendAsk() {

    const title = document.querySelector('#asktitlevalue').value;
    const content = document.querySelector('#askcontentvalue').value;

    const tbody = document.querySelector('.asktable');

    // 새로운 tr 요소 생성
    const tr = document.createElement('tr');

    // 새로운 th 요소 생성 및 추가
    const th = document.createElement('th');
    th.setAttribute('scope', 'row');
    th.style.width = '80px';
    th.style.verticalAlign = 'top';
    th.style.alignItems = 'center';
    const p = document.createElement('p');
    p.classList.add('ask');
    p.textContent = '문의';
    th.appendChild(p);
    tr.appendChild(th);

    // 첫 번째 td 요소 생성 및 추가
    const td1 = document.createElement('td');
    td1.setAttribute('class', 'askText');
    td1.style.verticalAlign = 'middle'
    td1.innerHTML = `제목 : ${title} <br> ${content}`;
    tr.appendChild(td1);

    // 두 번째 td 요소 생성 및 추가
    const td2 = document.createElement('td');
    td2.style.textAlign = 'right';
    td2.innerHTML = '<input type="button" value="삭제"  class="btn btn-danger" onclick="deleteWrite()" ><br><br>' +
        '<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#answerAsk">답변</button>';
    tr.appendChild(td2);

    // 생성한 tr 요소를 tbody에 추가
    tbody.appendChild(tr);
}


function deleteWrite() {

}


function appendAnswer() {
    const content = document.querySelector('#answercontentvalue').value;
    
    const tbody = document.querySelector('.asktable');
    const tr = document.createElement('tr');

    const th = document.createElement('th');
    th.setAttribute('scope','row');
    th.style.width = '80px';
    th.style.verticalAlign = 'top';
    th.style.position='relative'
    
    th.innerHTML='<i class="fa-solid fa-arrow-turn-up arrow"></i>';

    const div = document.createElement('div');
    div.setAttribute('class', 'answer');
    div.style.background='#e76f51';
    div.style.width='40px';
    div.style.height='20px';
    div.style.textAlign='center';
    


    const p1 = document.createElement('p');
    p1.innerHTML='&nbsp;답변';
    p1.style.position='relative';
    p1.style.right='2px'
    div.appendChild(p1);
    th.appendChild(div);
   
    tr.appendChild(th);

    const td = document.createElement('td');
    td.setAttribute('colspan','2');
    const p2 = document.createElement('p');
    p2.innerHTML=`${content}`;
    td.appendChild(p2);
    tr.appendChild(td);

    tbody.appendChild(tr);
}

/*************************************** insertboard ******************************************************/
// 카테고리 선택 
document.getElementById('board-select').addEventListener('change', function (event) {
    var selected = document.getElementById('board-select').value
    console.log(selected);
    if (selected == "free") {
        document.getElementById('free-category-select').style.display = "inline";
    }
    else {
        document.getElementById('free-category-select').style.display = "none";
    }
});


// 오프캔버스 기능 추가
document.addEventListener('DOMContentLoaded', function () {
    const openBtn = document.getElementById('open-WriteOffcanvas');
    const closeBtn = document.getElementById('close-WriteOffcanvas');
    const offcanvas = document.getElementById('write-offcanvas');

    openBtn.addEventListener('click', function () {
        offcanvas.classList.add('show');

        document.addEventListener('click', handleOutsideClick);
    });

    closeBtn.addEventListener('click', function () {
        offcanvas.classList.remove('show');

        document.removeEventListener('click', handleOutsideClick);
    });
    function handleOutsideClick(event) {
        // 오프캔버스와 관련된 요소를 제외한 클릭 감지
        if (!offcanvas.contains(event.target) && !openBtn.contains(event.target)) {
            offcanvas.classList.remove('show');
            document.removeEventListener('click', handleOutsideClick);
        }
    }
});

document.addEventListener('DOMContentLoaded', () => {
    const tripShareitems = document.querySelectorAll('.trip-share-item');
    const tripShareDetail = document.getElementById('detail-hidden-sch');
    const tripShareContainer = document.getElementById('write-offcanvas-content');
    const backButton = document.getElementById('backButton');
    const tripDetailContent = document.getElementById('tripDetailContent');
    const writeTextContainer = document.getElementById('write-text-container');
    const tripDetailDisplayContainer = document.getElementById('tripDetailDisplayContainer'); // 새 공간
    const tripItemsList = document.getElementById('trip-items-list');

    // 날짜를 나열하는 함수
    function getDatesInRange(startDate, endDate) {
        const date = new Date(startDate);
        const dates = [];

        while (date <= endDate) {
            dates.push(new Date(date));
            date.setDate(date.getDate() + 1);
        }

        return dates;
    }

    // 각 날짜에 대해 장소를 매핑하는 함수 
    function getPlacesForDate(date) {
        const places = {
            "2024-08-09": [
                { place: "에펠탑" },
                { place: "루브르 박물관" },
                { place: "노트르담 대성당" }
            ],
            "2024-08-10": [
                { place: "몽마르트 언덕" },
                { place: "사크레쾨르 성당" },
                { place: "파리 시청" }
            ],
            "2024-08-11": [
                { place: "오르세 미술관" },
                { place: "콩코르드 광장" },
                { place: "샹젤리제 거리" }
            ],
            "2024-08-12": [
                { place: "베르사유 궁전" },
                { place: "라데팡스" },
                { place: "파리 디즈니랜드" }
            ]
        };

        const formattedDate = date.toISOString().split('T')[0];
        return places[formattedDate] || [{ place: "장소 정보 없음" }];
    }

    // 컨테이너의 표시 상태를 업데이트하는 함수
    function updateContainerVisibility() {
        if (tripItemsList.children.length > 0) {
            tripDetailDisplayContainer.style.display = 'block';
        } else {
            tripDetailDisplayContainer.style.display = 'none';
        }
    }

    // 각 trip-share-item에 클릭 이벤트 추가
    tripShareitems.forEach(tripShareitem => {
        tripShareitem.addEventListener('click', () => {
            tripShareContainer.style.display = 'none';
            tripShareDetail.style.display = 'block';

            const titleElement = tripShareitem.querySelector('.trip-uplaod-title');
            const dateElement = tripShareitem.querySelector('.share-upload-date');

            if (titleElement) {
                tripDetailContent.innerHTML = `<h4 style="margin-bottom:20px">${titleElement.textContent}</h4>`;
            } else {
                tripDetailContent.innerHTML = '<h4>제목 없음</h4>';
            }

            if (dateElement) {
                const dateRange = dateElement.textContent.match(/\d{4}\.\d{2}\.\d{2}/g);

                if (dateRange.length === 2) {
                    const startDate = new Date(dateRange[0].replace(/\./g, '-'));
                    const endDate = new Date(dateRange[1].replace(/\./g, '-'));

                    // 시작일 끝일 넣기
                    const dates = getDatesInRange(startDate, endDate);

                    dates.forEach(date => {
                        const dateStr = date.toISOString().split('T')[0];
                        const places = getPlacesForDate(date);

                        const placeListHtml = places.map(place => `<li class="place-item" data-date="${dateStr}"  data-place="${place.place}"> ${place.place}</li>`).join('');
                        tripDetailContent.innerHTML += `<div><strong>${dateStr}</strong><ul">${placeListHtml}</ul></div>`;
                    });

                    // 각 장소에 클릭 이벤트 추가
                    const placeItems = tripDetailContent.querySelectorAll('.place-item');
                    placeItems.forEach(placeItem => {
                        placeItem.addEventListener('click', () => {
                            const date = placeItem.getAttribute('data-date');
                            const place = placeItem.getAttribute('data-place');

                            const currentText = writeTextContainer.value;
                            const newEntry = `${date} ${place}`;

                            if (currentText.includes(newEntry)) {
                                alert('이미 추가된 일정입니다.');
                            } else {

                                // 새로운 공간에 날짜와 장소를 표시, 그리고 삭제 버튼 추가
                                const detailEntry = document.createElement('div');
                                detailEntry.className = 'trip-detail-entry';
                                detailEntry.innerHTML = `
                                    <span><strong>${date}  </strong> - ${place}</span>
                                    <button class="remove-select-item-btn">삭제</button>
                                `;
  
                                tripItemsList.appendChild(detailEntry);

                                // 삭제 버튼에 이벤트 추가
                                const removeButton = detailEntry.querySelector('.remove-select-item-btn');
                                removeButton.addEventListener('click', () => {
                                    tripItemsList.removeChild(detailEntry);

                                    // textarea에서 해당 항목도 제거
                                    writeTextContainer.value = writeTextContainer.value.replace(`${newEntry}\n`, '');

                                    // 컨테이너 표시 상태 업데이트
                                    updateContainerVisibility();
                                });

                                // 컨테이너 표시 상태 업데이트
                                updateContainerVisibility();
                            }
                        });
                    });

                    // 초기 컨테이너 표시 상태 업데이트
                    updateContainerVisibility();
                }
            }
        });
    });

    backButton.addEventListener('click', () => {
        tripShareDetail.style.display = 'none';
        tripShareContainer.style.display = 'block';
    });
});

