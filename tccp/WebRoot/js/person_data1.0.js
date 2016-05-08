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
//显示当前日期
setInterval(function(){
    var myDate = new Date();
    var x = myDate.getFullYear() + "年" + myDate.getMonth() + "月" + myDate.getDate() 
    + "日" + myDate.getHours() + "点" + myDate.getMinutes()+ "分";
    document.getElementById("now-time").innerHTML = x;
}, 0);
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
//记录点赞次数
function count(){
    var ct = document.getElementById("count").innerHTML;
    var i = parseInt(ct, 10);

    i++;
    document.getElementById("count").innerHTML = i;
}
