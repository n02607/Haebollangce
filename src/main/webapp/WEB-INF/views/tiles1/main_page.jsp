<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
   String ctxPath = request.getContextPath();
%>  

<style>

.challenge_title_a {
  width: 100%;
  height: 496px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  margin-top: 80px;
  background-color: white;
}

.challenge_title_b {
  font-weight: 700;
  font-size: 24px;
  line-height: 30px;
  display: flex;
  align-items: center;
  text-align: center;
  letter-spacing: -.4px;
  color: #3498d0;
  margin-bottom: 24px;
}

.challenge_title_c {
  font-weight: 700;
  font-size: 44px;
  line-height: 60px;
  display: flex;
  text-align: center;
  letter-spacing: -.4px;
  white-space: pre-wrap;
  color: #000;
  margin-bottom: 0;
}

.challenge_title_d {
font-weight: 400;
  font-size: 22px;
  line-height: 32px;
  letter-spacing: -.4px;
  color: #383535;
  display: flex;
  align-items: center;
  text-align: center;
}    






.challenge_title_e {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  background-color: #f4f4f4;
}




.challenge_title_f {
  font-weight: 700;
  font-size: 24px;
  line-height: 30px;
  display: flex;
  align-items: center;
  text-align: center;
  letter-spacing: -.4px;
  color: #3498d0;
  margin-bottom: 24px;
}

.challenge_title_g {
  font-weight: 900;
  font-size: 44px;
  line-height: 60px;
  display: flex;
  text-align: center;
  letter-spacing: -.4px;
  white-space: pre-wrap;
  color: #000;
  margin-bottom: 0;
}

.challenge_title_h {
  font-weight: 700;
  font-size: 24px;
  line-height: 30px;
  display: flex;
  align-items: center;
  text-align: center;
  letter-spacing: -.4px;
  color: #ff8a7a;
  margin-bottom: 24px;
}








.challenge_category {
 list-style-type: none;
 width: auto;
 height: 82px;
 display: flex;
 background-color: #fefefe;
 justify-content: center;
 align-items: center;
 margin: 0;
 overflow-x: auto;
 overflow-y: hidden;

 padding: 0;
 scroll-behavior: smooth;
 position:-webkit-sticky;
 position:sticky;
 top:0;
}

.challenge_category_item {
  position: relative;
  font-weight: 600;
  font-size: 20px;
  line-height: 60px;
  letter-spacing: -1px;
  color: #383535;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  margin-right: 25px;
  white-space: nowrap;
  cursor: pointer;
  min-height: 78px;
}

.challenge_category__image {
  margin-right: 10px;
  min-width: 15px;
}



.challenge_category li:before, .challenge_category li:after {
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;
  height: 3px;
  background: rgba(242, 244, 244, 0.5);
  content: '';
  -webkit-transition: -webkit-transform 0.3s;
  -moz-transition: -moz-transform 0.3s;
  transition: transform 0.3s;
  -webkit-transform: scale(0.85);
  -moz-transform: scale(0.85);
  transform: scale(0.85);
}

.challenge_category li:after {
  opacity: 0;
  -webkit-transition: top 0.3s, opacity 0.3s, -webkit-transform 0.3s;
  -moz-transition: top 0.3s, opacity 0.3s, -moz-transform 0.3s;
  transition: top 0.3s, opacity 0.3s, transform 0.3s;
}

.challenge_category li:hover:before, .challenge_category li:hover:after, .challenge_category li:focus:before, .challenge_category li:focus:after {
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  transform: scale(1);
  background: #3498d0;
}

.challenge_category li:hover:after, .challenge_category li:focus:after {
  top: 0%;
  opacity: 1;
}


.All_content__card__a {
  background-color: #f4f4f4;
  width: 100%;
  height: auto;
  margin-left: auto;
  margin-right: auto;
  position: relative;
  overflow: hidden;
  list-style: none;
  padding: 0;
  display: flex;
}

.All_content__card__b {
  height: auto;
  position: relative;
  width: 100%;
  display: flex;
}

.All_content__card__c {
  width: 1536px;
  margin-right: 100px;
  height: auto;
  display: flex;
  justify-content: center;
  flex-shrink: 0;
  position: relative;
  
} 

