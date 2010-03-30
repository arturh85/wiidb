
<%@ page import="de.arturh.wiidb.GameCollection" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'gameCollection.label', default: 'GameCollection')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${gameCollectionInstance}">
            <div class="errors">
                <g:renderErrors bean="${gameCollectionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="gameCollection.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gameCollectionInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${gameCollectionInstance?.name}" />
                                </td>
                            </tr>
							

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">WiiBackupManager Selection File</label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="file" name="selectionFile" />
                                </td>
                            </tr>							
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
