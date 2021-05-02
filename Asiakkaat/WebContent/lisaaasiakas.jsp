<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Anna uuden asiakkaan tiedot</title>
</head>
<body>
<form id="tiedot">
	<table>
		<thead>
			<tr>
				<th colspan="6"><span id="takaisin">Takaisin listaukseen</span></th>
			</tr>
			<tr>
				<th>ID</th>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelinnumero</th>
				<th colspan="2">S�hk�posti</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="asiakas_id" id="asiakas_id"></td>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td>
				<td><input type="submit" id="tallenna" value="Lis��"></td>
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmo"></span>
</body>
<script>
$(document).ready(function(){
	$("#takaisin").click(function(){
		document.location="listaaasiakkaat.jsp";
	});
	$("#tiedot").validate({
		rules: {
			asiakas_id: {
				required: true,
				number: true,
				minlength: 1,
				maxlength: 6
			},
			etunimi: {
				required: true,
				minlength: 2
			},
			sukunimi: {
				required: true,
				minlength: 2
			},
			puhelin: {
				required: true,
				minlength: 5,
				maxlength: 20
			},
			sposti: {
				required: true,
				minlength: 7,
				maxlength: 30
			}
		},
		messages: {
			asiakas_id: {
				required: "Puuttuu",
				number: "Asiakasnumeron on oltava 1-6 numeroa",
				minlength: "Asiakasnumeron on oltava v�hint��n 1 numero",
				maxlength: "Asiakasnumeron on oltava enint��n 6 numeroa"
			},
			etunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},
			sukunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},
			puhelin: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitk�"
			},
			sposti: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitk�"
			}
		},
		submitHandler: function(form) {
			lisaaTiedot();
		}
	});
});
//funktio tietojen lis��mist� varten. Kutsutaan backin POST-metodia ja v�litet��n kutsun mukana uudet tiedot json-stringin�.
//POST /autot/
function lisaaTiedot(){	
	var formJsonStr = formDataJsonStr($("#tiedot").serializeArray()); //muutetaan lomakkeen tiedot json-stringiksi
	$.ajax({url:"asiakkaat", data:formJsonStr, type:"POST", dataType:"json", success:function(result) { //result on joko {"response:1"} tai {"response:0"}       
		if(result.response==0){
    	$("#ilmo").html("Asiakkaan lis��minen ep�onnistui.");
    }else if(result.response==1){			
    	$("#ilmo").html("Asiakkaan lis��minen onnistui.");
    	$("#asiakas_id", "#etunimi", "#sukunimi", "#puhelin", "sposti").val("");
		}
}});	
}
</script>
</html>