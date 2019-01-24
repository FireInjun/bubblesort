function gitmod () {
  git config core.autocrlf
  git config --global --unset core.autocrlf 
  git config --system --unset core.autocrlf 
  git config --file $env:PROGRAMDATA/Git/config --unset core.autocrlf
  git config --global --add core.autocrlf False
  git config --system --add core.autocrlf False
  git config --file $env:PROGRAMDATA/Git/config --add core.autocrlf False
  git config core.autocrlf
}
function resetrepo {
  function A {$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")|out-null}
  function CH {Clear-Host}
  CH
  Write-Host "Brought to you by Mykeal 'FireInun' Kenny"
  if (test-path .git) {
    Write-Host "`n`n Done worry! We`'re going to save any changes you may have made!`
  n`n press any key to continue >:"; A
  }
  else {
    write-host "This isn`'t a repo check that you're in the right directory"; break
  }
  CH; git add . -u
  git commit -m "Saving files before refreshing line endings"
  remove-item -Path .git\index -Force
  "text eol=lf" > .gitattributes
  CH; git reset; git status; git add -u; git add .gitattributes
  git commit -m "Normalize all the line endings"
  CH
}

gitmod; resetrepo