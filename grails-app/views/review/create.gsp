

<%@ page import="soundoff.Review" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reviewInstance}">
            <div class="errors">
                <g:renderErrors bean="${reviewInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
