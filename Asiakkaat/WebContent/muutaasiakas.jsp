<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Muuta asiakastietoja</title>
</head>
<body>
<form id="tiedot" action="muutaasiakas" method="post">
	<table>
		<thead>	
			<tr>
				<th colspan="6" class="oikealle"><a href="listaaasiakkaat.jsp">Takaisin listaukseen</a></th>
			</tr>		
			<tr>
				<th>ID</th>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th colspan="2">Sähköposti</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="asiakas_id" id="asiakas_id" value="${asiakas.asiakas_id}"></td>
				<td><input type="text" name="etunimi" id="etunimi" value="${asiakas.etunimi}"></td>
				<td><input type="text" name="sukunimi" id="sukunimi" value="${asiakas.sukunimi}"></td>
				<td><input type="text" name="puhelin" id="puhelin" value="${asiakas.puhelin}"></td> 
				<td><input type="text" name="sposti" id="sposti" value="${asiakas.sposti}"></td>
				<td><input type="button" id="tallenna" value="Hyväksy" onclick="tarkasta()"></td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" name="vanhaAsiakas_id" id="vanhaAsiakas_id" value="${asiakas.asiakas_id}">	
</form>
<span id="ilmo"></span>
</body>
<script>
function tarkasta(){
	if(document.getElementById("asiakas_id").value.length<0){
		document.getElementById("ilmo").innerHTML="Asiakasnumero ei kelpaa!";
		return;
	}else if(document.getElementById("asiakas_id").value*1!=document.getElementById("asiakas_id").value){
		document.getElementById("ilmo").innerHTML="Asiakasnumero ei kelpaa!";
		return;	
	}else if(document.getElementById("etunimi").value.length<1){
		document.getElementById("ilmo").innerHTML="Nimi ei kelpaa!";
		return;
	}else if(document.getElementById("sukunimi").value.length<1){
		document.getElementById("ilmo").innerHTML="Sukunimi ei kelpaa!";
		return;
	}else if(document.getElementById("puhelin").value.length<4{
		document.getElementById("ilmo").innerHTML="Puhelinnumero ei kelpaa!";
		return;
	}else if(document.getElementById("sposti").value.length<6{
		document.getElementById("ilmo").innerHTML="Sähköpostiosoite ei kelpaa!";
		return;
	}
	document.getElementById("asiakas_id").value=siivoa(document.getElementById("asiakas_id").value);
	document.getElementById("etunimi").value=siivoa(document.getElementById("etunimi").value);
	document.getElementById("sukunimi").value=siivoa(document.getElementById("sukunimi").value);
	document.getElementById("puhelin").value=siivoa(document.getElementById("puhelin").value);
	document.getElementById("sposti").value=siivoa(document.getElementById("sposti").value);
	document.forms["tiedot"].submit();
}

function siivoa(teksti){
	teksti=teksti.replace("<","");
	teksti=teksti.replace(";","");
	teksti=teksti.replace("'","''");
	return teksti;
}
</script>
</html>
