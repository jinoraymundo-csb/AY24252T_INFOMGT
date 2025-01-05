# SQL Server 2019 Developer Edition

[Download Link](https://go.microsoft.com/fwlink/?linkid=866662)

1. Choose "Basic" as the installation type
![Step 01 - Basic](images/01.png)

2. Accept License Terms
![Step 02 - Accept License](images/02.png)

3. Select installation location, then click on "Install"
![Step 03 - Select installation location](images/03.png)

4. Installation Progress
![Step 04 - Installation Progress](images/04.png)

5. Insallation Completion
![Step 05 - Installation Completion](images/05.png)

---

# SQL Server Management Studio 20.2

[Download Link](https://aka.ms/ssmsfullsetup)

1. Click on "Install"
![Step 01 - Click install](images/06.png)

2. Installation Progress
![Step 02 - Installation Progress](images/07.png)

3. Installation Completion
![Step 03 - Installation Completion](images/08.png)


---

# Initial SSMS Setup (enable sa login)

1. Run "PowerShell" or "Command Prompt"
2. type in "sqlcmd" then press enter/return
3. Run the following in sequence: (hit enter/return after every end of the line)
```
1> USE [master]
2> GO
```

```
1> ALTER LOGIN [sa] WITH PASSWORD=N'benilde'
2> GO
```

```
1> ALTER LOGIN [sa] ENABLE
2> GO
```

```
1> exit
```

---

# 