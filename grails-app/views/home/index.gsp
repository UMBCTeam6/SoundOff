<html>
    <head>
        <title>SoundOff - Home</title>
        <meta name="layout" content="main" />
        <nav:resources />
    </head>
    <body>
        <div id="nav">
            <nav:render />
        </div>
        <script type="text/javascript">
            $(function($) {
                $('div.rateit').rateit();
            }); 
        </script>
        <style>
            #recent_reviews {
                padding-left: 10px;
                margin-left: 10px;
            }
            #recent_review div {
                vertical-align: middle;
            }
        </style>
        <div class="body">
            <h1>Recent reviews</h1>
            <div id="recent_reviews">
            <g:if test="${recentReviews.size() > 0}">
                <g:each var="rev" in="${recentReviews}">
                    <div>
                        <g:link controller="review" action="show" id="${rev.id}">${rev.title}</g:link> by                       
                        ${rev.creator.username}                          
                        <div class="rateit" data-rateit-value="${rev.rating}" data-rateit-ispreset="true" data-rateit-readonly="true">
                    </div>
                </g:each>
            </g:if>
            <g:else>
                <div>No reviews have been made yet!  <g:link controller="review" action="create">Review an album!</g:link></div>
            </g:else>
            </div>
        </div>
    </body>
    
</html>