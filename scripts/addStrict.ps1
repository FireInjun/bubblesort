function strictlyNaming {
  $strict = '"use strict";';
  $pwdregex = 'bubblesort$';
  $pwdback = 'bubblesort\\\w+';
  $Locations = @(Get-ChildItem -Recurse -file -include *.js -Attributes !Directory)
  function addLocName {
    foreach ($Location in $Locations) {
      $locName = '//' + ' ' + $Location.name;
      $locPlace = $Location.fullname;
      Add-Content -Path $locPlace -Value $locName
    }
  }
  function findLoc {(Get-Location).ToString()}
  function checkLoc {
    $d = findLoc; 
    if ($d -match $pwdregex) {
      firstLine
    }
    else {
      backOne
    }
  }
  function backOne {
    if ($d -match $pwdback) {
      set-location ..;
      checkLoc
    }
    else {
      break
    }
    checkLoc
  }
  function firstLine {
    set-location .\src\ ;     
    foreach ($Location in $Locations) {
      $locPlace = $Location.fullname;
      Add-Content -Path $locPlace -Value $strict
    }
    addLocName
  }
  checkLoc
}
strictlyNaming