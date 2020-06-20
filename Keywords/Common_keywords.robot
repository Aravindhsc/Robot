*** Settings ***
Resource    ../Utility/Resource_file.robot

*** Keywords ***
KW Wait And Click Element
	[Arguments]								${element}	
	Wait Until Page Contains Element        ${element}    10
    Click Element                           ${element}
    
KW Wait And Get Text
    [Arguments]                             ${elements}
    Wait Until Page Contains Element        ${elements}    10
    ${text}    Get Text                     ${elements}   
    [Return]                                ${text}
    
KW Capture Screenshot
    [Arguments]                             ${File_name}
    Capture Page Screenshot                 ${SCREENSHOTS}${File_name}.png