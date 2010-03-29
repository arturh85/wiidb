
<%@ page import="de.arturh.wiidb.Game" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'game.id.label', default: 'Id')}" />
                            <g:sortableColumn property="wiiId" title="${message(code: 'game.wiiId.label', default: 'Wii Id')}" />
                            <g:sortableColumn property="name" title="${message(code: 'game.name.label', default: 'Name')}" />
                            <g:sortableColumn property="region" title="${message(code: 'game.region.label', default: 'Region')}" />
                            <g:sortableColumn property="players" title="${message(code: 'game.players.label', default: 'Players')}" />
                            <g:sortableColumn property="genres" title="${message(code: 'game.players.label', default: 'Players')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${gameInstanceList}" status="i" var="gameInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${gameInstance.id}">${fieldValue(bean: gameInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: gameInstance, field: "wiiId")}</td>
                        
                            <td>${fieldValue(bean: gameInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: gameInstance, field: "region")}</td>
                        
                            <td>${fieldValue(bean: gameInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: gameInstance, field: "synopsis")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${gameInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
