*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource    common.robot

*** Variable ***
${barrier_input}    dt_barrier_1_input
${error_tooltip}    //*[@data-tooltip="Contracts more than 24 hours in duration would need an absolute barrier."]
${btn_disabled}     //*[@class="btn-purchase btn-purchase--disabled btn-purchase--2"]

*** Keywords ***
Barrier Error
    clear input field       ${barrier_input}
    input text      ${barrier_input}    +1
    clear input field       ${payout_input}
    input text      ${payout_input}     10
    wait until page contains element        ${error_tooltip}    60
    wait until page contains element    ${btn_disabled}       60
