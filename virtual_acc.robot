*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Keywords ***
Switch Account
    wait until page does not contain element    //*[@class="chart-container__loader"]       60
    wait until page contains element    ${user_acc}     120
    click element   ${user_acc}
    wait until page contains element    ${real_acc_tab}     60
    click element   ${switch_acc}
    wait until page contains element    ${demo_acc_tab}   60
    click element   ${switch_to_demo_acc}

