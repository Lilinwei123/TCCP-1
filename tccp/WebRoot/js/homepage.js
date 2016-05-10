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
$(document).ready(function () { 
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

//发表动态验证
function checkAddMood(){
    if (document.getElementById("textarea").value == "")    {        
        alert("输入内容为空！");        
        return false;    
        }
    else{
    	alert("动态发表成功!");
        return true;
        }
}

//发表动态验证
function checkAddComment(){  
    if (document.getElementById("textarea_two").value == "")    {        
        alert("输入内容为空！");        
        return false;    
        }
    else{
    	alert("评论发表成功!");
        return true;
        }
}

