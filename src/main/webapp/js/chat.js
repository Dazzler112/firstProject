var ws;

function wsOpen(){
    ws = new WebSocket("ws://" + location.host + "/chating");
    wsEvt();
}

function wsEvt(){
    ws.onopen = function(e){

    }

    ws.onmessage = function(e){
        var msg = e.data;
        if(msg != null && msg.trim() != ''){
            var d = JSON.parse(msg);

            if(d.type == "getId"){
                var si = d.sessionId != null ? d.sessionId : "";
                if(si != ''){
                    $("#sessionId").val(si);

                    var obj ={
                            type: "open",
                            sessionId: $("#sessionId").val(),
                            userName: $("#userName").val()
                    }
                    ws.send(JSON.stringify(obj))
                }
            }
            else if(d.type == "message"){
                if(d.sessionId == $("#sessionId").val()){
                    $("#chating").append("<p class='me'>" + d.msg + "</p>");
                } else{
                    $("#chating").append("<p class='others'>" + d.userName + " : " + d.msg + "</p>");
                }
            }
            // 새로운 유저가 입장하였을 경우
            else if(d.type == "open"){
                if(d.sessionId == $("#sessionId").val()){
                    $("#chating").append("<p class='start'>[채팅에 참가하였습니다.]</p>");
                } else{
                    $("#chating").append("<p class='start'>[" + d.userName + "]님이 입장하였습니다." + "</p>");
                }
            }
            // 유저가 퇴장하였을 경우
            else if(d.type == "close"){
                $("#chating").append("<p class='exit'>[" + d.userName + "]님이 퇴장하였습니다." + "</p>");
            }
            else{
                console.warn("unknown type!");
            }
        }
    }

    document.addEventListener("keypress", function(e){
        if(e.keyCode == 13) {
			send();
		}
    });
}

function chatName(){
    var userName = $("#userName").val();
    if(userName == null || userName.trim() == ""){
        alert("사용자 이름을 입력해주세요.");
        $("#userName").focus();
    } else{
        wsOpen();
        $("#yourName").hide();
        $("#yourMsg").show();
    }
}

function send(){
    var obj ={
            type: "message",
            sessionId: $("#sessionId").val(),
            userName: $("#userName").val(),
            msg: $("#chatting").val()
    }
    ws.send(JSON.stringify(obj));
    $('chatting').val("");
}