<html>
<head>
	<title>SoundOff - Login</title>
    <style>
        .fheader {
            font-size: 16pt;
            font-weight: bold;
            background-color: #e8e8e8;
            padding: 5px;
            margin: 5px;
        }
    </style>
</head>

<body>
    <div style="text-align: center; width: 100%">
        <img src="${resource(dir:'images', file:'soundoff_logo.png')}" height="250" alt="SoundOff" border="0" />
    </div>
    <div id='login' align="center" width="40%">
            <div class='fheader'><g:message code="springSecurity.login.header"/></div>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<table width="40%" style="background-color: #a8a8a8; margin: 10px; padding: 10px; border: 1px outset black;">
                <tr>
                    <td align="center"><label for='username'><g:message code="springSecurity.login.username.label"/>:</label></td>
                    <td align="center"><input type='text' class='text_' name='j_username' id='username'/> </td>
                </tr>
                
                <tr>
                    <td align="center"><label for='password'><g:message code="springSecurity.login.password.label"/>:</label></td>
                    <td align="center"><input type='password' class='text_' name='j_password' id='password'/></td>
                </tr>

                <tr>
                    <td colspan="2" align="center"><g:link controller="home" action="create">New user?</g:link></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                        <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
                    </td>
                </tr>
                
			</table>
		</form>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
