
<%@ page import="de.arturh.wiidb.Device" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'device.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="deviceType" title="${message(code: 'device.deviceType.label', default: 'Device Type')}" />
                        
                            <g:sortableColumn property="required" title="${message(code: 'device.required.label', default: 'Required')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${deviceInstanceList}" status="i" var="deviceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${deviceInstance.id}">${fieldValue(bean: deviceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: deviceInstance, field: "deviceType")}</td>
                        
                            <td><g:formatBoolean boolean="${deviceInstance.required}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${deviceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
