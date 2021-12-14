*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Keywords ***
Login
    [arguments]     ${email}    ${pw}
    open browser    url=https://app.deriv.com   browser=chrome
    set window size     1440    1024
    wait until page does not contain    dt_core_header_acc-info-preloader   60
    wait until page contains element    ${login_btn}     60
    click element   ${login_btn}
    wait until page contains element    ${email_field}    15
    input text      ${email_field}      ${email}
    input text      ${pw_field}     ${pw}
    click element   ${login_oauth_btn}

Clear Input Field
    [arguments]     ${field_input}
    ${current_value}=   get element attribute   ${field_input}     value
    ${value_length}=    Get Length  ${current_value}
    Repeat Keyword  ${value_length}  press keys  ${field_input}  BACKSPACE
    Repeat Keyword  1     press keys  ${field_input}  DELETE

