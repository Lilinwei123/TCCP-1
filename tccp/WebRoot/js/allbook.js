    function getFileUrl(sourceItem) { 
        sourceItem = document.getElementById('upload');
        var url; 
        if (navigator.userAgent.indexOf("MSIE")>=1) { // IE 
        url = sourceItem.value; 
        } else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox 
        url = window.URL.createObjectURL(sourceItem.files.item(0)); 
        } else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome 
        url = window.URL.createObjectURL(sourceItem.files.item(0)); 
        } 
        return url; 
    } 

    $('#uploadbook').click(function(event) {
        event.prventDefault;
        var temp = $('.box-all').children().length;
        var source = $('.box-all').children().eq(temp - 2);
        var myClone = source.clone();
        $('.box-all').children().eq(temp -2) .after(myClone);
         $.getScript('./js/jquery-func.js');
         BOX_remove('layer_box');
         var url = getFileUrl("upload"); 
         var tip = $('#bookname').val();
         myClone.find('img').attr('src', url);
         myClone.find('span span').text(tip);
    });
function BOX_show(e,a)//显示 
{ 
    BOX_layout(e); 
    window.onresize = function() { BOX_layout(e); } //改变窗体重新调整位置 
    window.onscroll = function() { BOX_layout(e); } //滚动窗体重新调整位置 
   document.onkeyup = function(event) { 
       var evt = window.event || event; 
        var code = evt.keyCode ? evt.keyCode : evt.which; 
        //alert(code);  
        if (code == 27) { 
            BOX_remove(e); 
        } 
    } 
} 
function BOX_remove(e)//移除 

{ 
    window.onscroll = null; 
    window.onresize = null; 
    document.getElementById('BOX_overlay').style.display = "none"; 
    document.getElementById(e).style.display = "none";  
    var selects = document.getElementsByTagName('select'); 
    for (i = 0; i < selects.length; i++) { 
        selects[i].style.visibility = "visible"; 
    } 
}  
function BOX_layout(e)//调整位置 
{ 

    var a = document.getElementById(e);  
    if (document.getElementById('BOX_overlay') == null)//判断是否新建遮掩层 
    {  
       var overlay = document.createElement("div"); 

        overlay.setAttribute('id', 'BOX_overlay');  
//overlay.onclick=function(){BOX_remove(e);}; 
        //a.parentNode.appendChild(overlay); 
        document.body.appendChild(overlay); 
    }  
    document.getElementById('BOX_overlay').ondblclick = function() { BOX_remove(e); }; 
    //取客户端左上坐标，宽，高 
    var scrollLeft = (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft); 
    var scrollTop = (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);  
    var clientWidth; 
    if (window.innerWidth) { 
        clientWidth = window.innerWidth; 
        //clientWidth = ((Sys.Browser.agent === Sys.Browser.Safari) ? window.innerWidth : Math.min(window.innerWidth, document.documentElement.clientWidth)); 
    } 
   else { 
        clientWidth = document.documentElement.clientWidth; 
    }  
    var clientHeight; 
    if (window.innerHeight) { 
        clientHeight = window.innerHeight; 
        //clientHeight = ((Sys.Browser.agent === Sys.Browser.Safari) ? window.innerHeight : Math.min(window.innerHeight, document.documentElement.clientHeight)); 
    } 
    else { 

        clientHeight = document.documentElement.clientHeight; 
    }  

    var bo = document.getElementById('BOX_overlay'); 
    bo.style.left = scrollLeft + 'px'; 
    bo.style.top = scrollTop + 'px'; 
    bo.style.width ='100%'; 
    bo.style.height = clientHeight + 'px'; 
    bo.style.display ="";  

    //Popup窗口定位 

    a.style.display = 'block' 
    a.style.left = scrollLeft + ((clientWidth - a.offsetWidth) / 2) + 'px'; 
    a.style.top = scrollTop + ((clientHeight - a.offsetHeight) / 2) + 'px'; 
} 
 function addComponent(){ 
   alert("aa"); 
var uploadHTML = document.createElement("<input type='file' name='upload'/>"); 
//lert("cc"); 
   document.getElementById("file").appendChild(uploadHTML); 
   uploadHTML = document.createElement("<p/>"); 
   document.getElementById("file").appendChild(uploadHTML); 
   } 
