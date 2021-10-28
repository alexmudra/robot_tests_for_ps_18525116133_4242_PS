*** Variables ***
${str}=    ${SPACE}${SPACE}${SPACE}foo${SPACE}${SPACE}${SPACE}


*** Test Cases ***

print string
      log    ${str}         # will be printed with spaces around it
      log    ${str.strip()} # will be printed without spaces around it