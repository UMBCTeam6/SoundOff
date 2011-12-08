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
            <div class="title">${artistInstance.name}</div>
            <div id="albums">
            <g:if test="${artistInstance.albums.size() > 0}">
                <g:each in="${artistInstance.albums.sort { it.year } }" var="a">
                    <div><g:link controller="album" action="show" id="${a.id}">${a?.name}</g:link> (${a?.year})</div>
                </g:each>
            </g:if>
            <g:else>
                No albums have been added for this artist.  <g:link controller="album" action="create" params="[artistId : artistInstance.id ]">Add some!</g:link>
            </g:else>
            </div>
        </div>
    </body>
</html>
