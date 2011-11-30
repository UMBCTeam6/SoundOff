

<%@ page import="soundoff.Review" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <nav:resources />
    </head>
    <body>
        <div id="nav">
            <nav:render />
            <nav:renderSubItems />
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reviewInstance}">
            <div class="errors">
                <g:renderErrors bean="${reviewInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${reviewInstance?.id}" />
                <g:hiddenField name="version" value="${reviewInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="album"><g:message code="review.album.label" default="Album" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewInstance, field: 'album', 'errors')}">
                                    <g:select name="album.id" from="${soundoff.Album.list()}" optionKey="id" value="${reviewInstance?.album?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="creator"><g:message code="review.creator.label" default="Creator" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewInstance, field: 'creator', 'errors')}">
                                    <g:select name="creator.id" from="${soundoff.User.list()}" optionKey="id" value="${reviewInstance?.creator?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rating"><g:message code="review.rating.label" default="Rating" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewInstance, field: 'rating', 'errors')}">
                                    <g:textField name="rating" value="${fieldValue(bean: reviewInstance, field: 'rating')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="text"><g:message code="review.text.label" default="Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewInstance, field: 'text', 'errors')}">
                                    <g:textField name="text" value="${reviewInstance?.text}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="review.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reviewInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${reviewInstance?.title}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
