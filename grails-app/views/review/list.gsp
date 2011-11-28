
<%@ page import="soundoff.Review" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
            <div class="list">
                <table>
                    <thead>
                        <tr>
                                                
                            <th><g:message code="review.album.label" default="Album" /></th>                       
                            <th><g:message code="review.creator.label" default="Creator" /></th>                       
                            <g:sortableColumn property="rating" title="${message(code: 'review.rating.label', default: 'Rating')}" />                      
                            <g:sortableColumn property="title" title="${message(code: 'review.title.label', default: 'Title')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reviewInstanceList}" status="i" var="reviewInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                               
                            <td>${fieldValue(bean: reviewInstance, field: "album.artist.name")} - ${fieldValue(bean: reviewInstance, field: "album.name")}</td>                      
                            <td>${fieldValue(bean: reviewInstance, field: "creator.username")}</td>                       
                            <td><div class="rateit" data-rateit-value="${reviewInstance.rating}" data-rateit-ispreset="true" data-rateit-readonly="true"></div></td>                        
                            <td><g:link controller="review" action="show" id="${reviewInstance?.id}">${fieldValue(bean: reviewInstance, field: "title")}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reviewInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
