//验证老密码是否正确
$(document).ready(function(){                
        $("#oldpassword").blur(function(){
                var param=$("#oldpassword").val();
                $.ajax({
                    url:"${HttpPath}/user/checkoldpassword",
                    data:{oldpassword:param},                 
                    success:function(e){
                       alert('执行第一个ajax');         
                      var obj = JSON.prase(e);
                        if(obj.code==1){                            
                             $("#tip1").html("<font color=\"green\" size=\"2\">  Correct</font>");
                        } 
                        else{                                 
                            $("#tip1").html("<font color=\"red\" size=\"2\">  Wrong</font>");
                        }
                    }                 
                });
           });
        //检验新密码是否合格
          $("#password1").blur(function(){
              var num=$("#password1").val().length;
              if(num<6){
                   $("#tip2").html("<font color=\"red\" size=\"2\">  too short</font>");                
              }
              else if(num>18){
                   $("#tip2").html("<font color=\"red\" size=\"2\">  too long</font>");                 
              }
              else{
                  $("#tip2").html("<font color=\"green\" size=\"2\"> Accept</font>");                
              }
          }) ;
          //再次确认密码准确性
          $("#password2").blur(function(){
              var tmp=$("#password1").val();
              var num=$("#password2").val().length;
              if($("#password2").val()!=tmp){
                  $("#tip3").html("<font color=\"red\" size=\"2\">  Wrong</font>");                 
              }
              else{
                  if(num>=6&&num<=18){
                      $("#tip3").html("<font color=\"green\" size=\"2\">  Correct</font>");                    
                  }                 
                  else{
                      $("#tip3").html("<font color=\"red\" size=\"2\">  invalid</font>");                           
                  }                
              }
          });
          //全部验证
              $("#btn").click(function(){
                  var flag=true;
                  var old=$("#oldpassword").val();
                  var pass=$("#password1").val();
                  var pass2=$("#password2").val();
                  var num1=$("#password1").val().length;
                  var num2=$("#password2").val().length;
                  if(num1!=num2||num1<6||num2<6||num1>18||num2>18||pass!=pass2){
                      flag=false;
                  }
                  else{
                      flag=true;
                  }
                  if(flag){                   
                  $.ajax({
                      url:"${HttpPath}/user/editPassowrdyet",
                      data:{oldpassword:old,password:pass},
                      success:function(e){             
                      alert('执行第二个ajax');            
                          if(e.code==1){
                              $("#tip4").show().html("<font color=\"green\" size=\"3\">  Edit Success!</font>").delay(2000).hide(0);
                              $("#oldpassword").val("");
                              $("#password1").val("");
                              $("#password2").val("");
                              $("#tip1").empty();
                              $("#tip2").empty();
                              $("#tip3").empty();
                              $("#tip4").delay(2000).hide(0);        
                          }
                          else{
                              $("#tip4").show().html("<font color=\"red\" size=\"3\">  OldPassword is Wrong!</font>").delay(2000).hide(0);
                          }                                     
                         }
                  });
              }
              else{
                  
                  $("#tip4").show().html("<font color=\"red\" size=\"3\">  Please follow the tips!</font>").delay(2000).hide(0);
              }
              });                  
        });
