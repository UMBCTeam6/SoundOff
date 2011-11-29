

<%@ page import="soundoff.User" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title>SoundOff - Create user</title>
        
        <meta name="layout" content="login" />
        <style>
        body { text-align: center }
        </style>
    </head>
    <body>
        <div class="body" align="center" width="40%">
            <div class='fheader'>Create user</div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" onsubmit="return verifyPassword()">
                <div class="dialog">
                    <table style="background-color: #a8a8a8; margin: 10px; padding: 10px; border: 1px outset black;">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="user.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${userInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="user.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${userInstance?.password}" />
                                </td>
                            </tr>
                            
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cpassword"><g:message code="user.password.label" default="Confirm password" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="password" id="cpassword" />
                                </td>
                            </tr>
                                                   
                        </tbody>
                    </table>
                </div>
                <g:hiddenField name="enabled" value="${true}" />
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
