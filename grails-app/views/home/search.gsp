<%@ page import="soundoff.Album" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'album.label', default: 'Search')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <nav:resources />
    </head>
    <body>
        <div id="nav">
            <nav:render />
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${ artists?.size() > 0 }">
                <div class="searchHeader">Artists</div>
                <ul>
                <g:each var="artist" in="${artists}">
                    <li><g:link controller="artist" action="show" id="${artist.id}">${artist.name}</g:link></li>
                </g:each>
                </ul>
            </g:if>
            <g:if test="${ albums?.size() > 0 }">
                <div class="searchHeader">Albums</div>
                <ul>
                <!-- TODO: add in the album artwork? -->
                <g:each var="album" in="${albums}">
                    <li><g:link controller="album" action="show" id="${album.id}">${album.name}</g:link></li>
                </g:each>
                </ul>
            </g:if>
            <g:if test="${ reviews?.size() > 0 }">
                <div class="searchHeader">Reviews</div>
                <ul>
                <!-- TODO: add more information about the review -->
                <g:each var="review" in="${reviews}">
                    <li><g:link controller="review" action="show" id="${review.id}">${review.title}</g:link></li>
                </g:each>
                </ul>
            </g:if>
        </div>
    </body>
</html>
