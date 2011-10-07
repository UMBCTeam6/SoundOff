
<%@ page import="soundoff.Review" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'review.id.label', default: 'Id')}" />
                        
                            <th><g:message code="review.album.label" default="Album" /></th>
                        
                            <th><g:message code="review.creator.label" default="Creator" /></th>
                        
                            <g:sortableColumn property="rating" title="${message(code: 'review.rating.label', default: 'Rating')}" />
                        
                            <g:sortableColumn property="text" title="${message(code: 'review.text.label', default: 'Text')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'review.title.label', default: 'Title')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reviewInstanceList}" status="i" var="reviewInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reviewInstance.id}">${fieldValue(bean: reviewInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: reviewInstance, field: "album")}</td>
                        
                            <td>${fieldValue(bean: reviewInstance, field: "creator")}</td>
                        
                            <td>${fieldValue(bean: reviewInstance, field: "rating")}</td>
                        
                            <td>${fieldValue(bean: reviewInstance, field: "text")}</td>
                        
                            <td>${fieldValue(bean: reviewInstance, field: "title")}</td>
                        
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
