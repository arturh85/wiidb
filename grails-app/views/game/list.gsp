
<%@ page import="de.arturh.wiidb.Game" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
        <title>WiiDB</title>
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

            <g:form method="get">
            <div class="filters">
              Filter
              <g:textField name="filter" value="${params.filter}" />

              Min. Players 
              <g:select from="['1', '2', '3', '4']" noSelection="${['':'']}" name="minPlayers" value="${params.minPlayers}" />
              
              Genre
              <g:select from="${de.arturh.wiidb.Genre.list()}" noSelection="${['':'']}" name="genre" value="${params.genre}" optionKey="id" />

              Region
              <g:select from="${de.arturh.wiidb.Game.list().region.unique()}" noSelection="${['':'']}" name="region" value="${params.region}"  />

              With Device
              <g:select from="${de.arturh.wiidb.Device.list().deviceType.unique()}" noSelection="${['':'']}" name="withDevice" value="${params.withDevice}"  />

              Without Device
              <g:select from="${de.arturh.wiidb.Device.list().deviceType.unique()}" noSelection="${['':'']}" name="withoutDevice" value="${params.withoutDevice}"  />

              <g:actionSubmit action="list" value="update" label="Update" />
            </div>

            </g:form>

            <div class="list">
                showing ${gameInstanceList.size()} of ${gameInstanceTotal} games<br/>
                <g:each in="${gameInstanceList}" status="i" var="gameInstance">
                <table>
                    <tbody>
                        <tr>
                            <td colspan="3">
                              <g:link action="show" id="${gameInstance.id}">
                                ${fieldValue(bean: gameInstance, field: "name")}
                              </g:link>
                            </td>
                        </tr>
                        <tr>
                            <td width="60"><img src="/WiiDB/game/image/${gameInstance.wiiId}" alt="${gameInstance.wiiId}" width="50" /></td>
                            <td>${fieldValue(bean: gameInstance, field: "synopsis")}</td>
                            <td width="200">
                              <strong>region:</strong> ${fieldValue(bean: gameInstance, field: "region")}<br/>
                              <strong>genres:</strong> ${formatList(list: gameInstance.genres.name)}<br/>
                              <strong>players <g:if test="${gameInstance.playersWifi && gameInstance.playersWifi > 0}">(wifi)</g:if>:</strong> ${fieldValue(bean: gameInstance, field: "players")} <g:if test="${gameInstance.playersWifi && gameInstance.playersWifi > 0}">(${gameInstance.playersWifi} )</g:if><br/>
                              <strong>devices:</strong> ${formatList(list: gameInstance.devices)}<br/>

                            </td>
                        </tr>
                    </tbody>
                </table>
                </g:each>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${gameInstanceTotal}" params="[genre: params.genre, minPlayers: params.minPlayers, withDevice: params.withDevice, withoutDevice: params.withoutDevice, region: params.region, filter:params.filter]" />
            </div>
        </div>
    </body>
</html>
