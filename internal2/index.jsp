<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
      table{
        width: 100vw;
        border: 1px solid black;
      }
      tr,td{
        border: 1px solid black;
      }

      .input{
        width: 100vw;
        display: flex;
        justify-content: center;
        gap: 20px;
        margin: 20px;
      }

      input[type="checkbox"]{
        width: 25px;
        height: 25px;
      }
    </style>
</head>
<body>

          <form action="showData.jsp">

            <div class="input">
              <select name="chose" id="chose">
                <option value="cse">CSE</option>
                <option value="ECE">ECE</option>
              </select>
              <button type="submit">Get Data</button>
            </div>
        
            <table>
              <tr>
                <th>
                  Fid 
                </th>
                <th>
                  Fname
                </th>
                <th>
                  Branch
                </th>
                <th>
                    select
                </th>
              </tr>
              </form>

          </table>
        </div>
      </section>
    </div>
</body>

<script>

</script>
</html>