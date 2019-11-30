<div class="form-group">
    <label><g:message code="firstname"/> *</label>
    <g:textField name="firstname" id="firstname" class="form-control" value="${user?.firstname}"
                 placeholder="Please Enter First Name"/>
    <span id="errorNameMessage"></span>
</div>

<div class="form-group">
    <label><g:message code="lastname"/> *</label>
    <g:textField name="lastname" id="lastname" class="form-control" value="${user?.lastname}"
                 placeholder="Please Enter Last Name"/>
    <span id="errorLastNameMessage"></span>
</div>

<div class="form-group">
    <label><g:message code="address"/> *</label>
    <g:textField name="address" id="address" class="form-control" value="${user?.address}"
                 placeholder="Please Enter Address"/>
    <span id="errorAddressMessage"></span>
</div>

<div class="form-group">
    <label><g:message code="phone"/> *</label>
    <g:textField name="phone" id="phone" class="form-control" value="${user?.phone}"
                 placeholder="Please Enter Phone"/>
    <span id="errorPhoneMessage"></span>
</div>

<div class="form-group">
    <label><g:message code="email"/> *</label>
    <g:field type="email" name="email" id="email" class="form-control" value="${user?.email}"
             placeholder="Please Enter Email"/>
    <span id="errorEmailMessage"></span>
</div>

<div class="form-group">
    <label><g:message code="birthdate"/> *</label>
    <g:field type="date" name="birthdate" id="birthdate" class="form-control" value="${user?.birthdate}"/>
    <span id="errorDateMessage"></span>
</div>
<g:if test="${!edit}">
    <div class="form-group">
        <label><g:message code="password"/> *</label>
        <g:passwordField name="password" id="password" class="form-control" value="${user?.password}"
                         placeholder="Please Enter Password"/>
        <span id="errorPasswordMessage"></span>
    </div>
</g:if>