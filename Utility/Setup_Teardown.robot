*** Settings ***
Resource    Resource_file.robot

*** Variables ***
${url}        http://127.0.0.1:8090
${Browser}    chrome



*** Keywords ***
Prepare suite setup
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window
    Log    Site ${url} is opened    
    

Prepare Suite Teardown
     Close All Browsers
     

Prepare EndTest
    ${Passed}    Run Keyword And Return Status    Wait Until Page Contains Element    ${LOGOUT_LINK}        
    Run Keyword If    '${Passed}'=='True'    KW Wait And Click Element    ${LOGOUT_LINK}    