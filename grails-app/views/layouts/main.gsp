<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="header">
            <img src="${resource(dir:'images', file:'soundoff_logo.png')}" alt="SoundOff" border="0" />
            <div id="search">
                <g:textField id="main_search" name="main_search" value="${search}" size="50" />
                <div>
                    <button>Search</button>
                    <g:link action="advanced" controller="search">Adv Search</g:link>
                </div>
            </div>
            <div id="user">
                <g:link controller="logout">Logout <sec:username /></g:link>
            </div>
        </div>
        
        <g:layoutBody />
    </body>
</html>