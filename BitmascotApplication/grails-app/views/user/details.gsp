%{--Include Main Layout--}%
<meta name="layout" content="main"/>

<div class="card">
    <div class="card-header">
        <g:message code="user" args="['Details']"/>
    </div>

    <div class="card-body">
        <g:if test="${user}">
            <table class="table">
                <tr>
                    <th class="text-right"><g:message code="firstname"/></th>
                    <td class="text-left">${user.firstname}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="lastname"/></th><td class="text-left">${user.lastname}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="address"/></th><td class="text-left">${user.address}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="phone"/></th><td class="text-left">${user.phone}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="birthdate"/></th><td
                        class="text-left">${user.birthdate}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="email"/></th><td class="text-left">${user.email}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="userType"/></th><td class="text-left">${user.userType}</td>
                </tr>
            </table>
        </g:if>
        <div class="form-action-panel">
            <g:link controller="user" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>
        </div>
    </div>
</div>