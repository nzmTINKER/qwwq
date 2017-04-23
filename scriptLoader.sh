#!/bin/bash
. /home/nzm/qwwq/qwwq.sh #load qwwq

loadScripts() {
  loadConfiguration
  lastErrorCode="0"
  ###
  for scriptFile in ${scriptFiles[@]}
        do
          [[ -f $scriptDirectory/$scriptFile ]] && . $scriptDirectory/$scriptFile
          lastErrorCode=$?
          output $lastErrorCode $scriptFile "Executed and returned:"
        done
}

helpScreen() {
  echo -e "
$script - loading automatically all scripts provided to $scriptConfig
Made with qwwq.sh bash-libary (http://github.com/nzmTINKER/qwwq)

--help :                Printing this help screen
--update :              Updating this script automatically
--reset-configuration : Resetting configuration.

--load-scripts :       Executing all script files which were
                        provided to $scriptConfig
"
}

### ******* LOGIC *******
[[ "$1" == '' ]] && lastErrorCode="2" && badArguments

while [ "$1" != '' ]
  do
    [[ $1 == "--load-scripts" ]] && loadScripts && shift

    [[ $1 == "--help" ]] && helpScreen && exit 0
    [[ $1 == "--update" ]] && update && shift
    [[ $1 == "--reset-configuration" ]] && resetConfiguration && shift
  done
### ******* END OF LOGIC *******
