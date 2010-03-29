
<%@ page import="de.arturh.wiidb.Game" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${gameInstance}">
            <div class="errors">
                <g:renderErrors bean="${gameInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${gameInstance?.id}" />
                <g:hiddenField name="version" value="${gameInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="wiiId"><g:message code="game.wiiId.label" default="Wii Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'wiiId', 'errors')}">
                                    <g:textField name="wiiId" maxlength="6" value="${gameInstance?.wiiId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="game.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${gameInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="region"><g:message code="game.region.label" default="Region" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'region', 'errors')}">
                                    <g:textField name="region" value="${gameInstance?.region}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="game.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${gameInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="synopsis"><g:message code="game.synopsis.label" default="Synopsis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'synopsis', 'errors')}">
                                    <g:textArea name="synopsis" cols="40" rows="5" value="${gameInstance?.synopsis}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="publishedOn"><g:message code="game.publishedOn.label" default="Published On" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'publishedOn', 'errors')}">
                                    <g:datePicker name="publishedOn" precision="day" value="${gameInstance?.publishedOn}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ratingType"><g:message code="game.ratingType.label" default="Rating Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'ratingType', 'errors')}">
                                    <g:textField name="ratingType" value="${gameInstance?.ratingType}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ratingValue"><g:message code="game.ratingValue.label" default="Rating Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'ratingValue', 'errors')}">
                                    <g:textField name="ratingValue" value="${gameInstance?.ratingValue}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="players"><g:message code="game.players.label" default="Players" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'players', 'errors')}">
                                    <g:textField name="players" value="${fieldValue(bean: gameInstance, field: 'players')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="playersWifi"><g:message code="game.playersWifi.label" default="Players Wifi" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'playersWifi', 'errors')}">
                                    <g:textField name="playersWifi" value="${fieldValue(bean: gameInstance, field: 'playersWifi')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="developer"><g:message code="game.developer.label" default="Developer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'developer', 'errors')}">
                                    <g:select name="developer.id" from="${de.arturh.wiidb.Company.list()}" optionKey="id" value="${gameInstance?.developer?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="publisher"><g:message code="game.publisher.label" default="Publisher" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'publisher', 'errors')}">
                                    <g:select name="publisher.id" from="${de.arturh.wiidb.Company.list()}" optionKey="id" value="${gameInstance?.publisher?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="wifiFeatures"><g:message code="game.wifiFeatures.label" default="Wifi Features" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'wifiFeatures', 'errors')}">
                                    <g:select name="wifiFeatures" from="${de.arturh.wiidb.WifiFeature.list()}" multiple="yes" optionKey="id" size="5" value="${gameInstance?.wifiFeatures}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="genres"><g:message code="game.genres.label" default="Genres" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'genres', 'errors')}">
                                    <g:select name="genres" from="${de.arturh.wiidb.Genre.list()}" multiple="yes" optionKey="id" size="5" value="${gameInstance?.genres}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="languages"><g:message code="game.languages.label" default="Languages" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'languages', 'errors')}">
                                    <g:select name="languages" from="${de.arturh.wiidb.Language.list()}" multiple="yes" optionKey="id" size="5" value="${gameInstance?.languages}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="devices"><g:message code="game.devices.label" default="Devices" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'devices', 'errors')}">
                                    <g:select name="devices" from="${de.arturh.wiidb.Device.list()}" multiple="yes" optionKey="id" size="5" value="${gameInstance?.devices}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ratings"><g:message code="game.ratings.label" default="Ratings" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameInstance, field: 'ratings', 'errors')}">
                                    <g:select name="ratings" from="${de.arturh.wiidb.Rating.list()}" multiple="yes" optionKey="id" size="5" value="${gameInstance?.ratings}" />
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
