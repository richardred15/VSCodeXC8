# VSCodeXC8

## A simple template for editing C and compiling with XC8

An additional script for the PICKit 3 is included - easily modified for PK4/ICE etc

## Setup
### tasks.json
The args must be updated to fit your device
```json
{
    "type": "shell",
    "label": "Build",
    "command": "./scripts/build.bat",
    "args": ["<part e.g. 18F24K40>", "${workspaceFolderBasename}", "<errata>"],
    "group": "build",
    "problemMatcher": [
        "$gcc"
    ]
}
```

### Terminal Output

```
<standard MPLABX output>

<info.py output>
==============================================================
|                        PIC Mem Free                        |
|                                                            |
|                                                            |
|     Program Memory: 6013 bytes used                        |
|          ██████████████░░░░░░░░░░░░░░░░░░░░░░░░░░ 36.7%    |
|                     10371 bytes free                       |
|                                                            |
|     Data Memory:    228 bytes used                         |
|          ████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ 22.2%    |
|                     796 bytes free                         |
==============================================================
```