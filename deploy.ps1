# Entfernt alle Elemente im Zielverzeichnis, außer dem ".git"-Ordner
Get-ChildItem -Path ..\kochbuch_ghpages -Force | Where-Object { $_.Name -ne '.git' } | Remove-Item -Recurse -Force

# Kopiert alle Dateien aus "public" nach "..\kochbuch_ghpages", behält die Verzeichnisstruktur bei 
# und überspringt alle Dateien, die im Pfad ein ".git"-Verzeichnis haben.
Get-ChildItem -Path public -Recurse -File | Where-Object { $_.FullName -notmatch '\\\.git($|\\)' } | ForEach-Object {
    $targetPath = $_.FullName -replace [regex]::Escape((Get-Item public).FullName), (Get-Item ..\kochbuch_ghpages).FullName
    $targetDir = Split-Path -Parent $targetPath
    if (!(Test-Path $targetDir)) { New-Item -ItemType Directory -Path $targetDir -Force }
    Copy-Item -Path $_.FullName -Destination $targetPath -Force
}

Write-Output "Deployment abgeschlossen."