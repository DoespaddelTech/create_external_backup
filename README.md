# create_external_backup
bash script to run external backup with iserv-backup2-client on LUKS-encrypted external file system

# Vorbereitung
Verschlüsseltes LUKS-Dateisystem auf externer Festplatte (am Haupt-IServ angeschlossen) einrichten, dabei nach dieser Anleitung vorgehen und auch den Header sichern (USB-Stick).
https://wiki.ubuntuusers.de/LUKS/Partitionen_verschl%C3%BCsseln/
https://wiki.ubuntuusers.de/LUKS/Passwort_und_Headerverwaltung/

# Einrichtung
```iserv-backup2-client```installieren, mit ```iservcfg``` ein neues (lokale) Sicherungsprofil erstellen und dieses z.B. nach ```/root/externalbackup``` verschieben.
Alle Pfade im Skript anpassen, Skript ausführbar machen und nach Bedarf ausführen. Die Festplatte danach  aus der Schule bringen und woanders aufbewahren, sonst ergibt das alles keinen Sinn 😉

# backup1 oder backup2?
Wenn schon Backup2 installiert ist, entfallen die Schritte im Skript natürlich, die es temporär installieren und wieder deinstallieren.
Im Skript wird das so gehandhabt, weil die Verwaltungsoberfläche sonst jeden Tag einen Fehler anzeigt. 


# Motivation
Die externe Festplatte enthält ein verschlüsseltes Backup.
Dieses wird außerhalb des Schulgebäudes aufbewahrt. Durch die Verschlüsselung wird sichergestellt, dass niemand auf persönliche und sensible Daten zugreifen kann. 
Das externe Backup dient als Ausfallsicherung. Der Backupserver im Schulgebäude sichert jede Nacht einmal die Daten. Falls sowohl der Hauptserver als auch der Backupserver ausfallen (Spannungsspitzen nach Blitzschlag, Feuer), ist zumindest ein (höchstens einen Monat altes) Backup noch vorhanden. Immerhin.