.All_content__card__d {
  background-color: #f4f4f4;
  display: grid;
  grid-template-columns: repeat(2,571px);
  grid-auto-rows: 215px;
  grid-column-gap: 24px;
  column-gap: 24px;
  grid-row-gap: 24px;
  row-gap: 24px;
  justify-content: center;
  padding-top: 40px;
}


.ChallengeCard_card {
  padding: 20px 16px;
  background-color: #fefefe;
  border-radius: 12px;
  display: flex;
  text-decoration: none;
  margin: 0!important;
  font-family: Pretendard;
  color: -webkit-link;
  cursor: pointer;
}

.ChallengeCard_card_image {
  width: 160px;
  height: 160px;
  border-radius: 16px;
  margin-right: 16px;
  object-fit: cover;
  aspect-ratio: auto 160 / 160;
  overflow-clip-margin: content-box;
  overflow: hidden;
}

.ChallengeCard_info {
  width: calc(100% - 168px);
  display: flex;
  flex-direction: column;
}

.ChallengeCard_info__subject {
  display: flex;
  margin-bottom: 20px;
}

a:hover { text-decoration: none;}

.ChallengeCard_tag {
  letter-spacing: -.4px;
  font-size: 15px;
  line-height: 18px;
  padding: 8px 13px;
  border-radius: 16px;
  background-color: #f4f4f4;
  color: #666060;
  display: flex;
  justify-content: center;
  align-items: center;
  font-weight: 600;
  text-align: center;
  margin-right: 6px;
}

.ChallengeCard_info__title {
  font-size: 24px;
  line-height: 28px;
  letter-spacing: -.4px;
  color: #383535;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
  margin-bottom: 4px;
  display: block;
  font-weight: bold;
}

.ChallengeCard_info__describe {
  font-size: 18px;
  line-height: 24px;
  letter-spacing: -.4px;
  font-weight: 400;
  color: #999696;
  display: flex;
  margin-bottom: 20px;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}

.ChallengeCard_info_calender {
  width: 20px;
  height: 20px;
  margin-top: 2px;
  margin-left: 3.5px;
  margin-right: 3px;
  aspect-ratio: auto 20 / 20;
  overflow-clip-margin: content-box;
  overflow: clip;
}

.ChallengeCard_info_check {
  width: 20px;
  height: 20px;
  margin-top: 2px;
  margin-left: 7px;
  margin-right: 3px;
  aspect-ratio: auto 20 / 20;
  overflow-clip-margin: content-box;
  overflow: clip;
}

.ChallengeCard_info_participants {
  display: flex;
}

.ChallengeCard_participant {
  width: 35px;
  height: 28px;
  border: 4px solid #fefefe;
  left: -2px;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  position: relative;
  border-radius: 100%;
  flex-shrink: 0;
}

.ChallengeCard_participant_image {
  width: 36px!important;
  height: 36px!important;
  object-fit: cover;
  border-radius: 100%;
  position: relative;
  flex-shrink: 0;
  aspect-ratio: auto 36 / 36;
  overflow-clip-margin: content-box;
  overflow: clip;
  
  
}

.ChallengeCard_participant_more {
  width: 36px;
  height: 36px;
  left: -36px;
  background-color: #000;
  border-radius: 100%;
  opacity: .5;
  position: relative;
  flex-shrink: 0;
  aspect-ratio: auto 36 / 36;
  overflow-clip-margin: content-box;
  overflow: clip;
}

