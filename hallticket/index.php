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
        .login{
            width: 600px;
            height: 300px;
            border-radius: 4px;
            background: #709c620f;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
            top: 100px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            font-weight:bold;
            letter-spacing: 1px;
        }
        #box{
            height: 30px;
            width: 300px;
            border: none;
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.3);
            border-radius: 4px;
        }
        #downloadB{
            background-color: #4CAF50; 
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        #downloadB:hover {
        background-color: #45a049; 
        }
    </style>
</head>
<body>
    <form action="" name="f1">
        <div class="login">
            <div class="name">
                <p>Name*</p>
                <input type="text" id="box" name="uname" placeholder="     Enter your full name">
            </div>
            <br>
            <div class="ph">
                <p>Mobile*</p>
                <input type="text" id="box" name="uph" placeholder="     Enter Contact mobile number">
            </div>
            <br><br>
            <div>
                <input type="submit" value="Download Hallticket" id="downloadB">
            </div>
            <div>
                <p>not registered? <a href="./register.php">Click here</a></p>
                
            </div>
        </div>
    </form>


    <script language="javascript">

    </script>
</body>
</html>