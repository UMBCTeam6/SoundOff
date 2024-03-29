
<%@ page import="soundoff.Artist" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <nav:resources />
    </head>
    <body>
        <div id="nav">
            <nav:render />
            <nav:renderSubItems />
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${artistInstance}">
            <div class="errors">
                <g:renderErrors bean="${artistInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${artistInstance?.id}" />
                <g:hiddenField name="version" value="${artistInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="artist.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artistInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${artistInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="albums"><g:message code="artist.albums.label" default="Albums" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: artistInstance, field: 'albums', 'errors')}">
                                    
<ul>
<g:each in="${artistInstance?.albums?}" var="a">
    <li><g:link controller="album" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="album" action="create" params="['artist.id': artistInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'album.label', default: 'Album')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
