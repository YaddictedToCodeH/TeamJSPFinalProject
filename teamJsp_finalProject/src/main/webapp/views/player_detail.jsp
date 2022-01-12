<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="./resources/css/player_detail.css" />
    
    <jsp:include page="./header.jsp" />
    

    <div id="player_detail-container">

        <div class="player-title">
            <hr><span>KT 소닉붐 ${playerDto.player_name}</span>
            <hr>
        </div>

        <div class="player_detail">
            <div class="player_detail-info">
                <img src="./resources/images/player_detailBg.jpg" alt="" class="player_detailBg">
                <img src="${playerDto.player_img}" alt="" class="player_img">
                <span class="player-no">No. ${playerDto.player_backno}</span>
                <span class="player-name">${playerDto.player_name}</span>
                <table class="player_detail-info-table">
                    <tr>
                        <th>등번호</th>
                        <th>포지션</th>
                        <th>생년월일</th>
                        <th>신장</th>
                        <th>체중</th>
                        <th>출신학교</th>
                    </tr>
                    <tr>
                        <td>No. ${playerDto.player_backno}</td>
                        <td>${playerDto.player_pos}</td>
                        <td>${playerDto.player_birth}</td>
                        <td>${playerDto.player_height}cm</td>
                        <td>${playerDto.player_weight}kg</td>
                        <td>${playerDto.player_school}</td>
                    </tr>
                </table>
            </div>

            <div class="player_detail-record">
                <table class="player_detail-record-table">
                    <tr>
                        <th>구분</th>
                        <th>득점</th>
                        <th>평균 츌전시간</th>
                        <th>필드골</th>
                        <th>3점슛</th>
                        <th>자유투</th>
                        <th>리바운드</th>
                        <th>어시스트</th>
                        <th>스틸</th>
                        <th>블록</th>
                        <th>턴오버</th>
                    </tr>
                    <tr>
                        <th>통산기록</th>
                        <td>${sumRecordDto.player_pts}</td>
                        <td>${sumRecordDto.player_min}</td>
                        <td>${sumRecordDto.player_fg}</td>
                        <td>${sumRecordDto.player_three}</td>
                        <td>${sumRecordDto.player_ft}</td>
                        <td>${sumRecordDto.player_reb}</td>
                        <td>${sumRecordDto.player_ast}</td>
                        <td>${sumRecordDto.player_stl}</td>
                        <td>${sumRecordDto.player_bs}</td>
                        <td>${sumRecordDto.player_to}</td>
                    </tr>
                    <tr>
                        <th>평균기록</th>
                        <td>${avgRecordDto.player_pts}</td>
                        <td>${avgRecordDto.player_min}</td>
                        <td>${avgRecordDto.player_fg}</td>
                        <td>${avgRecordDto.player_three}</td>
                        <td>${avgRecordDto.player_ft}</td>
                        <td>${avgRecordDto.player_reb}</td>
                        <td>${avgRecordDto.player_ast}</td>
                        <td>${avgRecordDto.player_stl}</td>
                        <td>${avgRecordDto.player_bs}</td>
                        <td>${avgRecordDto.player_to}</td>
                    </tr>
                    <tr>
                        <th>최고기록</th>
                        <td>${topRecordDto.player_pts}</td>
                        <td>${topRecordDto.player_min}</td>
                        <td>${topRecordDto.player_fg}</td>
                        <td>${topRecordDto.player_three}</td>
                        <td>${topRecordDto.player_ft}</td>
                        <td>${topRecordDto.player_reb}</td>
                        <td>${topRecordDto.player_ast}</td>
                        <td>${topRecordDto.player_stl}</td>
                        <td>${topRecordDto.player_bs}</td>
                        <td>${topRecordDto.player_to}</td>
                    </tr>
                </table>
            </div>

        </div>

    </div>
    
    
    <jsp:include page="./footer.jsp" />