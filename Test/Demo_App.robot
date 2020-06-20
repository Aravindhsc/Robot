*** Settings ***
Resource    ../Utility/Resource_file.robot


Suite Setup            Prepare suite setup
Suite Teardown         Prepare Suite Teardown
Test Teardown          Prepare EndTest

*** Test Cases ***
Verify Register page
    ${PASSED}=    Run Keyword And Return Status    KW Validate Page
    Run Keyword If    '${PASSED}'=='True'          Log    HomePage has been Validated successfully     

Register In To Application
    ${PASSED}=    Run Keyword And Return Status    KW Register Into Application    ${username}    ${password}    ${Firstname}    ${Lastname}    ${phone_no}
    Run Keyword If    '${PASSED}'=='True'          Log    User with Username: ${username} is registered successfully

Login To Application
    KW Login To Application    ${username}    ${password}
    Log    User Logged into the application successfully
    
Validate User Details
    KW Login To Application    ${username}    ${password}
    ${PASSED}=    Run Keyword And Return Status    KW Validate user details
    Run Keyword If    '${PASSED}'=='True'          Log    Validation of user details was successful
    KW Capture Screenshot                          Table validation    