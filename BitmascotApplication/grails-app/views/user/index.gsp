%{--Include Main Layout--}%
<meta name="layout" content="main"/>

<div class="card">
    <div class="card-header">
<g:message code="user" args="['List Of']"/>

%{--Actions--}%
<span class="float-right">

    %{--Search Panel --}%
    <div class="btn-group">
        <g:form controller="user" action="index" method="GET">
            <div class="input-group" id="search-area">
                <g:select name="colName" class="form-control" from="[email: 'Email']"
                          value="${params?.colName}" optionKey="key" optionValue="value"/>
                <g:textField name="colValue" class="form-control" value="${params?.colValue}"/>
                <span class="input-group-btn">
                    <button class="btn btn-warning" type="submit">Search</button>
                </span>
            </div>
        </g:form>
    </div>

    %{--Create and Reload Panel--}%
    <div class="btn-group">
        <g:link controller="user" action="create" class="btn btn-success"><g:message code="create"/></g:link>
        <g:link controller="user" action="index" class="btn btn-primary"><g:message code="reload"/></g:link>
    </div>
</span>


%{--Table Panel--}%
<div class="card-body">
    <table class="table">
        <thead>
        <tr>
            <g:sortableColumn property="id" title="${g.message(code: "id")}"/>
            <g:sortableColumn property="firstname" title="${g.message(code: "firstname")}"/>
            <g:sortableColumn property="lastname" title="${g.message(code: "lastname")}"/>
            <g:sortableColumn property="address" title="${g.message(code: "address")}"/>
            <g:sortableColumn property="phone" title="${g.message(code: "phone")}"/>
            <g:sortableColumn property="email" title="${g.message(code: "email")}"/>
            <g:sortableColumn property="birthdate" title="${g.message(code: "birthdate")}"/>
            <th class="action-row"><g:message code="action"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userList}" var="info">
            <tr>
                <td>${info?.id}</td>
                <td>${info?.firstname}</td>
                <td>${info?.lastname}</td>
                <td>${info?.address}</td>
                <td>${info?.phone}</td>
                <td>${info?.email}</td>
                <td>${info?.birthdate}</td>

                %{--Table Actions --}%
                <td>
                    <div class="btn-group">
                        <g:link controller="user" action="details" class="btn btn-secondary" id="${info.id}"><i
                                class="fas fa-eye"></i></g:link>
                        <g:link controller="user" action="edit" class="btn btn-secondary" id="${info.id}"><i
                                class="fas fa-edit"></i></g:link>
                        <g:link controller="user" action="delete" id="${info.id}"
                                class="btn btn-secondary delete-confirmation"><i class="fas fa-trash"></i></g:link>
                    </div>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    %{--Pagination Area--}%
    <div class="paginate">
        <g:paginate total="${total ?: 0}"/>
    </div>
</div>
</div>