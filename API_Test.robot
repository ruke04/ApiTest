*** Settings ***
Library           My_keywords.py

*** Variables ***
${URL}    


*** Test Cases ***
Test GET All Items from Server
    ${response} =    Get Request    ${URL}/items
    ${items}=    To Json    ${response.content}
    # Validations 
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${items}    [{'name': 'item_0'}, {'name': 'item_1'}, {'name': 'item_2'}, {'name': 'item_3'}, {'name': 'item_4'}]

*** Test Cases ***
Test GET Item from Server by Using Filter 
    ${response}=    Get Request    ${URL}/items/item_0
    ${items}=    To Json    ${response.text}
    #Validations
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${items}   {'name': 'item_0'}

*** Test Cases ***
Test POST Item to Server
    ${data} =   Create Dictionary    name=item_name     email=test@ssh.com
    ${response} =    Post Request    ${URL}/items/    ${data}
    ${item}=    To Json    ${response.text}
    #Validations
    Should Be Equal As Strings    ${response.status_code}    201
    Should Be Equal As Strings   ${item}    {'name': 'item_name', 'email': 'test@ssh.com'}

*** Test Cases ***
Test DELETE Item from Server
    ${response}=    Delete Request   ${URL}/items/item_name
    Should Be Equal As Integers    ${response.status_code}    204
