<%@ page import="soundoff.Review" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <nav:resources />
    </head>
    <body>
        <div id="nav">
            <nav:render />
            <nav:renderSubItems />
        </div>
        <script type="text/javascript">
            $(function($) {
                $('div.rateit').rateit();
            }); 
        </script>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="title">
                ${reviewInstance.title} <div class="rateit" data-rateit-value="${reviewInstance.rating}" data-rateit-ispreset="true" data-rateit-readonly="true">
            </div>
            <hr>
            <div class="userinfo">
                Review of <g:link controller="album" action="show" id="${reviewInstance.album.id}">${reviewInstance.album.artist.name} - ${reviewInstance.album.name}</g:link> by ${reviewInstance.creator.username} (<g:formatDate format="MMMMM d, yyyy" date="${reviewInstance.written}" />)
            </div>
            <div class="reviewtext">
                ${reviewInstance.text}
            </div>
            
        </div>
    </body>
</html>
