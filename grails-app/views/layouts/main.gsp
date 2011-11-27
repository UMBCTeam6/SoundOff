<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'rateit.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />

        <g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="jquery.rateit.min.js" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <!-- TODO: clean up this front page. -->
        <div id="header">
            <div id="searchwrapper">
                <div id="searchcolumn">
                    <div class="padder">
                        <g:form name="searchForm" action="search" controller="home">
                        <g:textField id="query" name="query" value="${query}" size="50" />
                             <g:submitButton name="searchButton" value="Search" />
                       <div>
                        </div>
                        </g:form>
                    </div>
                </div>
            </div>
            <div id="imgcolumn">
                <div class="padder">
                    <img src="${resource(dir:'images', file:'soundoff_logo.png')}" height="60" alt="SoundOff" border="0" />
                </div>
            </div>
            <div id="usercolumn">
                <div class="padder">
                    <g:link controller="logout">Logout <sec:username /></g:link>
                </div>
            </div>
        </div>
        <g:layoutBody />
    </body>
</html>