---
title: Bulk update Scriptable Objects from CSV/JSON in Unity via C# code
categories: [unity,opensource]
---
Got a database as CSV or JSON file and you would like to use it to update Scriptable Objects in bulk? Check this out!

<p class="text-center">🧰📝🔄</p>

<!--more-->

## Parse CSV

### File pre-requirements
- Must be located in `Assets/Resources/myfolder`
- Mus have an extension in `txt,html,htm,xml,bytes,json,csv,yaml,fnt`. Note: `tsv`is not supported. (https://forum.unity.com/threads/tsv-file-as-textassets.495244/)

### Doc
- TextAsset https://docs.unity3d.com/ScriptReference/TextAsset.html

```csharp
using UnityEngine;
using UnityEditor;
using System.Collections;
using System.Collections.Generic;
using System.Linq; // for Cast()

public class UnityTools : MonoBehaviour {
 
    [MenuItem("Tools/FCO/Compute Characters")]
    static void ComputeCharacters(){
        Debug.Log("ComputeCharacters: start");
        TextAsset asset = Resources.Load<TextAsset>("myfolder/db_characters"); // no extension
        string[] lines = asset.text.Split('\n'); // line separator, i.e. newline
        lines = lines.Skip(1).Take(lines.Length-1 - 1).ToArray(); // remove header and last empty line
        foreach (string line in lines){
            string[] cols = line.Split('\t'); // column separator, i.e. tabulation
            Debug.Log("col0: "+col[0]); // will display first column for each line
        }
    }
```

## Update Scriptable Object

### Pre requirements
- Scriptable Objects must be located in `Assets/Resources/myfolder2`

```csharp
Skill[] skills = Resources.LoadAll("myfolder2", typeof(Skill)).Cast<Skill>().ToArray(); // load all "Skill" Scriptable Objects
foreach(Skill skill in skills){
  skill.id = id; // update any field
  skill.slots = new List<string>{"a", "b"}; // even List
  EditorUtility.SetDirty(skill); // flag SO as dirty
}
Debug.Log("ComputeCharacters: saving db");
AssetDatabase.SaveAssets(); // save assets to disk
AssetDatabase.Refresh(); // refresh editor
Debug.Log("ComputeCharacters: end");
```
