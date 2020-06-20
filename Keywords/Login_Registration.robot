*** Settings ***
Resource    ../Utility/Resource_file.robot


*** Variables ***
${REGISTER_TITLE}               //h1[text()='Register']
${REGISTER_LINK}                xpath=//a[@href="/register"]
${LOGIN_LINK}                   xpath=//a[@href="/login"]
${USERNAME_INPUT}               id=username
${PASSWORD_INPUT}               id=password
${FIRSTNAME_INPUT}              id=firstname
${LASTNAME_INPUT}               id=lastname
${PHONE_NO_INPUT}               id=phone
${REGISTER_BUTTON}              xpath=//input[@value="Register"]
${USER_EXIST_ERROR}             //div[@class='flash']
${LOGIN_BUTTON}                 xpath=//input[@value="Log In"]
${LOGOUT_LINK}                  xpath=//a[@href="/logout"]
${LOGIN_TITLE}                  xpath=//h1[text()='Log In']
${LOGIN_FAILURE}                xpath=//*[@class='content']/p[1]
${USERNAME_TITLE}               //span

*** Keywords ***
KW Register Into Application
    [Arguments]    ${usrname}    ${password}    ${Firstname}    ${Lastname}    ${phone_no}
    KW Wait And Click Element                     ${REGISTER_LINK}
    Wait Until Page Contains Element              ${REGISTER_TITLE} 
    Input Text                                    ${USERNAME_INPUT}    ${usrname}   
    Input Text                                    ${PASSWORD_INPUT}    ${password} 
    Input Text                                    ${FIRSTNAME_INPUT}   ${Firstname}   
    Input Text                                    ${LASTNAME_INPUT}    ${Lastname}    
    Input Text                                    ${PHONE_NO_INPUT}    ${phone_no} 
    KW Wait And Click Element                     ${REGISTER_BUTTON}
    ${PASSED}=   Run Keyword And Return Status    Wait Until Page Contains Element        ${USER_EXIST_ERROR}        
    Run Keyword If        '${PASSED}'=='True'     log    User with Username: ${username} is already registered    
    ...    ELSE                                   Page Should Contain Element    ${LOGIN_TITLE}    
    KW Capture Screenshot                         Registration Page  
         
KW Login To Application    
    [Arguments]        ${usrname}    ${passwrd}
    KW Wait And Click Element                      ${LOGIN_LINK}
    Wait Until Page Contains Element               ${LOGIN_TITLE}    10
    Input Text                                     ${USERNAME_INPUT}    ${usrname}
    Input Password                                 ${PASSWORD_INPUT}    ${passwrd}   
    KW Wait And Click Element                      ${LOGIN_BUTTON} 
    ${PASSED}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${LOGOUT_LINK}
    Run Keyword If        '${PASSED}'=='False'     FW Handle Login Failure         
    ${Actual_username}=    Run Keyword If          '${PASSED}'=='True'    Get Text    ${USERNAME_TITLE}
    Run Keyword If        '${PASSED}'=='True'      Should Be Equal As Strings    ${Actual_username}    ${usrname} 
    KW Capture Screenshot                          Login Successful    
 
FW Handle Login Failure
    Wait Until Page Contains Element               ${LOGIN_FAILURE} 
    ${Failure_text}    Get Text                    ${LOGIN_FAILURE}
    KW Capture Screenshot                          Login Failure
    