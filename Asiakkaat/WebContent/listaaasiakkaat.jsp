<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Asiakkaiden listaus</title>
</head>
<body>
<form action="haeasiakkaat" method="get">
	<table id="listaus">
		<thead>	
			<tr>
				<th class="oikealle" colspan="6"><a href="lisaaasiakas.jsp">Lisää uusi asiakas</a></th>
			</tr>	
			<tr>
				<th class="oikealle">Hakusana:</th>
				<th colspan="4"><input type="text" name="hakusana" id="hakusana" value="${param['hakusana']}"></th>
				<th><input type="submit" value="hae" id="hakunappi"></th>
			</tr>			
			<tr>
				<th>ID</th>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelinnumero</th>
				<th>Sähköposti</th>	
				<th></th>							
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${asiakkaat}" var="listItem">
				<tr>
			        <td>${listItem.asiakas_id}</td>
			        <td>${listItem.etunimi}</td>
			        <td>${listItem.sukunimi}</td>
			        <td>${listItem.puhelin}</td>
			        <td>${listItem.sposti}</td>
			        <td>
			        	<a href="muutaasiakas?asiakas_id=${listItem.asiakas_id}" class="muuta">muuta</a>
			        	<a onclick="varmista('${listItem.asiakas_id}')" class="poista">poista</a>			        	
			        </td>
		        </tr>
		    </c:forEach>		
		</tbody>
	</table>
</form>
<script>
function varmista(asiakas_id){
	if(confirm("Haluatko varmasti poistaa asiakasnumeron "+ asiakas_id + " kaikki tiedot?")){
		document.location="poistaasiakas?asiakas_id="+asiakas_id;
	}
}	
</script>
</body>
</html>