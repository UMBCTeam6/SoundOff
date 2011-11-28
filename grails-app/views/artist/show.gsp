<%@ page import="soundoff.Artist" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    <nav:resources />
    </head>
    <body>
        <div id="nav">
            <nav:render />
            <nav:renderSubItems />
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                                       
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artist.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: artistInstance, field: "name")}</td>
                            
                        </tr>
                        <g:if test="${artistInstance.albums?.size() > 0}">
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artist.albums.label" default="Albums" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${artistInstance.albums}" var="a">
                                    <li><g:link controller="album" action="show" id="${a.id}">${a?.name}</g:link> (${a?.year})</li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                        </g:if>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                
            </div>
        </div>
    </body>
</html>
