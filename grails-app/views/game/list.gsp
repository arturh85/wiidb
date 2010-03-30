
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
			  <NOBR>
				  Filter
				  <g:textField name="filter" value="${params.filter}" />
			  </NOBR>
			  
			  <NOBR>
				  Min. Players 
				  <g:select from="['1', '2', '3', '4']" noSelection="${['':'']}" name="minPlayers" value="${params.minPlayers}" />
			  </NOBR>
              
			  <NOBR>
				  <g:link action="list" controller="genre">Genre</g:link>
				  <g:select from="${de.arturh.wiidb.Genre.list()}" noSelection="${['':'']}" name="genre" value="${params.genre}" optionKey="id" />
			  </NOBR>

			  <NOBR>
				  Region
				  <g:select from="${de.arturh.wiidb.Game.list().region.unique()}" noSelection="${['':'']}" name="region" value="${params.region}"  />
			  </NOBR>
			  <br/>

			  <NOBR>
				  With <g:link action="list" controller="device">Device</g:link>
				  <g:select from="${de.arturh.wiidb.Device.list().deviceType.unique()}" noSelection="${['':'']}" name="withDevice" value="${params.withDevice}"  />
			  </NOBR>

			  <NOBR>
				  Without <g:link action="list" controller="device">Device</g:link>
				  <g:select from="${de.arturh.wiidb.Device.list().deviceType.unique()}" noSelection="${['':'']}" name="withoutDevice" value="${params.withoutDevice}"  />
			  </NOBR>

			  <NOBR>
				  In <g:link action="list" controller="gameCollection">Collection</g:link>
				  <g:select from="${de.arturh.wiidb.GameCollection.list().name.unique()}" noSelection="${['':'']}" name="inCollection" value="${params.inCollection}"  />
			  </NOBR>
			  
              <g:actionSubmit action="list" value="update" label="Update" />
            </div>

            </g:form>

            <div class="list">
			<br/>
                showing ${gameInstanceList.size()} of ${gameInstanceTotal} games<br/><br/>
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
                            <td width="60"><g:link action="show" id="${gameInstance.id}"><img border="0" src="/WiiDB/game/image/${gameInstance.wiiId}" alt="${gameInstance.wiiId}" width="80" /></g:link></td>
                            <td>${fieldValue(bean: gameInstance, field: "synopsis")}</td>
                            <td width="200">
                              <strong>region:</strong> ${fieldValue(bean: gameInstance, field: "region")}<br/>
                              <strong>genres:</strong> ${formatList(list: gameInstance.genres.name)}<br/>
                              <strong>players <g:if test="${gameInstance.playersWifi && gameInstance.playersWifi > 0}">(wifi)</g:if>:</strong> 
							  ${fieldValue(bean: gameInstance, field: "players")} <g:if test="${gameInstance.playersWifi && gameInstance.playersWifi > 0}">
								(${gameInstance.playersWifi}<g:if test="${gameInstance.wifiFeatures.size() > 0}"> ${formatList(list: gameInstance.wifiFeatures)}</g:if>)
							  </g:if><br/>

                              <g:if test="${gameInstance.devices.size()}">
								<strong>devices:</strong> ${formatList(list: gameInstance.devices)}<br/>
							  </g:if>

                              <g:if test="${gameInstance.gameCollections.size()}">
								<strong>in collections:</strong> ${formatList(list: gameInstance.gameCollections)}<br/>
							  </g:if>

                            </td>
                        </tr>
                    </tbody>
                </table>
                </g:each>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${gameInstanceTotal}" params="[genre: params.genre, minPlayers: params.minPlayers, withDevice: params.withDevice, withoutDevice: params.withoutDevice, region: params.region, filter:params.filter, inCollection: params.inCollection, notInCollection: params.notInCollection]" />
            </div>
        </div>
    </body>
</html>
