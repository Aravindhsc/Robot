*** Settings ***
Resource    ../Utility/Resource_file.robot


*** Variables ***
#Table#
${TABLE_ROW}                    xpath=//table//tr

*** Keywords ***
KW Validate user details
    ${element_count}    Get Element Count                              ${TABLE_ROW}
    &{user_dictionary}     Create Dictionary           # Creates a dictonary 
    :FOR    ${i}    IN RANGE    2   ${element_count}+1        #Iterates into the table coloumn
    \    ${key_data}            Get Text    xpath=//table//tr[${i}]/td
    \    ${Value_data}          Get Text    xpath=//table//tr[${i}]/td[2]
    \    Set To Dictionary    ${user_dictionary}    ${key_data}    ${Value_data}    # Set the values into dictonary
    
    
    @{test_data_list}    Create List    ${username}   ${Firstname}    ${Lastname}    ${phone_no}    # list containing expected values
    
    ${i}    Set Variable    0
    :FOR    ${key}  IN     @{user_dictionary}
    \    Should Be Equal As Strings    ${user_dictionary}[${key}]    ${test_data_list}[${i}]    
    \    ${i}    Evaluate    ${i}+1   
    
     
