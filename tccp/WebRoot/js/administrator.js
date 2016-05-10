window.onload = function() {
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
			userInfo(JSONObject);
		}
	}
	var url = "user/getAllUsers";
	xmlhttp.open("POST", url, true);
	xmlhttp.send();
}


function userInfo(JSONObject) {
	// 创建table
	var table = document.getElementById("table");
	// 创建tbody
	var tbody = document.createElement("tbody");
	table.appendChild(tbody);
	// 创建每行
	for ( var i = 0; i < JSONObject.length; i++) {
		var row = document.createElement("tr");
		tbody.appendChild(row);
		// JSON解析
		var cell1 = document.createElement("td");
		cell1.appendChild(document.createTextNode(JSONObject[i].user_id));
		row.appendChild(cell1);
		var cell2 = document.createElement("td");
		cell2.appendChild(document.createTextNode(JSONObject[i].username));
		row.appendChild(cell2);
		if (JSONObject[i].sex == 0) {
			json_sex = "男";
		} else {
			json_sex = "女";
		}
		var cell3 = document.createElement("td");
		cell3.appendChild(document.createTextNode(json_sex));
		row.appendChild(cell3);
		var cell4 = document.createElement("td");
		cell4.appendChild(document.createTextNode(JSONObject[i].phonenum));
		row.appendChild(cell4);
		var cell5 = document.createElement("td");
		cell5.appendChild(document.createTextNode(JSONObject[i].grade));
		row.appendChild(cell5);
		var cell6 = document.createElement("td");
		cell6.appendChild(document.createTextNode(JSONObject[i].groups));
		row.appendChild(cell6);
	}
	document.getElementById("table-list").appendChild(table);
}