.ChallengeCard_member {
  margin-left: 8.12px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.ChallengeCard_member_count {
  font-size: 16px;
  line-height: 19px;
  font-family: Pretendard;
  font-weight: 400;
  letter-spacing: -.4px;
  color: #999696;
}

.ChallengeCard_card {
  transition: all 0.6s cubic-bezier(.25,.8,.25,1);
}

.ChallengeCard_card:hover {
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
  transform: translate(0, -10px);
  
}


.sa span img {
  -webkit-filter: blur(2px);
  filter: blur(2px);

}

.All_content__card__e span img {
  -webkit-filter: blur(2px);
  filter: blur(2px);

}

.ChallengeCard_card:hover img{
  -webkit-filter: blur(0);
  filter: blur(0);
}


/* Scroll Animation (sa, 스크롤 애니메이션) */
.sa {
  opacity: 0;
  transition: all 0.8s ease;
  display: block;
  width: 571px;
  height: 176px;
  
}

/* 아래에서 위로 페이드 인 */
.sa-up {
  transform: translate(0, -100px);
}

.sa.show {
  opacity: 1;
  transform: none;
}


.Socialing_more {
  width: 180px;
  height: 68px;
  background: #fefefe;
  border-radius: 68px;
  font-weight: 600;
  font-size: 16px;
  line-height: 19px;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  letter-spacing: -.4px;
  margin-top: 15px;
  text-decoration: none;
  margin-left: 500px;
  color: inherit; 

}

.Socialing_more__text {
  display: flex;
  align-items: center;
}


.All_content__card__e:not(:nth-child(-n+4)) {
        display: none;
    }  
    
    
    
    
    section {
    display: block;
}
    .Main_section__rShmE {
    padding-top: 0px;
    position: relative;
    background-color: rgb(230, 225, 225);
    width: 100%;
    font-family: Pretendard;
}  


.Main_template__J5p3A {
    display: flex;
    max-width: 1169px;
    height: 696px;
    position: relative;
    flex-direction: column;
    justify-content: flex-start;
    margin: 0px auto;
}

.Main_content__UPjHs {
    display: flex;
    flex-direction: column;
    z-index: 200;
    width: 100%;
    margin-top: 70px;
}
.Main_mobile__NGfgV {
    display: none;
}
.Main_content__title__erjlR {
    width: 100%;
    font-style: normal;
    font-weight: 700;
    font-size: 48px;
    line-height: 61px;
    margin-bottom: 32px;
    margin-top: 60px;
}
.Main_content__description__DMNMc {
    width: 100%;
    font-style: normal;
    font-weight: 400;
    font-size: 30px;
    line-height: 24px;
    display: flex;
    align-items: center;
    letter-spacing: -0.4px;

    color: rgb(0, 0, 0);
        z-index: 100;
}
.Main_mobile__NGfgV {
    display: none;
}
.Main_people__qOdFR {
    position: absolute;
    bottom: 0px;
    right: 0px;
    width: 800px;
    object-fit: cover;
    background-color: rgb(230, 225, 225);
    z-index: 0;
}





#slider{
  width: 100%;
  position:relative;
}
.challenge_title_e{
  width: 100%;
  height: 450px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  font-size: 48px;
  position:absolute;
  z-index:0;
  opacity:0;
  transition: all 1s ease-in-out;
}
.challenge_title_e:nth-child(odd){
  background-color:royalblue;
}
.challenge_title_e:nth-child(even){
  background-color:blueviolet;
}
.showing{
  z-index:1;
  opacity:1;
}




</style>

<script>
const SHOWING_CLASS = "showing";
const firstSlide = document.querySelector(".challenge_title_e:first-child");

function slide(){

  const currentSlide = document.querySelector(`.${SHOWING_CLASS}`);

  if (currentSlide) { // 만약 현재 슬라이드라면
    currentSlide.classList.remove(SHOWING_CLASS); // 현재 슬라이드에서 SHOWING_CLASS를 제거한다
    const nextSlide = currentSlide.nextElementSibling; // 다음 슬라이드를 정의한다.

    if (nextSlide) { //만약 다음 슬라이드가 있다면
      nextSlide.classList.add(SHOWING_CLASS); //다음 슬라이드에 SHOWING_CLASS를 붙인다.
    } else { // 다음 슬라이드가 없다면 =>  5번째 슬라이드라면(마지막 슬라이드라면)
      firstSlide.classList.add(SHOWING_CLASS); // 첫번째 슬라이드에 SHOWING_CLASS를 붙인다.
    }

  } else {
    firstSlide.classList.add(SHOWING_CLASS);
  }
}

slide();
setInterval(slide, 2000);

</script>    
    
