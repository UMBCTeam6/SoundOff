<%@ page import="soundoff.Album" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
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
            
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="album.artist.label" default="Artist" /></td>
                            
                            <td valign="top" class="value"><g:link controller="artist" action="show" id="${albumInstance?.artist?.id}">${albumInstance?.artist?.name}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="album.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value"><g:link controller="album" action="show" id="${albumInstance?.id}">${albumInstance?.name}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="album.year.label" default="Year released" /></td>
                            
                            <td valign="top" class="value">${albumInstance?.year}</td>
                            
                        </tr>                        
                                            
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="album.reviews.label" default="Rating" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <div class="rateit" data-rateit-value="${aggregateRating}" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                                <g:link controller="reviews" action="list">(${albumInstance?.reviews?.size()} reviews)</g:link>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${albumInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
