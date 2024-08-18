<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Election Status</title>

    <style>
        a{
            text-decoration: none;
            color: white;
        }
        table{
            border-spacing: 15px; 
        }
        .start , .stop{
            background-color: rgb(32, 145, 221);
            width: 100px;
            height: 20px;
            border: 2px solid black;
        }
    </style>
</head>
<body>
    <table align="center">
        <caption><b>Election Commition of India</b></caption>
        <tr>
            <td class="start" align="center"><a href="stop.jsp?start=1">Start Election</a></td>
            <br><br>
            <td class="stop" align="center"><a href="stop.jsp?start=0">Stop Election</a></td>
        </tr>
    </table>
</body>
</html>