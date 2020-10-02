*** Settings ***
Library           Selenium2Library

*** Variables ***
${Username}       id=txtUsername
${Password}       id=txtPassword
${btnLogin}       id=btnLogin
${verifyElement}    xpath=//*[@id="branding"]/a[1]/img
${btnAdmin}       id=menu_admin_viewAdminModule
${txtUsername}    id=searchSystemUser_userName
${dropdownUserRole}    id=searchSystemUser_userType
${txtEmployeeName}    id=searchSystemUser_employeeName_empName
${dropdownStatus}    id=searchSystemUser_status
${btnSearch}      id=searchBtn
${btnWelcome}     id=welcome
${btn_Logout}     xpath=/html/body/div[1]/div[1]/div[10]/ul/li[2]/a
${chkHannah}      id=ohrmList_chkSelectRecord_3
${btnLeave}       id=menu_leave_viewLeaveModule
${btnApply}       id=menu_leave_applyLeave
${dropdownLeaveType}    name=applyleave[txtLeaveType]
${imgDate}        class=ui-datepicker-trigger
${btn15}          xpath=//*[@id="ui-datepicker-div"]/table/tbody/tr[3]/td[2]/a
${dropdownMonth}    xpath=//*[@id="ui-datepicker-div"]/div/div/select[1]
${btnApplyLeave}    id=applyBtn

*** Test Cases ***
TC_NavigateToURL
    [Documentation]    This test case is to navigate user to URL https://opensource-demo.orangehrmlive.com/
    Open Browser    https://opensource-demo.orangehrmlive.com/    gc

TC_Login
    Input Text    ${Username}    Admin
    Input Text    ${Password}    admin123
    Click Button    ${btnLogin}
    Element should be visible    ${verifyElement}
    Maximize Browser Window

TC_Admin
    Click element    ${btnAdmin}
    Input Text    ${txtUsername}    hannah.flores
    Select From List By Index    ${dropdownUserRole}    2
    Input text    ${txtEmployeeName}    Hannah Flores
    Select From List By Index    ${dropdownStatus}    1
    Click element    ${btnSearch}
    Select checkbox    ${chkHannah}

TC_Leave
    Click element    ${btnLeave}
    Click element    ${btnApply}
    Select From List By Index    ${dropdownLeaveType}    1
    Click image    ${imgDate}
    Click element    ${btn15}
    Select From List By Index    ${dropdownMonth}    09
    Click element    ${btnApplyLeave}

TC_Logout
    Click element    ${btnWelcome}
    Wait Until Element Is Visible    ${btn_Logout}
    Click element    ${btn_Logout}
    Close Browser
