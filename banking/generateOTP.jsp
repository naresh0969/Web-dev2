<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate OTP</title>
<script language="javascript">
function generateOTP() {
    var otps = ["1234", "1324", "2341", "3214", "3421", "4132", "2413", "4321", "2134", "3124"];
    var n = Math.floor(Math.random() * otps.length);
    alert("Your OTP is " + otps[n]);
}
</script>
</head>
<body>
<h1 align="center">Generate OTP</h1>
<input type="button" value="Generate OTP" onClick="generateOTP()" class="myButton">
</body>
</html>