<section class="Main_section__rShmE">
                 <div class="Main_template__J5p3A">
                     <div class="Main_content__UPjHs">
                         <div class="Main_content__title__erjlR">
                             취향으로 <br/>만나는 우리
                         </div>
                         
                         
                     </div>
                     <div class="Main_content__description__DMNMc">
                             관심사 기반 커뮤니티, <b>&nbsp;Heabollangce</b>
                         </div>
                     
                     <img alt="people" src="https://o.remove.bg/downloads/3354c636-bf8f-4cae-8d01-739c912d2777/tid283t001156-removebg-preview.png" width="800" height="566" decoding="async" data-nimg="1" class="Main_people__qOdFR" style="color:transparent"/>
                 </div>
</section>    
    
    
    
    
    
    
    
    
    
    
       
<div id="slider">
 
<div class="challenge_title_e">
    <div class="challenge_title_f" style="margin-top: 90px;">
      <img alt="challenge-mark" src="https://images.munto.kr/munto-web/ic_info_challengeleader_16px.svg" class="challenge_title__icon__f3gEi"/>챌린지
    </div>
    <div class="challenge_title_g">같은 목표를 가진<br/>멤버들과 함께 도전해요</div>
  </div>

<div class="All_content__card__a">
  <div class="All_content__card__b">
      <div class="All_content__card__c">
      <div class="All_content__card__d">

        <div class="All_content__card__e">
          <a class="ChallengeCard_card" href="/detail-challenge?id=1676">
          <span><figure><img alt="recommemd" srcSet="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=256x256 1x, http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384 2x" src="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384" class="ChallengeCard_card_image" /></figure></span>
              <div class="ChallengeCard_info">
                  <div class="ChallengeCard_info__subject">
                      <div class="ChallengeCard_tag">자존감</div>
                  </div>
                  <div class="ChallengeCard_info__title">[감사일기] 매일 감사하고 다행한 일을 찾아 긍정 습관 만들어요💛</div>
                  <div class="ChallengeCard_info__describe">
                      챌린지 ·<img alt="info-calender" srcSet="https://images.munto.kr/munto-web/ic_info_calender.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48" class="ChallengeCard_info_calender"/>
                      5.21(일)
                      <!-- -->
                      · 
                      <!-- -->
                      3주
                      <!-- -->
                      간<img alt="info-check" srcSet="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48" class="ChallengeCard_info_check"/>주 
                      <!-- -->
                      5
                      <!-- -->
                      회
                  </div>
                  <div class="ChallengeCard_info_participants">
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          <img alt="more" srcSet="https://images.munto.kr/munto-web/action_more_24px.svg?s=48x48 1x, https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96 2x" src="https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96" class="ChallengeCard_participant_more"/>
                      </span>
                   
                      <div class="ChallengeCard_member">
                          <img alt="people" srcSet="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=16x16 1x, https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32 2x" src="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32"/>
                          <div class="ChallengeCard_member_count">66
                          <!-- -->
                          /
                          <!-- -->
                          99</div>
                      </div>
                  </div>
              </div>
          </a>
      </div>




      <div class="All_content__card__e" >
          <a class="ChallengeCard_card" href="/detail-challenge?id=1676">
              <span><figure><img alt="recommemd" srcSet="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=256x256 1x, http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384 2x" src="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384" class="ChallengeCard_card_image" /></figure></span>
              <div class="ChallengeCard_info">
                  <div class="ChallengeCard_info__subject">
                      <div class="ChallengeCard_tag">자존감</div>
                  </div>
                  <div class="ChallengeCard_info__title">[감사일기] 매일 감사하고 다행한 일을 찾아 긍정 습관 만들어요💛</div>
                  <div class="ChallengeCard_info__describe">
                      챌린지 ·<img alt="info-calender" srcSet="https://images.munto.kr/munto-web/ic_info_calender.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48" class="ChallengeCard_info_calender"/>
                      5.21(일)
                      <!-- -->
                      · 
                      <!-- -->
                      3주
                      <!-- -->
                      간<img alt="info-check" srcSet="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48" class="ChallengeCard_info_check"/>주 
                      <!-- -->
                      5
                      <!-- -->
                      회
                  </div>
                  <div class="ChallengeCard_info_participants">
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          <img alt="more" srcSet="https://images.munto.kr/munto-web/action_more_24px.svg?s=48x48 1x, https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96 2x" src="https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96" class="ChallengeCard_participant_more"/>
                      </span>
                   
                      <div class="ChallengeCard_member">
                          <img alt="people" srcSet="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=16x16 1x, https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32 2x" src="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32"/>
                          <div class="ChallengeCard_member_count">66
                          <!-- -->
                          /
                          <!-- -->
                          99</div>
                      </div>
                  </div>
              </div>
          </a>
      </div>

      <div class="All_content__card__e">
          <a class="ChallengeCard_card" href="/detail-challenge?id=1676">
              <span><figure><img alt="recommemd" srcSet="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=256x256 1x, http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384 2x" src="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384" class="ChallengeCard_card_image" /></figure></span>
              <div class="ChallengeCard_info">
                  <div class="ChallengeCard_info__subject">
                      <div class="ChallengeCard_tag">자존감</div>
                  </div>
                  <div class="ChallengeCard_info__title">[감사일기] 매일 감사하고 다행한 일을 찾아 긍정 습관 만들어요💛</div>
                  <div class="ChallengeCard_info__describe">
                      챌린지 ·<img alt="info-calender" srcSet="https://images.munto.kr/munto-web/ic_info_calender.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48" class="ChallengeCard_info_calender"/>
                      5.21(일)
                      <!-- -->
                      · 
                      <!-- -->
                      3주
                      <!-- -->
                      간<img alt="info-check" srcSet="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48" class="ChallengeCard_info_check"/>주 
                      <!-- -->
                      5
                      <!-- -->
                      회
                  </div>
                  <div class="ChallengeCard_info_participants">
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          <img alt="more" srcSet="https://images.munto.kr/munto-web/action_more_24px.svg?s=48x48 1x, https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96 2x" src="https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96" class="ChallengeCard_participant_more"/>
                      </span>
                   
                      <div class="ChallengeCard_member">
                          <img alt="people" srcSet="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=16x16 1x, https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32 2x" src="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32"/>
                          <div class="ChallengeCard_member_count">66
                          <!-- -->
                          /
                          <!-- -->
                          99</div>
                      </div>
                  </div>
              </div>
          </a>
      </div>

      <div class="All_content__card__e" >
          <a class="ChallengeCard_card" href="/detail-challenge?id=1676">
              <span><figure><img alt="recommemd" srcSet="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=256x256 1x, http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384 2x" src="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384" class="ChallengeCard_card_image" /></figure></span>
              <div class="ChallengeCard_info">
                  <div class="ChallengeCard_info__subject">
                      <div class="ChallengeCard_tag">자존감</div>
                  </div>
                  <div class="ChallengeCard_info__title">[감사일기] 매일 감사하고 다행한 일을 찾아 긍정 습관 만들어요💛</div>
                  <div class="ChallengeCard_info__describe">
                      챌린지 ·<img alt="info-calender" srcSet="https://images.munto.kr/munto-web/ic_info_calender.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48" class="ChallengeCard_info_calender"/>
                      5.21(일)
                      <!-- -->
                      · 
                      <!-- -->
                      3주
                      <!-- -->
                      간<img alt="info-check" srcSet="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48" class="ChallengeCard_info_check"/>주 
                      <!-- -->
                      5
                      <!-- -->
                      회
                  </div>
                  <div class="ChallengeCard_info_participants">
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                      </span>
                      <span class="ChallengeCard_participant">
                          <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          <img alt="more" srcSet="https://images.munto.kr/munto-web/action_more_24px.svg?s=48x48 1x, https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96 2x" src="https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96" class="ChallengeCard_participant_more"/>
                      </span>
                   
                      <div class="ChallengeCard_member">
                          <img alt="people" srcSet="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=16x16 1x, https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32 2x" src="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32"/>
                          <div class="ChallengeCard_member_count">66
                          <!-- -->
                          /
                          <!-- -->
                          99</div>
                      </div>
                  </div>
              </div>
          </a>
      </div>
