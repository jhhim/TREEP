/*********************** free board *******************************/
// 카드 추가하는 반복문
function appendCard(){
    for(let i = 0; i < 8; i++){
        
        var card = 
          '<div class="col card-query">'
        + '<a href="FriendDetailBoard.html">'
        + '<div class="card h-100 card-custom">'
        + '<div class="card-body h-25 ratio "style="--bs-aspect-ratio: 50%;">'
        + '<img src="/sns/resources/img/board/car2.png" class="card-img-top boardImg" onerror="this.src=\'/sns/resources/img/board/car1.png\'" alt="">'
        +  '</div>'
        +  '<h5 class="card-title p-3">파리 여행 동행분 구합니다</h5>'
        +  '<div class="col plus-custom d-flex align-self-end align-item-center m-4">'
        +  '<div class="pi">'
        +  '<i class="plusicon-custom fa-solid fa-plus"></i>'
        +  '</div>'
        +  '</div>'
        +  '<div class="card-footer">'
        +  '<small class="text-body-secondary d-flex justify-content-between">'
        +  '<p class="mb-0">2024.07.29</p>'
        +  '<p class="mb-0"> 조회수 : 134 </p>'
        +  '<p class="mb-0">LIKE : 64</p>'
        +  '</small>'
        +  '</div>'
        +  '</div>'
        +  '</a>'
        +  '</div>'
       

        $('.cardForm').append(card);
    }

}

appendCard();


// 카드에 마우스 올라왔을 때 이벤트 발생
const card = document.querySelectorAll('.card-custom');

card.forEach((a, index) =>{
    

    a.addEventListener('mouseover',function(){
         this.style.border = '2px solid rgb(42, 157, 143)';
         this.style.transform='scale(1.02)';
         this.style.boxShadow='rgba(100, 100, 111, 0.2) 0px 7px 29px 0px';
         this.querySelector('.pi').style.backgroundColor='rgb(42, 157, 143)';
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
        if(LineupCount >= 3){
            // lineupBtn쪽에선 필요 없는 기능임 어짜피 최대 3개라서
            // alert('최대 3개까지 선택 가능합니다.');
        }else{
            lineupBtn[i].classList.add('clickBtn');
            const d = document.querySelector('.filter-submitBtn');
            d.classList.remove('filter-submitBtn-nonClick');
            d.classList.add('filter-submitBtn-Click');

            LineupCount++;
            console.log(LineupCount);
        }
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
const resetBtn = document.querySelector('.resetBtn');
resetBtn.addEventListener('mousedown', function(){
   
        resetBtn.classList.add('resetBtnClick');
    });
    
resetBtn.addEventListener('mouseup', function(){
        
        resetBtn.classList.remove('resetBtnClick');
        
    });
    
    
    
    
    
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
