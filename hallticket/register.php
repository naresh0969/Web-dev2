<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body{
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .details{
            width: 1000px;
            height: 500px;
            /* border-radius: 4px; */
            background:#deded2;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
            top: 50px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            font-weight:bold;
            letter-spacing: 1px;
        }
        table {
            margin: 10px;
            padding: 20px; /* Reduce padding to fit the table within the container */
            width: 80%; /* Adjust the width of the table */
            height: auto; /* Auto height to fit the content */
            border-collapse: collapse; /* Optional: collapse borders */
        }
        td {
            padding: 10px; /* Add padding for better spacing */
        }
        .submitF{
            margin-top: 20px;
            background-color: #4CAF50; 
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form action="./database.php" method="post">
        <div class="details">
            <table>
                <tr>
                    <td>Name*</td>
                    <td><input type="text" placeholder="Enter your full name" name="uname"></td>
                </tr>
                <tr>
                    <td>Father's Name</td>
                    <td><input type="text" placeholder="Enter your father name" name="ufather"></td>
                </tr>
                <tr>
                    <td>Course</td>
                    <td>
                        <select name="course" id="course">
                            <option value="" selected>select</option>
                            <option value="CSE">CSE</option>
                            <option value="ECE">ECE</option>
                            <option value="Civil">Civil</option>
                            <option value="EEE">EEE</option>
                            <option value="ME">ME</option>
                            <option value="MME">MME</option>
                            <option value="CE">CE</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Mobile No.</td>
                    <td><input type="text" placeholder="enter your mobile number" name="uph"></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="photo" ></td>

                </tr>
                <tr>
                    <td>Signature</td>
                    <td><input type="file" name="sign"></td>

                </tr>
                <tr >
                    <td align="right"><input type="submit" value="Submit" class="submitF" height="50px"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>