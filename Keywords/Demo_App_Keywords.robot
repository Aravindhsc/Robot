*** Settings ***
Resource    ../Utility/Resource_file.robot


*** Variables ***
${SCREENSHOTS}                  ${EXECDIR}${/}Screenshots${/}  # Folder to store the screenshots
${APP_TITLE}                    xpath=//a[@href="/"]




*** Keywords ***
KW Validate Page
    ${Actual_title}    KW Wait And Get Text       ${APP_TITLE}        
    Should Be Equal As Strings                    ${Page_title}    ${Actual_title}        
    Page Should Contain Element                   ${REGISTER_LINK}    
    Page Should Contain Element                   ${LOGIN_LINK}  
    KW Capture Screenshot                         Demo App       
    
  
    


    
