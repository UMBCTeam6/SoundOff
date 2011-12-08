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
            <div class="album">
                <img height="200" src="${createLink(controller: 'album', action: 'viewImage', id: albumInstance.id)}" />
                <div class="albuminfo">
                    <div id="artist">
                        <g:link controller="artist" action="show" id="${albumInstance?.artist?.id}">${albumInstance?.artist?.name}</g:link>
                    </div>
                    <div id="album">${albumInstance?.name}</div>
                    <div id="release">${albumInstance?.year}</div>
                    <div id="rating"><div class="rateit" data-rateit-value="${aggregateRating}" data-rateit-ispreset="true" data-rateit-readonly="true"></div></div>
                    <g:if test="${!albumInstance.artwork || albumInstance.artwork?.size() == 0}">
                        <g:link controller="album" action="edit" id="${albumInstance.id}">Add album art</g:link>
                    </g:if>
                </div>
            </div>
            <div id="reviews">
            <g:if test="${albumInstance.reviews?.size() > 0}">
                <h1>Reviews</h1>
                
                <g:each var="review" in="${albumInstance.reviews?}">
                    <div class="review">
                        <g:link controller="review" action="show" id="${review.id}">${review.title}</g:link> by ${review.creator.username} <div class="rateit" data-rateit-value="${review.rating}" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                    </div>
                </g:each>
                
            </g:if>
            <g:else>
                No reviews have been written for this album yet. <g:link controller="review" action="create" id="${albumInstance?.id}">Write one!</g:link>
            </g:else>
            </div>
            <!--
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${albumInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
            -->
        </div>
    </body>
</html>
