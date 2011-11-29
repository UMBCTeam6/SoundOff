<html>
<head>
	<title><g:layoutTitle /></title>
    <g:javascript library="jquery" plugin="jquery" />
    <style>
        .fheader {
            font-size: 16pt;
            font-weight: bold;
            background-color: #e8e8e8;
            padding: 5px;
            margin: 5px;
        }
    </style>
    <script type="text/javascript">
        
            function verifyPassword() {
                if ($("input[name='password']").val() != $("#cpassword").val())
                {
                    alert("Passwords need to match!")
                    $("input[name='password']").focus();
                    return false;
                }
                return true;
            }
        
    </script>
</head>

<body>
    <div style="text-align: center; width: 100%">
        <img src="${resource(dir:'images', file:'soundoff_logo.png')}" height="250" alt="SoundOff" border="0" />
    </div>
    <g:layoutBody />
</body>
</html>