</div>
          <a class="Socialing_more" href="<%=ctxPath%>/challenge_all"><div class="Socialing_more__text" style="color: black;">더보기<img src="https://images.munto.kr/munto-web/ic_arrow_right_14px.svg"></div></a>



      </div>
      </div>
      </div>
      </div>

      <div class="challenge_title_e">
        <div class="challenge_title_h">
            <img src="https://images.munto.kr/munto-web/ic_info_lounge-fill_24px.svg"/>라운지
        </div>
        <div class="challenge_title_g">비슷한 관심사를 가진<br/>멤버들의 취향 피드 구독하기</div>
      </div>
    
    <div class="All_content__card__a">
      <div class="All_content__card__b">
          <div class="All_content__card__c">
          <div class="All_content__card__d">
    
            <div class="All_content__card__e">
              <a class="ChallengeCard_card" href="/detail-challenge?id=1676">
              <span><figure><img srcSet="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=256x256 1x, http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384 2x" src="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384" class="ChallengeCard_card_image" /></figure></span>
                  <div class="ChallengeCard_info">
                      <div class="ChallengeCard_info__subject">
                          <div class="ChallengeCard_tag">자존감</div>
                      </div>
                      <div class="ChallengeCard_info__title">[감사일기] 매일 감사하고 다행한 일을 찾아 긍정 습관 만들어요💛</div>
                      <div class="ChallengeCard_info__describe">
                          챌린지 ·<img alt="info-calender" srcSet="https://images.munto.kr/munto-web/ic_info_calender.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48" class="ChallengeCard_info_calender"/>
                          5.21(일)
                          <!-- -->
                          · 
                          <!-- -->
                          3주
                          <!-- -->
                          간<img alt="info-check" srcSet="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48" class="ChallengeCard_info_check"/>주 
                          <!-- -->
                          5
                          <!-- -->
                          회
                      </div>
                      <div class="ChallengeCard_info_participants">
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                              <img alt="more" srcSet="https://images.munto.kr/munto-web/action_more_24px.svg?s=48x48 1x, https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96 2x" src="https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96" class="ChallengeCard_participant_more"/>
                          </span>
                       
                          <div class="ChallengeCard_member">
                              <img alt="people" srcSet="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=16x16 1x, https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32 2x" src="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32"/>
                              <div class="ChallengeCard_member_count">66
                              <!-- -->
                              /
                              <!-- -->
                              99</div>
                          </div>
                      </div>
                  </div>
              </a>
          </div>
    
          <div class="All_content__card__e" >
              <a class="ChallengeCard_card" href="/detail-challenge?id=1676">
                  <span><figure><img alt="recommemd" srcSet="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=256x256 1x, http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384 2x" src="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384" class="ChallengeCard_card_image" /></figure></span>
                  <div class="ChallengeCard_info">
                      <div class="ChallengeCard_info__subject">
                          <div class="ChallengeCard_tag">자존감</div>
                      </div>
                      <div class="ChallengeCard_info__title">[감사일기] 매일 감사하고 다행한 일을 찾아 긍정 습관 만들어요💛</div>
                      <div class="ChallengeCard_info__describe">
                          챌린지 ·<img alt="info-calender" srcSet="https://images.munto.kr/munto-web/ic_info_calender.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48" class="ChallengeCard_info_calender"/>
                          5.21(일)
                          <!-- -->
                          · 
                          <!-- -->
                          3주
                          <!-- -->
                          간<img alt="info-check" srcSet="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48" class="ChallengeCard_info_check"/>주 
                          <!-- -->
                          5
                          <!-- -->
                          회
                      </div>
                      <div class="ChallengeCard_info_participants">
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                              <img alt="more" srcSet="https://images.munto.kr/munto-web/action_more_24px.svg?s=48x48 1x, https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96 2x" src="https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96" class="ChallengeCard_participant_more"/>
                          </span>
                       
                          <div class="ChallengeCard_member">
                              <img alt="people" srcSet="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=16x16 1x, https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32 2x" src="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32"/>
                              <div class="ChallengeCard_member_count">66
                              <!-- -->
                              /
                              <!-- -->
                              99</div>
                          </div>
                      </div>
                  </div>
              </a>
          </div>
    
          <div class="All_content__card__e">
              <a class="ChallengeCard_card" href="/detail-challenge?id=1676">
                  <span><figure><img alt="recommemd" srcSet="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=256x256 1x, http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384 2x" src="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384" class="ChallengeCard_card_image" /></figure></span>
                  <div class="ChallengeCard_info">
                      <div class="ChallengeCard_info__subject">
                          <div class="ChallengeCard_tag">자존감</div>
                      </div>
                      <div class="ChallengeCard_info__title">[감사일기] 매일 감사하고 다행한 일을 찾아 긍정 습관 만들어요💛</div>
                      <div class="ChallengeCard_info__describe">
                          챌린지 ·<img alt="info-calender" srcSet="https://images.munto.kr/munto-web/ic_info_calender.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48" class="ChallengeCard_info_calender"/>
                          5.21(일)
                          <!-- -->
                          · 
                          <!-- -->
                          3주
                          <!-- -->
                          간<img alt="info-check" srcSet="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48" class="ChallengeCard_info_check"/>주 
                          <!-- -->
                          5
                          <!-- -->
                          회
                      </div>
                      <div class="ChallengeCard_info_participants">
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                              <img alt="more" srcSet="https://images.munto.kr/munto-web/action_more_24px.svg?s=48x48 1x, https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96 2x" src="https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96" class="ChallengeCard_participant_more"/>
                          </span>
                       
                          <div class="ChallengeCard_member">
                              <img alt="people" srcSet="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=16x16 1x, https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32 2x" src="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32"/>
                              <div class="ChallengeCard_member_count">66
                              <!-- -->
                              /
                              <!-- -->
                              99</div>
                          </div>
                      </div>
                  </div>
              </a>
          </div>
    
          <div class="All_content__card__e" >
              <a class="ChallengeCard_card" href="/detail-challenge?id=1676">
                  <span><figure><img alt="recommemd" srcSet="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=256x256 1x, http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384 2x" src="http://images.munto.kr/socialing-category/cover_category-7_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A1%E1%84%80%E1%85%B5%E1%84%80%E1%85%A8%E1%84%87%E1%85%A1%E1%86%AF_5.png?s=384x384" class="ChallengeCard_card_image" /></figure></span>
                  <div class="ChallengeCard_info">
                      <div class="ChallengeCard_info__subject">
                          <div class="ChallengeCard_tag">자존감</div>
                      </div>
                      <div class="ChallengeCard_info__title">[감사일기] 매일 감사하고 다행한 일을 찾아 긍정 습관 만들어요💛</div>
                      <div class="ChallengeCard_info__describe">
                          챌린지 ·<img alt="info-calender" srcSet="https://images.munto.kr/munto-web/ic_info_calender.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_info_calender.svg?s=48x48" class="ChallengeCard_info_calender"/>
                          5.21(일)
                          <!-- -->
                          · 
                          <!-- -->
                          3주
                          <!-- -->
                          간<img alt="info-check" srcSet="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48 2x" src="https://images.munto.kr/munto-web/ic_action_check_off_24px.svg?s=48x48" class="ChallengeCard_info_check"/>주 
                          <!-- -->
                          5
                          <!-- -->
                          회
                      </div>
                      <div class="ChallengeCard_info_participants">
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                          </span>
                          <span class="ChallengeCard_participant">
                              <img alt="participant" srcSet="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=48x48 1x, http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96 2x" src="http://images.munto.kr/production-user/1684331739071-photo-k5fkj-27080-0?s=96x96" class="ChallengeCard_participant_image"/>
                              <img alt="more" srcSet="https://images.munto.kr/munto-web/action_more_24px.svg?s=48x48 1x, https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96 2x" src="https://images.munto.kr/munto-web/action_more_24px.svg?s=96x96" class="ChallengeCard_participant_more"/>
                          </span>
                       
                          <div class="ChallengeCard_member">
                              <img alt="people" srcSet="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=16x16 1x, https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32 2x" src="https://images.munto.kr/munto-web/ic_info_person_14px.svg?s=32x32"/>
                              <div class="ChallengeCard_member_count">66
                              <!-- -->
                              /
                              <!-- -->
                              99</div>
                          </div>
                      </div>
                  </div>
              </a>
          </div>
          

          <a class="Socialing_more" href="<%=ctxPath%>/challenge_all"><div class="Socialing_more__text" style="color: black;">더보기<img src="https://images.munto.kr/munto-web/ic_arrow_right_14px.svg"></div></a>
    
    
    
          </div>
          </div>
          </div>
          </div>
      
    

  