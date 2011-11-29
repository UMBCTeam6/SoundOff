

<%@ page import="soundoff.Review" %>
<%@ page import="soundoff.Album" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
            <g:hasErrors bean="${reviewInstance}">
            <div class="errors">
                <g:renderErrors bean="${reviewInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:if test="${Album.list().size() > 0}">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="album"><g:message code="review.album.label" default="Album" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewInstance, field: 'album', 'errors')}">
                                    <g:select name="album.id" from="${soundoff.Album.list()}" optionKey="id" optionValue="name" value="${reviewInstance?.album?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rating"><g:message code="review.rating.label" default="Rating" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewInstance, field: 'rating', 'errors')}">
                                    <input type="range" name="rating" id="rating" value="${reviewInstance?.rating ?: 0}" step="1" max="5" min="0" />
                                    <div class="rateit" data-rateit-backingfld="#rating" data-rateit-resetable="false"></div>
                                </td>
                            </tr>
                                               
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="review.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${reviewInstance?.title}" size="60" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="text"><g:message code="review.text.label" default="Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewInstance, field: 'text', 'errors')}">
                                    <g:textArea rows="15" cols="80" name="text" value="${reviewInstance?.text}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
            </g:if>
            <g:else>
                <div>No albums have been added yet!  <g:link controller="album" action="create">Add some!</g:link></div>
            </g:else>
        </div>
    </body>
</html>
