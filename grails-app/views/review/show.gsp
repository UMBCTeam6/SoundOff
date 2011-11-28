
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
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="review.album.artist.label" default="Artist" /></td>
                            
                            <td valign="top" class="value"><g:link controller="artist" action="show" id="${reviewInstance?.album?.artist?.id}">${reviewInstance?.album?.artist?.name}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="review.album.label" default="Album" /></td>
                            
                            <td valign="top" class="value"><g:link controller="album" action="show" id="${reviewInstance?.album?.id}">${reviewInstance?.album?.name}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="review.creator.label" default="Reviewer" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${reviewInstance?.creator?.id}">${reviewInstance?.creator?.username}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="review.rating.label" default="Rating" /></td>
                            
                            <td valign="top" class="value"><div class="rateit" data-rateit-value="${reviewInstance.rating}" data-rateit-ispreset="true" data-rateit-readonly="true"></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="review.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reviewInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="review.text.label" default="Text" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reviewInstance, field: "text")}</td>
                            
                        </tr>
                                        
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
