
<%@ page import="de.arturh.wiidb.Game" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
        <title>Wii Database</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.wiiId.label" default="Wii Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "wiiId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.region.label" default="Region" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "region")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.synopsis.label" default="Synopsis" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "synopsis")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.publishedOn.label" default="Published On" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${gameInstance?.publishedOn}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.ratingType.label" default="Rating Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "ratingType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.ratingValue.label" default="Rating Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "ratingValue")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.players.label" default="Players" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "players")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.playersWifi.label" default="Players Wifi" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: gameInstance, field: "playersWifi")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.developer.label" default="Developer" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${gameInstance?.developer?.id}">${gameInstance?.developer?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.publisher.label" default="Publisher" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${gameInstance?.publisher?.id}">${gameInstance?.publisher?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.wifiFeatures.label" default="Wifi Features" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${gameInstance.wifiFeatures}" var="w">
                                    <li><g:link controller="wifiFeature" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.genres.label" default="Genres" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${gameInstance.genres}" var="g">
                                    <li><g:link controller="genre" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.languages.label" default="Languages" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${gameInstance.languages}" var="l">
                                    <li><g:link controller="language" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="game.devices.label" default="Devices" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${gameInstance.devices}" var="d">
                                    <li><g:link controller="device" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Resources</td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <a href="http://wiitdb.com/Game/${gameInstance.wiiId}">WiiTDB</a>
                            </td>                            
                        </tr>                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${gameInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
