<%@ page import="soundoff.Album" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
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
            <g:if test="${Album.list().size() > 0}">
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            
                            <th><g:message code="album.artist.label" default="Artist" /></th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'album.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="year" title="Release date" />
                            
                            <th>Rating</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${albumInstanceList}" status="i" var="albumInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td valign="middle"><img height="30" src="${createLink(controller: 'album', action: 'viewImage', id: albumInstance.id)}" /></td>
                                          
                            <td valign="middle">${fieldValue(bean: albumInstance, field: "artist.name")}</td>
                        
                            <td valign="middle"><g:link action="show" id="${albumInstance.id}">${fieldValue(bean: albumInstance, field: "name")}</g:link></td>
                        
                            <td valign="middle">${albumInstance.year}</td>
                        
                            <td valign="middle"><div class="rateit" data-rateit-value="${albumInstance.getAggregateRating()}" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${albumInstanceTotal}" />
            </div>
            </g:if>
            <g:else>
                No albums have been added.  <g:link controller="album" action="create">Add some!</g:link>
            </g:else>
        </div>
    </body>
</html>
