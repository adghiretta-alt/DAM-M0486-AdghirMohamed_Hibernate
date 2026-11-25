# run.ps1

# Change to the directory where the script is located
Set-Location $PSScriptRoot

# Set MAVEN_OPTS environment variable
$env:MAVEN_OPTS="--add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED"

# The first argument is the main class (com.project.Main if none is given)
if ($args.Count -gt 0) { $mainClass = $args[0] } else { $mainClass = "com.project.Main" }

Write-Host "Setting MAVEN_OPTS to: $env:MAVEN_OPTS"
Write-Host "Main Class: $mainClass"

# Execute mvn command with the profile and main class as arguments
$execArg = "-Dexec.mainClass=" + $mainClass
Write-Host "Exec args: $execArg"

mvn clean test-compile exec:java -PrunMain $execArg