<%
Set objData = CreateDOM
objData.async = false

if (|0) then
	Set objDataXMLHTTP = Server.CreateObject("Microsoft.XMLHTTP")
	objDataXMLHTTP.open "GET", "|1", false 
	objDataXMLHTTP.setRequestHeader "Content-Type", "text/xml"
	objDataXMLHTTP.send
	objData.load(objDataXMLHTTP.responseBody)
else
	objData.load(Server.MapPath("|2"))
end if

Set objStyle = CreateDOM
objStyle.async = false
objStyle.load(Server.MapPath("|3"))
Session.CodePage = 65001

Response.ContentType = "text/html"
Response.Write objData.transformNode(objStyle)

Function CreateDOM()
	On Error Resume Next
	Dim tmpDOM

	Set tmpDOM = Nothing
	Set tmpDOM = Server.CreateObject("MSXML2.DOMDocument.6.0")
	
	Set CreateDOM = tmpDOM
End Function
%>
