# Entfernt alte Dateien aus dem Zielverzeichnis, aber lässt ".git" unberührt
Get-ChildItem -Path ..\kochbuch_ghpages -Recurse -Force | Where-Object { $_.FullName -notmatch '\\\.git($|\\)' } | Remove-Item -Recurse -Force

# Kopiert Dateien aus "public" nach "..\kochbuch_ghpages", behält Verzeichnisstruktur bei, ignoriert ".git"
Get-ChildItem -Path public -Recurse -File | Where-Object { $_.FullName -notmatch '\\\.git($|\\)' } | ForEach-Object {
    $targetPath = $_.FullName -replace [regex]::Escape((Get-Item public).FullName), (Get-Item ..\kochbuch_ghpages).FullName
    $targetDir = Split-Path -Parent $targetPath
    if (!(Test-Path $targetDir)) { New-Item -ItemType Directory -Path $targetDir -Force }
    Copy-Item -Path $_.FullName -Destination $targetPath -Force
}

Write-Output "Deployment abgeschlossen."
