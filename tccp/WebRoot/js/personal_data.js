window.onload = function(){
    var nd = document.getElementById("nav-dot");
    var aLi = nd.getElementsByTagName('li');

    nd.onclick = function(ev){
        var ev = ev || window.event;
        var target = ev.target || ev.srcElement;
        if(target.nodeName.toLowerCase() == "li"){
            target.style.background = "#dcdcdc";
            target.style.fontWeight = "600";
        }
    }
    nd.onmouseover = function(ev){
        var ev = ev || window.event;
        var target = ev.target || ev.srcElement;
        if(target.nodeName.toLowerCase() == "li"){
            target.style.background = "#dcdcdc";
            target.style.fontWeight = "600";
        }
    }
    nd.onmouseout = function(ev){
        var ev = ev || window.event;
        var target = ev.target || ev.srcElement;
        if(target.nodeName.toLowerCase() == "li"){
            target.style.background = "";
            target.style.fontWeight = "";
        }
    }
}
//上传本地照片
jQuery(function () { 
    $("#conf-pic").click(function () { 
        $("#_f").click(); 
    }); 
}); 
//本地照片显示在浏览器中
function showPreview(source){
    var file = source.files[0];
    
    if(window.FileReader){
        var fr = new FileReader();
        fr.onload = function(e){
            document.getElementById("portrait").src = e.target.result;
        };
        fr.readAsDataURL(file);
    }
}
//上传本地照片
$(document).ready(function() {
    $(".camera").click(function(){
        $("#pic_trans").slideToggle("slow");
    })
});
//发表评论，显示框隐藏，并且显示发表成功
function makecomment(){
    var myM = document.getElementById("textarea");

    if(myM.value == ""){
        alert("输入内容为空！");
    }
    else{
        alert("评论发表成功！")
    }
}

$(document).ready(function(){
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var x = xmlhttp.responseText;
			var JSONObject = JSON.parse(x);
			
			var action = new Array();//状态
		    var comment = new Array();//评论

		    var t = 0, m = 0, n = 0;
		    for(var i = 0; i < JSONObject.length; i++){
		        if(JSONObject[i].action_type == 0){
		            action[t++] = JSONObject[i];
		        }else if(JSONObject[i].action_type == 1){
		            comment[m++] = JSONObject[i];
		        }
		    }

		    for(var i = 0; i < action.length; i++){
		        $(".friend-trends:first").before($('.friend-trends:first').clone(true));
		        $(".friend-trends:first .mod-content").css("display", "none");
		        var src1 = action[i].image;
		        $(".trends img:first").attr('src', src1);
		        $("#trends-name").text(action[i].username);
		        $("#now-time").text(action[i].action_date);
		        $("#act_mes:first").text(action[i].action_message);
		        $("#count").text(action[i].action_describe);
		        for(var j = 0; j < comment.length; j++){
		            if(comment[j].action_describe == action[i].action_id){
		                $(".trends:first").after($('.mod-content:first').clone(true));
		                var src2 = comment[j].image;
		                $(".comment-content img:first").attr('src', src2);
		                $(".mod-content:first").css("display","block");
		                $("#comment-name").text(comment[j].username);
		                $("#subtime").text(comment[j].action_date);
		                $("#content:first").text(comment[j].action_message);
		            }
		        }
		    }
		    $(".friend-trends:last").css("display", "none");
			
		}
	}
	var url = "action/selectAllMoodsByUserId";
	xmlhttp.open("POST", url, true);
	xmlhttp.send();
});